import 'package:admin_app_foodi/Model/Components/CustomText.dart';
import 'package:admin_app_foodi/Model/Widgets/DashBorardCard.dart';
import 'package:admin_app_foodi/Model/Widgets/SectionWidget.dart';
import 'package:admin_app_foodi/Utils/AppColor.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/DashBoardCubit/dash_board_cubit.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/Orders/orders_cubit.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/SectionCubit/section_cubit.dart';
import 'package:admin_app_foodi/ViewModel/Bloc/UserCubit/user_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
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
    var users = UserCubit.get(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: users..getUsersInfo()),
          BlocProvider.value(value: order..OrdersData()..getTotalRevenue()),
        ],
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
          body: BlocConsumer<OrdersCubit, OrdersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      children: List.generate(dash.cards.length, (index) {
                        return DashBoardCard(item: dash.cards[index],
                        );
                      }),
                    ),
                  ),
              LineChart(
              LineChartData(
                minY: 60,
                maxY: 80,
                lineBarsData: [
                  LineChartBarData(
                    color: AppColor.orange,
                    isCurved: true,
                    barWidth: 3,
                  ),
                ],
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                )
              ),

              ),
                ],
              );
            },
          )
      ),
    );
  }
}
