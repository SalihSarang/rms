import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manager_portal/core/di/injector.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:manager_portal/features/auth/presentation/pages/auth_gate.dart';
import 'package:manager_portal/firebase_options.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<AuthBloc>())],
      child: MaterialApp(
        title: 'Manager Portal',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: PrimaryColors.defaultColor,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
      ),
    );
  }
}
