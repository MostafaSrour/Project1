import 'package:flutter/material.dart';
import 'login.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        actions: [
          _buildGuestIcon(context),
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
              SizedBox(height: 12),
              FullNameForm(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                ),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuestIcon(BuildContext context) {
    return IconButton(
      icon: Tooltip(
        message: 'Continue as a guest',
        child: Icon(Icons.person),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }
}

class FullNameForm extends StatefulWidget {
  @override
  _FullNameFormState createState() => _FullNameFormState();
}

class _FullNameFormState extends State<FullNameForm> {
  final TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _fullNameController,
      decoration: InputDecoration(labelText: 'Full Name'),
    );
  }
}
