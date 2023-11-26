import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          IconButton(
            icon: Tooltip(
              message: "Continue as a guest",
              child: Icon(Icons.person),
            ),
            onPressed: () {
              // Navigate to the home page
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black26,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailUsernameForm(),
              SizedBox(height: 12),
              PasswordForm(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  "Don't have an account? Sign up here.",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailUsernameForm extends StatefulWidget {
  @override
  _EmailUsernameFormState createState() => _EmailUsernameFormState();
}

class _EmailUsernameFormState extends State<EmailUsernameForm> {
  final TextEditingController _emailUsernameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailUsernameController,
      decoration: InputDecoration(
        labelText: 'Email/Username',
        fillColor: Colors.black26,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class PasswordForm extends StatefulWidget {
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        fillColor: Colors.black26,
      ),
      obscureText: true,
    );
  }
}
