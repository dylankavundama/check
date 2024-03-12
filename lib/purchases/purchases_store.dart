import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gayux/purchases/purchase_api.dart';

import 'package:mobx/mobx.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart' as purchases;

part 'purchases_store.g.dart';

class PurchasesStore = _PurchasesStoreBase with _$PurchasesStore;

abstract class _PurchasesStoreBase with Store {
  Package? package;

  @observable
  bool hasJustPurchasedMonthly = false;

  @observable
  bool hasJustPurchasedAnnual = false;

  @observable
  bool error = false;

  @observable
  bool isLoading = false;

  @observable
  bool hasMonthlyEntitlement = false;

  @observable
  bool hasAnnualEntitlement = false;

  @observable
  bool successRestore = false;

  @observable
  bool restoreError = false;

  @observable
  bool isMonthlyChecked = false;

  Future init() async {
    purchases.Purchases.addCustomerInfoUpdateListener((customerInfo) async {
      updatePurchaseStatus();
    });
  }

  Future updatePurchaseStatus() async {
    final customerInfo = await purchases.Purchases.getCustomerInfo();
    final entitlements = customerInfo.entitlements.active.values.toList();
    for (final entitlement in entitlements) {
      if (entitlement.identifier == 'monthly') {
        hasMonthlyEntitlement = true;
      } else {
        hasAnnualEntitlement = true;
      }
    }
  }

  @action
  Future monthlySubscription() async {
    try {
      isLoading = true;

      final offerings =
          await PurchaseApi.fetchOffersByIds([Products.monthlyID]);
      for (var offering in offerings) {
        package = offering.availablePackages[0];
        await PurchaseApi.fetchOffersByIds([Products.monthlyID]);
      }

      bool purchaseSuccess = await PurchaseApi.purchasePackage(package!);
      await purchases.Purchases.logIn(FirebaseAuth.instance.currentUser!.uid);

      if (purchaseSuccess) {
        hasJustPurchasedMonthly = true;
      }
      debugPrint(
          '===================$purchaseSuccess========================== ');
      debugPrint(
          '|||||||||||||||||||$hasJustPurchasedMonthly|||||||||||||||||||||||||| ');
      isLoading = false;
    } on PlatformException catch (e) {
      error = true;
    } catch (e) {
      error = true;
    }
    await PurchaseApi.fetchOffersByIds([Products.monthlyID]);
  }

  @action
  Future annualSubscription() async {
    try {
      isLoading = true;
      final offerings = await PurchaseApi.fetchOffersByIds([Products.yearlyID]);
      for (var offering in offerings) {
        package = offering.availablePackages[0];
      }

      bool purchaseSuccess = await PurchaseApi.purchasePackage(package!);
      await purchases.Purchases.logIn(FirebaseAuth.instance.currentUser!.uid);

      if (purchaseSuccess) {
        hasJustPurchasedAnnual = true;
        await purchases.Purchases.logIn(FirebaseAuth.instance.currentUser!.uid);
      }

      isLoading = false;
    } on PlatformException catch (e) {
      error = true;
    } catch (e) {
      error = true;
    }
    await purchases.Purchases.logIn(FirebaseAuth.instance.currentUser!.uid);
  }

  @action
  Future restorePurchase() async {
    try {
      isLoading = true;
      await purchases.Purchases.restorePurchases().whenComplete(() {
        successRestore = true;
      });
      if (successRestore) {
        init();
      }
      isLoading = false;
    } on PlatformException catch (e) {
      restoreError = true;
    } catch (e) {
      restoreError = true;
    }
  }

  @action
  void setAnnualPlan() {
    isMonthlyChecked = false;
  }

  @action
  void setMonthlyPlan() {
    isMonthlyChecked = true;
  }

  Future<void> clearPurchases() async {
    hasMonthlyEntitlement = false;
    hasAnnualEntitlement = false;
  }
}
