import 'package:charttab/bloc/chart_bloc/chart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum priceType { Market, Limit }

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final Color backGroundColor;
  final Function onPressAction; // add this
  const ButtonWidget(
      {required this.btnText,
      required this.onPressAction,
      required this.backGroundColor}); // change this
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: RawMaterialButton(
        onPressed: () {
          onPressAction();
        },
        fillColor: backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          btnText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class IconWithTextWidget extends StatelessWidget {
  final String iconImage;
  final String iconText;
  final Function onPressAction; // add this
  const IconWithTextWidget(
      {required this.iconImage,
      required this.onPressAction,
      required this.iconText}); // change this
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        width: 42,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              iconImage,
              height: 20,
              width: 20,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              iconText,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
      onTap: () {
        BlocProvider.of<ChartBloc>(context).add(OnBuyButtonPress());
        onPressAction();
      },
    );
  }
}

class IconWidget extends StatelessWidget {
  final String iconImage;
  final Function onPressAction; // add this
  const IconWidget({
    required this.iconImage,
    required this.onPressAction,
  }); // change this
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Image.asset(iconImage, height: 20, width: 20),
      ),
      onTap: () {
        onPressAction();
      },
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final BoxConstraints constaints;
  final Color textColor, borderColor;
  final TextEditingController controller;

  const TextFieldWidget(
      {required this.hintText,
      required this.constaints,
      required this.textColor,
      required this.borderColor,
      required this.controller}); // change this
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        constraints: constaints,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.0, color: textColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
      ),
      textAlign: TextAlign.left,
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 14, color: textColor),
    );
  }
}

class MarketLimitContainer extends StatefulWidget {
  final String hintText;
  final BoxConstraints constaints;
  final Color textColor, borderColor;
  final TextEditingController controller;

  const MarketLimitContainer(
      {required this.hintText,
      required this.constaints,
      required this.textColor,
      required this.borderColor,
      required this.controller}); // change this
  @override
  State<MarketLimitContainer> createState() => MarketLimitWidget();
}

class MarketLimitWidget extends State<MarketLimitContainer> {
  var priceMode = priceType.Market;

  @override
  void priceTypeChanged() {
    setState(() {
      if (priceMode == priceType.Market) {
        priceMode = priceType.Limit;
      } else {
        priceMode = priceType.Market;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (priceMode == priceType.Market)
        ? Container(
            height: widget.constaints.maxHeight,
            width: widget.constaints.maxWidth,
            decoration: BoxDecoration(
              border: Border.all(color: widget.borderColor),
              borderRadius: BorderRadius.all(Radius.circular(
                      8.0) //                 <--- border radius here
                  ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      priceTypeChanged();
                    },
                    child: Text("Market"))
              ],
            ),
          )
        : Container(
            height: widget.constaints.maxHeight,
            decoration: BoxDecoration(
              border: Border.all(color: widget.borderColor),
              borderRadius: BorderRadius.all(Radius.circular(
                      8.0) //                 <--- border radius here
                  ),
            ),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  textAlign: TextAlign.end,
                  controller: widget.controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                        minHeight: widget.constaints.maxHeight,
                        minWidth: widget.constaints.maxWidth - 80,
                        maxHeight: widget.constaints.maxHeight,
                        maxWidth: widget.constaints.maxWidth - 80),
                    hintText: widget.hintText,
                    hintStyle:
                        TextStyle(fontSize: 12.0, color: widget.textColor),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.fromLTRB(8, 0, 45, 15),
                  ),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: widget.textColor),
                ),
                TextButton(
                    onPressed: () {
                      priceTypeChanged();
                    },
                    child: Text("Limit"))
              ],
            ),
          );
  }
}
