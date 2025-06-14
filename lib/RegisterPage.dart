import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool isLoading = false;

  Future<void> _registerUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmController.text;
    final username = usernameController.text.trim();

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      _showMessage("الرجاء تعبئة جميع الحقول");
      return;
    }

    if (password != confirmPassword) {
      _showMessage("كلمة المرور غير متطابقة");
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );

      if (response.user != null) {
        _showMessage("تم التسجيل بنجاح! قم بتسجيل الدخول.");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      }
    } catch (e) {
      _showMessage("خطأ في التسجيل: ${e.toString()}");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.14,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    const Text(
                      "مرحباً سجل واستمتع\nبتجربتك معنا..",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField("USERNAME....", Icons.person, controller: usernameController),
                    const SizedBox(height: 15),
                    _buildTextField("email....", Icons.email, controller: emailController),
                    const SizedBox(height: 15),
                    _buildTextField("password....", Icons.lock,
                        controller: passwordController, obscure: true),
                    const SizedBox(height: 15),
                    _buildTextField("confirm password....", Icons.lock,
                        controller: confirmController, obscure: true),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: isLoading ? null : _registerUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : const Text('تسجيل', style: TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(child: Divider(color: Colors.white, indent: 20)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child:
                              Text("or register with", style: TextStyle(color: Colors.white)),
                        ),
                        Expanded(child: Divider(color: Colors.white, endIndent: 20)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/facebook.png'),
                          iconSize: 45,
                        ),
                        const SizedBox(width: 30),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/google.png'),
                          iconSize: 45,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("already have an account? ",
                            style: TextStyle(color: Colors.white)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Login()),
                            );
                          },
                          child: const Text(
                            "login now",
                            style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.04,
            left: (screenWidth / 2) - 60,
            child: Container(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/logo2.png', fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon,
      {TextEditingController? controller, bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
