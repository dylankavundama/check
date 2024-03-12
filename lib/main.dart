import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart' as autt;
import 'package:flutter/material.dart';
import 'package:gayux/entitlement_checker.dart';
import 'package:gayux/login/login.dart';
import 'package:gayux/purchases/home_screen.dart';
import 'package:gayux/purchases/purchase_api.dart';
import 'package:gayux/purchases/purchases_store.dart';
import 'package:provider/provider.dart' as prov;
import 'package:firebase_core/firebase_core.dart';
import 'package:gayux/login/authServices.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PurchaseApi.init();
  await PurchasesStore().init();
  await Firebase.initializeApp();

  runApp(prov.MultiProvider(
    providers: [
      prov.StreamProvider<autt.User?>.value(
        initialData: null,
        value: AuthService().user,
      ),
    ],
    child: const HomeLogin(),
  ));
}

class HomeLogin extends StatefulWidget {
  const HomeLogin({
    Key? key,
  }) : super(key: key);

  @override
  _HomeLoginState createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  Future<void> initPlatformState() async {
    await Purchases.setDebugLogsEnabled(true);

    PurchasesConfiguration configuration;
    configuration = PurchasesConfiguration('goog_QTCPltSTmjPCiUwaqGaJcLFStwZ');
    await Purchases.configure(configuration);
  }

  @override
  Widget build(BuildContext context) {
    final _routerDelegate = routerDelegate(context);
    return BeamerProvider(
      routerDelegate: _routerDelegate,
      child: MaterialApp.router(
        title: 'Gayux',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.amber,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        routerDelegate: _routerDelegate,
        routeInformationParser: BeamerParser(),
        builder: (context, child) {
          return StreamBuilder(
            initialData: 'loading',
            stream: AuthService().user,
            builder: (context, snapshot) {
              if (snapshot.data.toString() != 'loading') return child!;
              return const CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }
}

routerDelegate(BuildContext context) {
  final _user = prov.Provider.of<autt.User?>(context);
  return BeamerDelegate(
    initialPath: '/home',
    notFoundRedirectNamed: '/home',
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '/home': (context, state) {
          return BeamPage(
            key: ValueKey('home'),
            title: 'Accueil/Lezzart Apps',
            type: BeamPageType.scaleTransition,
            //child: NaviagtionPage(),

            child: EntitlementChecker(),
          );
        },
        '/login': (context, state) {
          return BeamPage(
            key: ValueKey('login'),
            title: 'Connectez-vous/',
            type: BeamPageType.scaleTransition,
            child: Login(),
          );
        },
      },
    ),
    guards: [
      BeamGuard(
        pathBlueprints: ['/home', '/profile', '/detail', '/detail/*'],
        check: (context, location) => _user != null,
        beamToNamed: '/login',
      ),
      BeamGuard(
        pathBlueprints: ['/'],
        check: (context, location) => _user != null,
        beamToNamed: '/home',
      ),
      BeamGuard(
        pathBlueprints: ['/login', '/'],
        check: (context, location) => _user == null,
        beamToNamed: '/home',
      ),
    ],
  );
}
