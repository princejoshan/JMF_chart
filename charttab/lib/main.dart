import 'package:charttab/bloc/chart_bloc/chart_bloc.dart';
import 'package:charttab/view/chart_bottom_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common_widgets/common_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "demo"),
    );
  }
}

class ChartTab extends StatelessWidget {
  const ChartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          child: Frosted(
            width: 300,
            height: 300,
            child: Text(
              "Hello",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}

class Frosted extends StatelessWidget {
  const Frosted(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);
  final height, width, child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14.0, sigmaY: 14.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.transparent.withOpacity(0.14),
                        Colors.transparent.withOpacity(0.03),
                      ])),
            ),
            Center(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showRow() {
    showAppBottomSheet(context, RowItems(), true);
    // showAppBottomSheet(context,RowItems(),true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ChartBloc(),
        child: BlocBuilder<ChartBloc, ChartState>(
            builder: (ChartBloc, ChartEvent) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Spacer(),
                  ButtonWidget(
                      btnText: "show",
                      onPressAction: showRow,
                      backGroundColor: Colors.black26),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        }));
  }
}

class home extends StatefulWidget {
  const home({super.key, required this.title});

  final String title;

  @override
  State<home> createState() => _MyHomePageState1();
}

class _MyHomePageState2 extends State<home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Container(
      child: ChartTab(),
    ),
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      // showAppBottomSheet(context, InfoWidget(), true);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Spacer(),
        // (_selectedIndex >=0) ?  showAppBottomSheet(context, InfoWidget(), true);
        //   :Container(),
        _widgetOptions.elementAt(_selectedIndex),
        BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          selectedIconTheme: (_selectedIndex == 0)
              ? IconThemeData(opacity: 0.0, size: 0)
              : IconThemeData(opacity: 1, size: 30),
          unselectedIconTheme: (_selectedIndex == -1)
              ? IconThemeData(opacity: 0.0, size: 0)
              : IconThemeData(opacity: 1, size: 30),
        ),
      ],
    ));
  }
}

showDataAlert(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          insetPadding: EdgeInsets.fromLTRB(0, 190, 0, 60),
          child: Container(height: 600, child: Text("Home")),
        );
      });
}

var radius = Radius.circular(20);

showAppBottomSheet(
    BuildContext context, dynamic child, bool enableOutsideTouchClose) async {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      // isDismissible: enableOutsideTouchClose,
      // enableDrag: enableOutsideTouchClose,
      isScrollControlled: true,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(topLeft: radius, topRight: radius)),
      builder: (context) {
        return SingleChildScrollView(
          child: BlocProvider(
              create: (_) => ChartBloc(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      width: 48,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.online_prediction,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: radius, topLeft: radius),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10),
                        child: child,
                      )),
                ],
              )),
        );
      });
}

class _MyHomePageState1 extends State<home> {
  static const Map<String, IconData> _options = {
    'Settings': Icons.favorite_border,
    'Share': Icons.bookmark_border,
    'Logout': Icons.share,
  };

  void _showPopup(BuildContext context) async {
    //*get the render box from the context
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    //*get the global position, from the widget local position
    final offset = renderBox.localToGlobal(Offset.zero);

    //*calculate the start point in this case, below the button
    final left = offset.dx;
    final top = offset.dy + renderBox.size.height;
    //*The right does not indicates the width
    final right = left + renderBox.size.width;

    //*show the menu
    final value = await showMenu<String>(
        // color: Colors.red,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        context: context,
        position: RelativeRect.fill,
        items: _options.entries.map<PopupMenuEntry<String>>((entry) {
          return PopupMenuItem(
            value: entry.key,
            child: Container(
              height: 200,
              width: 400,
              color: Colors.red,
            ),
          );
        }).toList());

    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //*encloses the widget from which the relative positions will be
        //*taken in a builder, in this case a button
        Builder(builder: (context) {
          return RawMaterialButton(
            fillColor: Colors.indigo,
            constraints: const BoxConstraints(minWidth: 200),
            onPressed: () => _showPopup(context),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child:
                const Text('Show Menu', style: TextStyle(color: Colors.white)),
          );
        }),
      ],
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          top: 0,
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 800,
              color: Colors.white,
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/buyWidget');
                },
                child: Text('Looks like a RaisedButton'),
              ))),
    ]);
  }
}

class buyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          bottom: 80,
          child: Container(
            color: Colors.grey.withOpacity(0.8),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 800,
            child: Text(
              "Hi background demo1",
              style: TextStyle(color: Colors.black),
            ),
          )),
    ]);
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Title"),
        SizedBox(
          height: 8,
        ),
        Text(
          "Data",
        ),
      ],
    );
  }
}
