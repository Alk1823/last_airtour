import 'package:AirTours/services_auth/auth_service.dart';
import 'package:AirTours/views/Admin/add_admin.dart';
import 'package:AirTours/views/Admin/admin.dart';
import 'package:AirTours/views/Global/bottom_bar.dart';
import 'package:AirTours/views/Profile/ProfileView.dart';
import 'package:AirTours/views/Profile/add_balance.dart';
import 'package:AirTours/views/Profile/balance_credit_card.dart';
import 'package:AirTours/views/Profile/update_view.dart';
import 'package:AirTours/views/Welcome_pages/login_view.dart';
import 'package:AirTours/views/Welcome_pages/register_view.dart';
import 'package:AirTours/views/Welcome_pages/verification_view.dart';
import 'package:AirTours/views/Welcome_pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants/pages_route.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      bottomRoute: (context) => const Bottom(),
      verficationRoute: (context) => const VerifyEmailView(),
      welcomeRoute: (context) => const WelcomeView(),
      createFlightRoute: (context) => const CreateFlight(),
      addAdminRoute: (context) => const AddAdmin(),
      updateRoute: (context) => const UpdateView(),
      addBalanceRoute:(context) => const AddBalance(),
      profileRoute: (context) => const ProfileView()
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const Bottom();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const WelcomeView();
              
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
