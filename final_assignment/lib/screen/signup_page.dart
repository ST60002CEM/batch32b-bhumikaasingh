import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _FirstnameController = TextEditingController();
  TextEditingController _emailidController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _FirstnameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _emailidController,
              decoration: InputDecoration(
                labelText: 'Email ID',
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
            TextField(
              controller: _confirmpasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement your sign-up logic here
                String firstname = _FirstnameController.text;
                String emailid = _emailidController.text;
                String password = _passwordController.text;
                String confirmpassword = _confirmpasswordController.text;

                _performSignUp(firstname, emailid, password, confirmpassword);
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 10.0),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                // Navigate to the login page when "Already have an account?" is clicked
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Already have an account? Go Back.'),
            ),
          ],
        ),
      ),
    );
  }

  void _performSignUp(String username, String emailid, String password,
      String confirmpassword) {
    print('Username: $username');
    print('Email: $emailid');
    print('Password: $password');
    print('ConfirmPassword: $confirmpassword');
  }
}
