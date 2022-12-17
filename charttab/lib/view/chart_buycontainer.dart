import 'package:charttab/view/chart_bottom_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chart_bloc/chart_bloc.dart';
import '../common_widgets/common_widgets.dart';
import '../common_widgets/radiobutton_widget.dart';

class BuySellContainer extends StatelessWidget {
  String containerName;

  BuySellContainer({required this.containerName});

  static List<StringWithBool> radioButtonDataItems = [
    StringWithBool(text: "CNC", isSelected: true),
    StringWithBool(text: "MIS"),
    StringWithBool(text: "MTF"),
  ];
  BoxConstraints qtyTextFieldConstraint =
      BoxConstraints(maxHeight: 37, minHeight: 37, maxWidth: 88, minWidth: 88);
  BoxConstraints priceTextFieldConstraint = BoxConstraints(
      maxHeight: 37, minHeight: 37, maxWidth: 165, minWidth: 165);

  static const textFieldBorderColor = Color(0x33969ba1);
  static const textFieldTextColor = Color(0xFFB7a7a7a);

  static TextEditingController _qtyController =
      TextEditingController(text: '1');
  static TextEditingController _priceController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 130,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: radioButtonDataItems
                  .map((e) => RadioListTileWidget(
                        label: e.text,
                        isSelected: e.isSelected,
                        onTap: () {
                          for (var element in radioButtonDataItems) {
                            element.isSelected = false;
                            e.isSelected = true;
                          }
                          BlocProvider.of<ChartBloc>(context)
                              .add(OnSellButtonPress());
                        },
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 23),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFieldWidget(
                      controller: _qtyController,
                      hintText: "Quantity",
                      constaints: qtyTextFieldConstraint,
                      textColor: textFieldTextColor,
                      borderColor: textFieldBorderColor),
                  SizedBox(
                    width: 8,
                  ),
                  MarketLimitContainer(
                      controller: _priceController,
                      hintText: "Price",
                      constaints: priceTextFieldConstraint,
                      textColor: textFieldTextColor,
                      borderColor: textFieldBorderColor),
                  SizedBox(
                    width: 8,
                  ),
                  ButtonWidget(
                      btnText: this.containerName,
                      onPressAction: () {},
                      backGroundColor:
                          (this.containerName.toLowerCase() == "sell")
                              ? Colors.red
                              : Colors.green),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
