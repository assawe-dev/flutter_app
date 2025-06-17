import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login.dart';
import 'HomePage.dart'; // تأكد أن اسم الملف والكلاس صحيح ومطابق

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://bkoellfptwcjbuxicjze.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrb2VsbGZwdHdjamJ1eGljanplIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg5NTM5MDYsImV4cCI6MjA2NDUyOTkwNn0.CbMwCDr9Pq1PbI3ZRyLQflrBnY99nzdvxebC3PuUsek',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      routes: {
        '/login': (_) => const Login(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Check if user is logged in and route accordingly
    Future.delayed(const Duration(seconds: 2), () async {
      final session = Supabase.instance.client.auth.currentSession;
      if (session != null && session.user != null) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
