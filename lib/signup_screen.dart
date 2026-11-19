import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Titre
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Sous-titre
              const Text(
                'Create a new account to get started and enjoy\nseamless access to our features.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 40),

              // Champ Nom
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 16),

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

              // Champ Confirmation Mot de passe
              TextFormField(
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Bouton Create Account
              ElevatedButton(
                onPressed: () {},
                child: const Text('Create Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 24),

              // Lien Connexion
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ", style: TextStyle(fontSize: 13)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Retour à l'écran de login
                    },
                    child: const Text(
                      'Sign In here',
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