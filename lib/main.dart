import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login.dart';
import 'otpscreen.dart';
import 'signup.dart';

void main() async{
  await Supabase.initialize(
    url: 'https://izpbzfdenksiqsuoipww.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6cGJ6ZmRlbmtzaXFzdW9pcHd3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY1ODMyMzksImV4cCI6MjA0MjE1OTIzOX0.vGF8sY2KgPS9AsgZuHCpkZd_uE-OR7gqtSLq0uxfcPA',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,

      ),
      home: SignupScreen(),
    );
  }
}
