import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement your sign-in logic here
                String email = _emailController.text;
                String password = _passwordController.text;

                // You can validate user input here before proceeding with sign-in

                
                _performSignIn(email, password);
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                
                Navigator.pushReplacementNamed(context, '/signup');
              },
              child: Text('If u are not register click here'),
            ),
          ],
        ),
      ),
    );
  }

  void _performSignIn(String email, String password) {
    
    print('Email: $email');
    print('Password: $password');
  }
}