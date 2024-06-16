import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wa_tourism_app/View/CitiesPage.dart';
import 'package:wa_tourism_app/View/CulturalSpiritualFestivalsPage.dart';
import 'package:wa_tourism_app/View/TouristDestinationsPage.dart';
import 'package:wa_tourism_app/View/ethio.dart';
import 'package:wa_tourism_app/View/hotels_and_restaurants_page.dart';
import 'package:wa_tourism_app/View/login_page.dart';
import 'package:wa_tourism_app/View/signup_page.dart';
import 'package:wa_tourism_app/provider/cityProvider.dart';
import 'package:wa_tourism_app/provider/hotel_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyAu3kEUrOlhhkpn5JBRNstyzRvosCulnsM",
          authDomain: "tourapp-f8426.firebaseapp.com",
          projectId: "tourapp-f8426",
          storageBucket: "tourapp-f8426.appspot.com",
          messagingSenderId: "26500249634",
          appId: "1:26500249634:web:1d8d4458ccfdcc7cfff27b",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CityProvider()),
        ChangeNotifierProvider(create: (_) => HotelProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/ethiopia': (context) => EthioPage(),
        '/hotels_resturants': (context) => HotelsAndRestaurantsPage(),
        '/tourist_destination': (context) => TouristDestinationPage(),
        '/cultural_festivals': (context) => CultureAndSpiritualPage(),
        '/cities': (context) => CityListPage(),
      },
    );
  }
}