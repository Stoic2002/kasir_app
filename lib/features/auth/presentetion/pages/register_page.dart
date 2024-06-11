import 'package:flutter/material.dart';
import 'package:kasir_app/features/auth/presentetion/widget/button.dart';
import 'package:kasir_app/features/auth/presentetion/widget/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[210],
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(
                          "First Name",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        QTextField(
                          label: "Enter your first name",
                          value: null,
                          onChanged: (value) {},
                        ),
                      ])),
                  const SizedBox(width: 10.0),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(
                          "Last Name",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        QTextField(
                          label: "Enter your last name",
                          value: null,
                          onChanged: (value) {},
                        ),
                      ])),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "E-mail",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              QTextField(
                label: "Enter your email",
                value: null,
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "No Hp",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              QTextField(
                label: "Enter your number",
                value: null,
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              QTextField(
                label: "Enter your password",
                helper: "must contain 8 char.",
                obscure: true,
                suffixIcon: Icons.visibility_off_outlined,
                value: null,
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              QTextField(
                label: "Enter your password",
                obscure: true,
                suffixIcon: Icons.visibility_off_outlined,
                value: null,
                onChanged: (value) {},
              ),
              const SizedBox(height: 25.0),
              QButton(label: 'Create Account', onPressed: () => {}),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('By continuing, you agree to our'),
                  SizedBox(width: 7),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Terms of Service',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('and'),
                  SizedBox(width: 7),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      ' Privacy Policy.',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
