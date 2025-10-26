import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _shgIdController = TextEditingController();
  final _mobileNumberController = TextEditingController();

  @override
  void dispose() {
    _shgIdController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  void _login() {
    // In a real app, you'd have OTP logic here.
    // For this demo, we'll navigate directly to the home screen.
    if (_shgIdController.text.isNotEmpty &&
        _mobileNumberController.text.isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter SHG ID and Mobile Number.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHG Login'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Sign in to continue',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _shgIdController,
              decoration: const InputDecoration(
                labelText: 'Enter your SHG ID',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.group),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _mobileNumberController,
              decoration: const InputDecoration(
                labelText: 'Enter your registered mobile number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: const Text('Get OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
