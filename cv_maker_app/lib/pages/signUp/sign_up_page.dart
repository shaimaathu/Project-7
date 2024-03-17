import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:cv_maker_app/pages/logIn/log_in_page.dart';
import 'package:cv_maker_app/pages/signUp/bloc/sign_up_bloc.dart';
import 'package:cv_maker_app/pages/signUp/widgets/sign_up_image.dart';
import 'package:cv_maker_app/pages/widgets/button_widget.dart';
import 'package:cv_maker_app/pages/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SignUpBloc>();
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      showDialog(
                          barrierDismissible: false,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              content: SizedBox(
                                height: 80,
                                width: 80,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          });
                    }
                    if (state is SuccessState) {
                      Navigator.pop(context);
                      context.pushTo(view: SignIn());
                    }
                    if (state is ErrorState) {
                      Navigator.pop(context);
                      context.getDialog(
                          content:
                              'there is some error in the email or password');
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SignUpImage(),
                                gapH30,
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: black,
                                      fontWeight: FontWeight.bold),
                                ),
                                gapH30,
                                Textfield(
                                  hintText: "enter your name",
                                  textController: nameController,
                                ),
                                gapH10,
                                Textfield(
                                  hintText: "enter your email",
                                  textController: emailController,
                                ),
                                gapH10,
                                Textfield(
                                  hintText: "enter your password",
                                  textController: passwordController,
                                  pass: true,
                                ),
                                gapH10,
                                gapH30,
                                ButtonWidget(
                                  title: 'Sign Up',
                                  onPress: () {
                                    if (_formKey.currentState!.validate()) {
                                      bloc.add(CreateAccountEvent(
                                          email: emailController.text,
                                          name: nameController.text,
                                          password: passwordController.text));
                                    }
                                  },
                                )
                              ],
                            )),
                      ],
                    );
                  },
                ),
                gapH30,
                gapH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have an account ",
                        style: TextStyle(
                            color: black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                    gapW10,
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return SignIn();
                            },
                          ), (route) => false);
                        },
                        child: Text(
                          "SignIn",
                          style: TextStyle(
                              color: firstColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
