import 'package:cv_maker_app/data/data_layer.dart';
import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:cv_maker_app/pages/bloc/cv_bloc.dart';
import 'package:cv_maker_app/pages/home%20page/home%20page%20widgets/widgets/image.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/cv%20first%20page/cv_maker.dart';
import 'package:cv_maker_app/pages/profile%20page/view%20user%20cv/view_user_cv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.I.get<AllData>();
    final bloc = context.read<CvBloc>();
    locator.delete();
    bloc.add(FetchUserCvEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text(
          "CV Resume",
          style: TextStyle(
            fontSize: 30,
            color: whit,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocConsumer<CvBloc, CvState>(listener: (context, state) {
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
                if (state is DisplayUserCvsState) {
                  Navigator.pop(context);
                }
                if (state is ErrorState) {
                  Navigator.pop(context);
                }
              }, builder: (context, state) {
                // if (state is DisplayUserCvsState) {
                //   if (state.cvs.isNotEmpty) {
                //     context.pushTo(
                //       view: ViewUserCv(
                //         cv: state.cvs[0],
                //       ),
                //     );
                //     return const SizedBox();
                //   } else {
                return Column(
                  children: [
                    const ImageView(),
                    gapH30,
                    InkWell(
                      onTap: () {
                        context.pushTo(view: CvMaker());
                      },
                      child: Container(
                        width: context.getWidth(),
                        height: context.getWidth() / 6,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: firstColor,
                        ),
                        child: Center(
                            child: Text(
                          "create your CV",
                          style: TextStyle(
                            fontSize: 30,
                            color: whit,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    )
                  ],
                );
              }
                  // } else {
                  //   return const SizedBox();
                  // }
                  // },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
