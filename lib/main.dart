// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/User/ProfilePage.dart';
import 'screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/User/Login_and_Signin.dart';
import './screens/Home/home.dart';
import 'models/user_model.dart';
import 'screens/User/payment_page.dart';
import 'screens/User/addresses_page.dart';
import 'screens/User/orders_page.dart';
import 'screens/User/Wishlist.dart';
import 'screens/dashboard/AddProductPage.dart';
import 'screens/dashboard/MyProductsPage.dart';
import 'screens/dashboard/SalesAnalyticsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:
          "AIzaSyC7IbWkaVJFqL90nL_ZTco1d9fuUSfMtXY", // Clé API de votre configuration Firebase
      appId:
          "1:354407730492:android:395e2880c44f6601732239", // ID de l'application Android
      messagingSenderId: "354407730492", // Numéro de projet
      projectId: "e-commerce-8e85a", // ID du projet Firebase
      storageBucket:
          "e-commerce-8e85a.firebasestorage.app", // Bucket de stockage
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4CAF50),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(user: _getCurrentUser()),
      routes: {
        '/main': (context) => MainScreen(user: _getCurrentUser()),
        '/login': (context) => const LoginScreen(),
        '/Home': (context) => const HomeScreen(),
        '/profile': (context) => ProfilePage(user: _getCurrentUser()),
        '/payment': (context) => const PaymentPage(),
        '/addresses': (context) => const AddressesPage(),
        '/orders': (context) => const OrdersPage(),
        '/wishlist': (context) => const WishlistPage(),
        '/add-product':(context) => const  AddProductPage(),
        '/my-products' : (context) => const MyProductsPage(),
        '/sales-analytics' : (context) => const SalesAnalyticsPage()
      },
    );
  }

  UserModel _getCurrentUser() {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? 'no-email',
        isEmailVerified: firebaseUser.emailVerified,
      );
    } else {
      // Retourner un utilisateur par défaut ou gérer le cas où l'utilisateur n'est pas connecté
      return UserModel(
          uid: 'no-uid', email: 'no-email', isEmailVerified: false);
    }
  }
}
