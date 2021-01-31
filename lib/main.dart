import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:oicl_flutter/login_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage())));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/splash.jpg',
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        if (_currentPage < 3) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
        _pageController.addListener(() {
          _currentPage = _pageController.page.toInt();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageList = [
      "assets/images/slider1.png",
      "assets/images/slider2.png",
      "assets/images/slider3.png",
      "assets/images/slider4.png"
    ];
    Widget circleBar(bool isActive) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: isActive ? 12 : 8,
        width: isActive ? 12 : 8,
        decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(12))),
      );
    }

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
            elevation: 0.0,
            backgroundColor: Colors.blueAccent,
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/ic_top.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Welcome to Oriental Insurance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    backgroundColor: Colors.blue,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      PageView(
                                        controller: _pageController,
                                        onPageChanged: (int position) {
                                          setState(() {
                                            _currentPage = position;
                                          });
                                        },
                                        children: <Widget>[
                                          Image.asset(
                                            imageList[0],
                                            fit: BoxFit.fill,
                                          ),
                                          Image.asset(
                                            imageList[1],
                                            fit: BoxFit.fill,
                                          ),
                                          Image.asset(
                                            imageList[2],
                                            fit: BoxFit.fill,
                                          ),
                                          Image.asset(
                                            imageList[3],
                                            fit: BoxFit.fill,
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            width: double.infinity,
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                for (int i = 0;
                                                    i < imageList.length;
                                                    i++)
                                                  if (i == _currentPage) ...[
                                                    circleBar(true)
                                                  ] else
                                                    circleBar(false),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ))),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                margin: EdgeInsets.all(3.0),
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () =>
                                                      debugPrint("Hello"),
                                                  child: Image.asset(
                                                    'assets/images/arogya_sanjeevani.png',
                                                    fit: BoxFit.fill,
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                margin: EdgeInsets.all(3.0),
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage())),
                                                  child: Image.asset(
                                                    'assets/images/ic_customer.png',
                                                    fit: BoxFit.fill,
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                margin: EdgeInsets.all(3.0),
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () =>
                                                      debugPrint("Hello"),
                                                  child: Image.asset(
                                                    'assets/images/ic_agent.png',
                                                    fit: BoxFit.fill,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                margin: EdgeInsets.all(3.0),
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () =>
                                                      debugPrint("Hello"),
                                                  child: Image.asset(
                                                    'assets/images/ic_buy.png',
                                                    fit: BoxFit.fill,
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                margin: EdgeInsets.all(3.0),
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () =>
                                                      debugPrint("Hello"),
                                                  child: Image.asset(
                                                    'assets/images/ic_customer.png',
                                                    fit: BoxFit.fill,
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                margin: EdgeInsets.all(3.0),
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  onPressed: () =>
                                                      debugPrint("Hello"),
                                                  child: Image.asset(
                                                    'assets/images/ic_agent.png',
                                                    fit: BoxFit.fill,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Welcome to Oriental Insurance Welcome to Oriental Insurance Welcome to Oriental Insurance Welcome to Oriental Insurance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    backgroundColor: Colors.blue,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      )),
                ]),
          ),
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
