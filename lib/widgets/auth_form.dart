import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movieapp/providers/auth.dart';

import 'package:provider/provider.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  void _onSubmit(BuildContext ctx) {
    final valid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (valid) {
      _formKey.currentState!.save();
    }

    if (!_islogin) {
      if (_password1 != _password2) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Passwords must match'),
          backgroundColor: Colors.white,
        ));
        return;
      }
    }

    Provider.of<Authentication>(context, listen: false)
        .signUp(_email, _password1, _islogin);
  }

  bool _islogin = true;
  String _password2 = '';
  String _password1 = '';
  String _email = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: const ValueKey('email'),
                    onSaved: (newValue) {
                      _email = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input an email";
                      } else if (!value.contains('@') ||
                          !value.endsWith('.com')) {
                        return "Please input a valid email";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                    ),
                  ),
                  if (!_islogin)
                    TextFormField(
                      key: const ValueKey('Verify Password'),
                      onSaved: (newValue) {
                        _password1 = newValue!;
                      },
                      decoration: const InputDecoration(
                        label: Text('Verify Password'),
                      ),
                      validator: (value) {
                        if (value!.length < 4) {
                          return "A password has minimum length of 7";
                        }
                        return null;
                      },
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    onSaved: (newValue) {
                      _password2 = newValue!;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return "A password has minimum length of 7";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        onPressed: () {
                          setState(() {
                            _islogin = !_islogin;
                          });
                        },
                        child: _islogin == true
                            ? const Text('Sign Up')
                            : const Text('Login'),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        onPressed: () {
                          _onSubmit(context);
                        },
                        child: _islogin == true
                            ? const Text('Login')
                            : const Text('Sign Up'),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
