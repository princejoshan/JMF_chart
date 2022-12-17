import 'package:charttab/view/chart_buycontainer.dart';
import 'package:charttab/view/chart_marketdepth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chart_bloc/chart_bloc.dart';
import '../common_widgets/common_widgets.dart';

class RowItems extends StatefulWidget {
  @override
  State<RowItems> createState() => RowItemsWidget();
}

class RowItemsWidget extends State<RowItems> {
  List<Widget> rowWidget = [];

  @override
  void initState() {
    super.initState();
    // Function buy = onBuyPress();
    rowWidget = [
      Container(
        width: 50,
        height: 24,
        child: ButtonWidget(
          btnText: "BUY",
          onPressAction: onBuyPress,
          backGroundColor: Colors.green,
        ),
      ),
      Container(
        width: 50,
        height: 24,
        child: ButtonWidget(
          btnText: "SELL",
          onPressAction: onSellPress,
          backGroundColor: Colors.red,
        ),
      ),
      Container(
        width: 43,
        height: 37,
        child: IconWithTextWidget(
          iconText: "BID/ASK",
          onPressAction: onMarketDepthPress,
          iconImage: 'lib/assets/rotate.png',
        ),
      ),
      Container(
        width: 42,
        height: 37,
        child: IconWithTextWidget(
          iconText: "ORDERS",
          onPressAction: onSellPress,
          iconImage: 'lib/assets/rotate.png',
        ),
      ),
      Container(
        width: 20,
        height: 20,
        child: IconWidget(
          iconImage: 'lib/assets/rotate.png',
          onPressAction: onSellPress,
        ),
      ),
      Container(
        width: 20,
        height: 20,
        child: IconWidget(
          iconImage: 'lib/assets/rotate.png',
          onPressAction: onSellPress,
        ),
      ),
    ];
  }

  void onBuyPress() {
    BlocProvider.of<ChartBloc>(context).add(OnBuyButtonPress());
    debugPrint("buy clicked");
  }

  void onSellPress() {
    BlocProvider.of<ChartBloc>(context).add(OnSellButtonPress());
    debugPrint("sell clicked");
  }

  void onMarketDepthPress() {
    BlocProvider.of<ChartBloc>(context).add(OnMarketDepthPress());
    debugPrint("sell clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ChartBloc, ChartState>(
            builder: (BuildContext context, ChartState state) {
          if (state is ShowBuyContaner || state is ChartInitial) {
            return BuySellContainer(
              containerName: 'BUY',
            );
          }
          if (state is ShowSellContaner) {
            return BuySellContainer(
              containerName: 'SELL',
            );
          }
          if (state is ShowMarketDepth) {
            return OverviewMarketDepth();
          }
          return Text("");
        }),
        Container(
            color: Colors.grey.shade300,
            height: 2,
            width: MediaQuery.of(context).size.width),
        SizedBox(
          height: 8,
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [for (var i in rowWidget) i],
          ),
        ),
      ],
    );
  }
}

class StringWithBool {
  final String text;
  bool isSelected;

  StringWithBool({required this.text, this.isSelected = false});
}

