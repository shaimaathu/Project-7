import 'package:cv_maker_app/data/data_layer.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:cv_maker_app/pages/bloc/cv_bloc.dart';
import 'package:cv_maker_app/pages/home%20page/home%20page%20widgets/widgets/image.dart';
import 'package:cv_maker_app/pages/home%20page/view%20cv/view_cv.dart';
import 'package:cv_maker_app/pages/home%20page/home%20page%20widgets/widgets/cv_card.dart';
import 'package:cv_maker_app/pages/logIn/log_in_page.dart';
import 'package:cv_maker_app/service/supabase_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<AllData>();
    final bloc = context.read<CvBloc>();
    bloc.add(FetchAllCvEvent());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Database().signout();
              locator.signOut();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return SignIn();
                },
              ), (route) => false);
            },
            child: const Icon(Icons.logout)),
        title: const Text("all Resumes"),
      ),
      body: Column(
        children: [
          BlocConsumer<CvBloc, CvState>(
            listener: (context, state) {
              if (state is LaudingState) {
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
              if (state is DisplayAllCvsState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is DisplayAllCvsState) {
                if (state.cvs.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.cvs.length,
                    itemBuilder: (context, index) {
                      return CVCard(
                        // image: "assets/prof.jpeg",
                        name: state.cvs[index].fullName,
                        onTap: () {
                          context.pushTo(
                            view: ViewCv(
                              cv: state.cvs[index],
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return const ImageView();
                }
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
