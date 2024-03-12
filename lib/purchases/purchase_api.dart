import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'dart:io' show Platform;

class Products {
  static const String monthlyID ='monthly_subscription';
  static const String yearlyID = 'yearly_subscription';
}

class PurchaseApi {
  static const _googleApiKey = 'goog_QTCPltSTmjPCiUwaqGaJcLFStwZ';
  static const _appleApiKey = '';
  Package? package;

  static Future init() async {
    await Purchases.setLogLevel(LogLevel.debug);
    PurchasesConfiguration configuration;
    if (Platform.isAndroid) {
      configuration = PurchasesConfiguration(_googleApiKey);
    } else {
      configuration = PurchasesConfiguration(_appleApiKey);
    }
    await Purchases.configure(configuration);
  }

  static Future<List<Offering>> fetchOffersByIds(List<String> ids) async {
    try {
      final offers = await fetchOffers();
      return offers.where((offers) => ids.contains(offers.identifier)).toList();
    } on PlatformException catch (e) {
      return [];
    }
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final offerings = await Purchases.getOfferings();
      print('aaaaaaaaaaaa $offerings');
      return offerings.all.values.toList();
    } on PlatformException catch (e) {
      return [];
    }
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future restorePurchase() async {
    await Purchases.restorePurchases();
  }
}
