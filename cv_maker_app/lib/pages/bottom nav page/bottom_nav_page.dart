import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/pages/bottom%20nav%20page/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<NavigationBloc>();
        return BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return Scaffold(
                backgroundColor: whit,
                bottomNavigationBar: Material(
                  color: whit,
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      indicatorColor: firstColor,
                      indicator: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: firstColor, width: 4))),
                      indicatorSize: TabBarIndicatorSize.tab,
                      enableFeedback: false,
                      onTap: (value) {
                        bloc.add(ChangeNavEvent(selectedPage: value));
                      },
                      labelColor: firstColor,
                      unselectedLabelColor: cont,
                      tabs: <Widget>[
                        Tab(
                            icon: bloc.selctedIndex == 0
                                ? Icon(
                                    Icons.home_outlined,
                                    color: firstColor,
                                  )
                                : Icon(
                                    Icons.home_outlined,
                                    color: cont,
                                  )),
                        Tab(
                            icon: bloc.selctedIndex == 1
                                ? Icon(
                                    Icons.person,
                                    color: firstColor,
                                  )
                                : Icon(
                                    Icons.person,
                                    color: cont,
                                  )),
                      ],
                    ),
                  ),
                ),
                body: bloc.views[bloc.selctedIndex]);
          },
        );
      }),
    );
  }
}
