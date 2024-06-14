import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kasir_app/core/components/circle_loading.dart';
import 'package:kasir_app/core/router/router_constants.dart';
import 'package:kasir_app/features/auth/data/models/user_model.dart';
import 'package:kasir_app/features/auth/presentetion/bloc/register/register_bloc.dart';
import 'package:kasir_app/features/auth/presentetion/widget/button.dart';
import 'package:kasir_app/features/auth/presentetion/widget/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool _obscureText1 = true;
  bool _obscureText2 = true;

  void _togglePassword1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _togglePassword2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is RegisterFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is RegisterLoaded) {
            context.pop();
          }
        },
        builder: (context, state) {
          if (state is RegisterLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
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
                              controller: firstNameController,
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
                              controller: lastNameController,
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
                    controller: emailController,
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
                    controller: phoneNumberController,
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
                    obscure: _obscureText1,
                    suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          !_obscureText1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black87,
                        ),
                        onPressed: _togglePassword1),
                    controller: passwordController,
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
                    obscure: _obscureText2,
                    suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          !_obscureText2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black87,
                        ),
                        onPressed: _togglePassword2),
                    controller: passwordController,
                  ),
                  const SizedBox(height: 25.0),
                  QButton(
                      label: 'Create Account',
                      onPressed: () {
                        final dataUser = UserModel(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text,
                            password: passwordController.text);
                        context.read<RegisterBloc>().add(OnRegister(
                              userModel: dataUser,
                            ));
                      }),
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
          );
        },
      ),
    );
  }
}
