import 'package:firebaseauthentication/widgets/email_text_field_widget.dart';
import 'package:firebaseauthentication/widgets/pass_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider_app.dart';
import '../widgets/button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    Provider.of<AuthProviderApp>(context, listen: false).init();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<AuthProviderApp>(context, listen: false).providerDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviderApp>(
      builder: (context, value, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Form(
                  key: value.formKey,
                  child: Column(
                    children: [
                      EmailFieldWidget(
                        isFirst: true,
                        isLast: false,
                        controller: value.emailController,
                      ),
                      PassFieldWidget(
                        isFirst: false,
                        isLast: true,
                        controller: value.passController,
                        onTap: value.toggleObscure,
                        con: value.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        obstxt: value.obscureText,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonWidget(
                        txt: 'SIGN UP',
                        onTap: () async {
                          await value.signUp(context);
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 231,
                        height: 34,
                        child: RichText(
                          text: TextSpan(
                            text: 'By creating an account, you agree to our ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff515c6f),
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xffff6969),
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff515c6f),
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xffff6969),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
