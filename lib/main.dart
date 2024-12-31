import 'package:flutter/material.dart';
import 'package:form_provider/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginFormProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Form with Provider',
        home: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LoginFormProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  provider.setEmail(newEmail: value);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) {
                  provider.setPassword(newPassword: value);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  provider.submit();
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
              Consumer<LoginFormProvider>(
                builder: (context, provider, child) {
                  return Text('Email: ${provider.email}');
                },
              ),
              Consumer<LoginFormProvider>(
                builder: (context, provider, child) {
                  return Text('Password: ${provider.password}');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
