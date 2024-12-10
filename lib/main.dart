import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/get_it.dart';
import 'package:fruits_hub_dashboard/Core/helper_funcition/OnGenrateRoute.dart';
import 'package:fruits_hub_dashboard/Core/services/supabaseStorageServices.dart';
import 'package:fruits_hub_dashboard/Features/dashboard/presentation/views/dashboardView.dart';
import 'package:fruits_hub_dashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabasestorageservices.initSupabase();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup_getit();
  runApp(const FruitHubDashboard());
}

class FruitHubDashboard extends StatelessWidget {
  const FruitHubDashboard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Dashboardview.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
