import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:cv_maker_app/pages/bottom%20nav%20page/bottom_nav_page.dart';
import 'package:cv_maker_app/pages/home%20page/home%20page%20widgets/widgets/image.dart';
import 'package:cv_maker_app/pages/logIn/bloc/sign_in_bloc.dart';
import 'package:cv_maker_app/pages/signUp/sign_up_page.dart';
import 'package:cv_maker_app/pages/widgets/button_widget.dart';
import 'package:cv_maker_app/pages/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SignInBloc>();
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state is LoadingSignInState) {
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
                if (state is SuccessSignInState) {
                  context.pushTo(view: const BottomNavScreen());
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ImageView(),
                    gapH30,
                    Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 30,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                    gapH30,
                    Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                            gapH30,
                            ButtonWidget(
                              title: 'SignIn',
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  bloc.add(AddSignInEvent(
                                      email: emailController.text,
                                      password: passwordController.text));
                                }
                              },
                            )
                          ],
                        )),
                    gapH30,
                    gapH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("don't have an account ",
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
                                  return SignUp();
                                },
                              ), (route) => false);
                            },
                            child: Text("signUp",
                                style: TextStyle(
                                    color: firstColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600))),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
