import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _displayName = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid!) {
      _formKey.currentState!.save();
      print(_email);
      print(_password);
      print(_displayName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        key: _formKey,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Username must be atleast 4 characters long';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'User Name',
                    ),
                    onSaved: (value) {
                      _displayName = value!;
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Password must be atleast 7 characters long';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RaisedButton(
                    child: const Text('Login'),
                    onPressed: _trySubmit,
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: const Text('Create an account'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
