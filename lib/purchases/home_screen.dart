import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gayux/HomePage.dart';
import 'package:gayux/purchases/purchases_store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class HomeScreenPayement extends StatefulWidget {
  const HomeScreenPayement({super.key});
  @override
  State<HomeScreenPayement> createState() => _HomeScreenPayementState();
}

class _HomeScreenPayementState extends State<HomeScreenPayement> {
  Package? package;

  final store = PurchasesStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Observer(builder: (context) {
            return Column(
              children: [
                Image.asset(height: 444, 'assets/p.jpg'),

                const SizedBox(height: 10),

                GestureDetector(
                  onTap: () async {
                    await store.monthlySubscription();
                    if (store.hasJustPurchasedMonthly == true) {
                      if (!context.mounted) return;

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 380,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          11.0,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Subscribe",
                          style: GoogleFonts.abel(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                store.hasJustPurchasedMonthly
                    ? const Text(
                        'Has monthly subscribed',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                store.hasJustPurchasedAnnual
                    ? const Text(
                        'Has yearly subscribed',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    : Container(),
                const SizedBox(height: 11),
                //une annee
              ],
            );
          }),
        ),
      ),
    );
  }
}
