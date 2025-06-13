import 'package:flutter/material.dart';
import 'package:swehlawe/RegisterPage.dart';
// ignore: unused_import
import 'package:supabase_flutter/supabase_flutter.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // الشكل الأحمر أسفل الشاشة
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        // اسم المستخدم
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'USERNAME....',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // كلمة المرور
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'PASSWORD....',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'forgot password?',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // زر الدخول
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                          ),
                          child: const Text('دخول', style: TextStyle(fontSize: 18)),
                        ),
                        const SizedBox(height: 20),
                        // أو تسجيل الدخول بواسطة
                        const Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white, indent: 30)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('or login with',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Expanded(child: Divider(color: Colors.white, endIndent: 30)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/facebook.png'),
                                iconSize: 40),
                            const SizedBox(width: 20),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/google.png'),
                                iconSize: 40),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don’t have an account? ",
                                style: TextStyle(color: Colors.white)),
                            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  },
  child: Text(
    "Register Now",
    style: TextStyle(
      color: Colors.yellow,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
    ),
  ),
)

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // الشعار والنص العلوي
            Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo2.png',
                          width: 150, height: 150),
                      const SizedBox(height: 10),
                      const Text(
                        "مرحباً بك\nفي ناديك المفضل!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
