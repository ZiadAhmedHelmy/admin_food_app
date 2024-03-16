import 'package:admin_app_foodi/Model/Components/CustomText.dart';
import 'package:admin_app_foodi/Model/Widgets/DashBorardCard.dart';
import 'package:admin_app_foodi/Model/Widgets/SectionWidget.dart';
import 'package:admin_app_foodi/Utils/AppColor.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/DashBoardCubit/dash_board_cubit.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/Orders/orders_cubit.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/SectionCubit/section_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var section = SectionCubit.get(context);
    var dash = DashBoardCubit.get(context);
    var order = OrdersCubit.get(context);
    return BlocProvider.value(
      value:order..OrdersData(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.orange,
            elevation: 0,
            title: CustomText(
              text: "Foodi DashBoard",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.white,
            ),
            centerTitle: true,
          ),
          drawer: Drawer(
            elevation: 0,
            backgroundColor: AppColor.orange,
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SectionWidget(item: section.SectionList[index],);
                  },
                ),
              )
            ]),
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(dash.cards.length, (index) {
                    return DashBoardCard(item: dash.cards[index],
                    );
                  }),
                ),
              ),
            ],
          )
      ),
    );
  }
}
