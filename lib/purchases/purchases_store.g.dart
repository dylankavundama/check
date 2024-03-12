// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurchasesStore on _PurchasesStoreBase, Store {
  late final _$hasJustPurchasedMonthlyAtom = Atom(
      name: '_PurchasesStoreBase.hasJustPurchasedMonthly', context: context);

  @override
  bool get hasJustPurchasedMonthly {
    _$hasJustPurchasedMonthlyAtom.reportRead();
    return super.hasJustPurchasedMonthly;
  }

  @override
  set hasJustPurchasedMonthly(bool value) {
    _$hasJustPurchasedMonthlyAtom
        .reportWrite(value, super.hasJustPurchasedMonthly, () {
      super.hasJustPurchasedMonthly = value;
    });
  }

  late final _$hasJustPurchasedAnnualAtom = Atom(
      name: '_PurchasesStoreBase.hasJustPurchasedAnnual', context: context);

  @override
  bool get hasJustPurchasedAnnual {
    _$hasJustPurchasedAnnualAtom.reportRead();
    return super.hasJustPurchasedAnnual;
  }

  @override
  set hasJustPurchasedAnnual(bool value) {
    _$hasJustPurchasedAnnualAtom
        .reportWrite(value, super.hasJustPurchasedAnnual, () {
      super.hasJustPurchasedAnnual = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_PurchasesStoreBase.error', context: context);

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PurchasesStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasMonthlyEntitlementAtom =
      Atom(name: '_PurchasesStoreBase.hasMonthlyEntitlement', context: context);

  @override
  bool get hasMonthlyEntitlement {
    _$hasMonthlyEntitlementAtom.reportRead();
    return super.hasMonthlyEntitlement;
  }

  @override
  set hasMonthlyEntitlement(bool value) {
    _$hasMonthlyEntitlementAtom.reportWrite(value, super.hasMonthlyEntitlement,
        () {
      super.hasMonthlyEntitlement = value;
    });
  }

  late final _$hasAnnualEntitlementAtom =
      Atom(name: '_PurchasesStoreBase.hasAnnualEntitlement', context: context);

  @override
  bool get hasAnnualEntitlement {
    _$hasAnnualEntitlementAtom.reportRead();
    return super.hasAnnualEntitlement;
  }

  @override
  set hasAnnualEntitlement(bool value) {
    _$hasAnnualEntitlementAtom.reportWrite(value, super.hasAnnualEntitlement,
        () {
      super.hasAnnualEntitlement = value;
    });
  }

  late final _$successRestoreAtom =
      Atom(name: '_PurchasesStoreBase.successRestore', context: context);

  @override
  bool get successRestore {
    _$successRestoreAtom.reportRead();
    return super.successRestore;
  }

  @override
  set successRestore(bool value) {
    _$successRestoreAtom.reportWrite(value, super.successRestore, () {
      super.successRestore = value;
    });
  }

  late final _$restoreErrorAtom =
      Atom(name: '_PurchasesStoreBase.restoreError', context: context);

  @override
  bool get restoreError {
    _$restoreErrorAtom.reportRead();
    return super.restoreError;
  }

  @override
  set restoreError(bool value) {
    _$restoreErrorAtom.reportWrite(value, super.restoreError, () {
      super.restoreError = value;
    });
  }

  late final _$isMonthlyCheckedAtom =
      Atom(name: '_PurchasesStoreBase.isMonthlyChecked', context: context);

  @override
  bool get isMonthlyChecked {
    _$isMonthlyCheckedAtom.reportRead();
    return super.isMonthlyChecked;
  }

  @override
  set isMonthlyChecked(bool value) {
    _$isMonthlyCheckedAtom.reportWrite(value, super.isMonthlyChecked, () {
      super.isMonthlyChecked = value;
    });
  }

  late final _$monthlySubscriptionAsyncAction =
      AsyncAction('_PurchasesStoreBase.monthlySubscription', context: context);

  @override
  Future<dynamic> monthlySubscription() {
    return _$monthlySubscriptionAsyncAction
        .run(() => super.monthlySubscription());
  }

  late final _$annualSubscriptionAsyncAction =
      AsyncAction('_PurchasesStoreBase.annualSubscription', context: context);

  @override
  Future<dynamic> annualSubscription() {
    return _$annualSubscriptionAsyncAction
        .run(() => super.annualSubscription());
  }

  late final _$restorePurchaseAsyncAction =
      AsyncAction('_PurchasesStoreBase.restorePurchase', context: context);

  @override
  Future<dynamic> restorePurchase() {
    return _$restorePurchaseAsyncAction.run(() => super.restorePurchase());
  }

  late final _$_PurchasesStoreBaseActionController =
      ActionController(name: '_PurchasesStoreBase', context: context);

  @override
  void setAnnualPlan() {
    final _$actionInfo = _$_PurchasesStoreBaseActionController.startAction(
        name: '_PurchasesStoreBase.setAnnualPlan');
    try {
      return super.setAnnualPlan();
    } finally {
      _$_PurchasesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMonthlyPlan() {
    final _$actionInfo = _$_PurchasesStoreBaseActionController.startAction(
        name: '_PurchasesStoreBase.setMonthlyPlan');
    try {
      return super.setMonthlyPlan();
    } finally {
      _$_PurchasesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasJustPurchasedMonthly: ${hasJustPurchasedMonthly},
hasJustPurchasedAnnual: ${hasJustPurchasedAnnual},
error: ${error},
isLoading: ${isLoading},
hasMonthlyEntitlement: ${hasMonthlyEntitlement},
hasAnnualEntitlement: ${hasAnnualEntitlement},
successRestore: ${successRestore},
restoreError: ${restoreError},
isMonthlyChecked: ${isMonthlyChecked}
    ''';
  }
}
