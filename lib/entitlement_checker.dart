import 'package:flutter/material.dart';
import 'package:gayux/HomePage.dart';
import 'package:gayux/purchases/home_screen.dart';
import 'package:gayux/purchases/purchases_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EntitlementChecker extends StatefulWidget {
  const EntitlementChecker({super.key});

  @override
  State<EntitlementChecker> createState() => _EntitlementCheckerState();
}

class _EntitlementCheckerState extends State<EntitlementChecker> {

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    await PurchasesStore().init();
  }


  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
          bool entitlement = PurchasesStore().hasMonthlyEntitlement || PurchasesStore().hasAnnualEntitlement;
          return entitlement ? HomePage() : HomeScreenPayement();
    });
  }
}
