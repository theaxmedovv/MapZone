import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home/home_page.dart';
import '../services/auth_storage.dart';
import '../services/auth_service.dart';


class JoinUsPage extends StatefulWidget {
  const JoinUsPage({super.key});

  @override
  State<JoinUsPage> createState() => _JoinUsPageState();
}

class _JoinUsPageState extends State<JoinUsPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final email = _emailController.text.trim();

    if (username.isEmpty || password.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final token = await AuthService.register(
        username: username,
        email: email,
        password: password,
      );
      await AuthStorage.saveToken(token);

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage(username: username)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mavjud")),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.8, end: 1.0),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutBack,
                builder: (_, value, child) => Transform.scale(scale: value, child: child),
                child: const Icon(Icons.directions_run, size: 80, color: Color(0xFFB0FF00)),
              ),
              const SizedBox(height: 20),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF00C853), Color(0xFFB0FF00)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: const Text(
                  "Join MapZone Running Club",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Start your running journey today",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Inputs
              _buildAnimatedInputField(
                delay: 0,
                child: TextField(
                  controller: _usernameController,
                  decoration: _input("Username", const Icon(Icons.person_outline)),
                ),
              ),
              const SizedBox(height: 16),
              _buildAnimatedInputField(
                delay: 100,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _input("Email", const Icon(Icons.email_outlined)),
                ),
              ),
              const SizedBox(height: 16),
              _buildAnimatedInputField(
                delay: 200,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: _input("Password", const Icon(Icons.lock_outline)),
                ),
              ),
              const SizedBox(height: 24),

              // Submit
              _buildAnimatedButton(
                delay: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB0FF00),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 56),
                    shadowColor: const Color(0xFFB0FF00).withOpacity(0.4),
                  ),
                  onPressed: _isLoading ? null : _register,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.black, strokeWidth: 3)
                      : const Text("Create Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 24),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text("OR CONTINUE WITH",
                        style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),

              // Social buttons (UI only for now)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(icon: FontAwesomeIcons.google,  color: const Color(0xFFDB4437), delay: 400),
                  const SizedBox(width: 16),
                  _buildSocialButton(icon: Icons.apple,              color: Colors.black,           delay: 500),
                  const SizedBox(width: 16),
                  _buildSocialButton(icon: Icons.facebook,           color: Colors.blue,            delay: 600),
                ],
              ),
              const SizedBox(height: 40),

              // Footer
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  children: const [
                    TextSpan(text: "Already have an account? "),
                    TextSpan(text: "Sign In", style: TextStyle(color: Color(0xFFB0FF00), fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // UI helpers
  InputDecoration _input(String label, Icon icon) => InputDecoration(
    labelText: label,
    prefixIcon: icon,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    filled: true,
    fillColor: Colors.grey[100],
  );

  Widget _buildAnimatedInputField({required int delay, required Widget child}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.easeOutQuart,
      builder: (_, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(offset: Offset(0, (1 - value) * 20), child: child),
      ),
      child: child,
    );
  }

  Widget _buildAnimatedButton({required int delay, required Widget child}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 600 + delay),
      curve: Curves.elasticOut,
      builder: (_, value, child) => Transform.scale(scale: value, child: child),
      child: child,
    );
  }

  Widget _buildSocialButton({required IconData icon, required Color color, required int delay}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.easeOutBack,
      builder: (_, value, child) => Transform.scale(scale: value, child: child),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
        child: Icon(icon, size: 30, color: color),
      ),
    );
  }
}
