import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swehlawe/Login.dart';
import 'dart:async';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://bkoellfptwcjbuxicjze.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrb2VsbGZwdHdjamJ1eGljanplIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg5NTM5MDYsImV4cCI6MjA2NDUyOTkwNn0.CbMwCDr9Pq1PbI3ZRyLQflrBnY99nzdvxebC3PuUsek',
  );
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()));
}


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset('images/logo.png', width: 300, height: 300),
          const SizedBox(height: 25),
        ]),
      ),
    );
  }
}
