import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Bouton Retour
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Titre
              const Text(
                'Log in',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Sous-titre
              const Text(
                'Enter your email and password to securely access\nyour account and manage your services.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 40),

              // Champ Email
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email address',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 16),

              // Champ Mot de passe
              TextFormField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Remember Me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          activeColor: const Color(0xFF43B581),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('Remember me', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {}, // Action oublié
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Bouton Login
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 24),

              // Lien Inscription
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ", style: TextStyle(fontSize: 13)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupScreen()),
                      );
                    },
                    child: const Text(
                      'Sign Up here',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF43B581),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Ligne de séparation
              const Divider(color: Colors.black12, thickness: 1),
              const SizedBox(height: 20),

              // Continuer avec un autre compte
              const Text(
                'Or Continue With Account',
                style: TextStyle(fontSize: 13, color: Colors.black87),
              ),
              const SizedBox(height: 20),

              // Boutons sociaux
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(FontAwesomeIcons.facebookF, Colors.black),
                  const SizedBox(width: 20),
                  _buildSocialButton(FontAwesomeIcons.google, Colors.red),
                  const SizedBox(width: 20),
                  _buildSocialButton(FontAwesomeIcons.apple, Colors.black),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget réutilisable pour les boutons sociaux (CORRIGÉ)
  Widget _buildSocialButton(FaIconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: FaIcon(icon, color: color, size: 20),
        onPressed: () {},
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}