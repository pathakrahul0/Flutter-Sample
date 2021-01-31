import 'package:flutter/material.dart';

class CustomerDashboardPage extends StatefulWidget {
  @override
  _CustomerDashboardPageState createState() => _CustomerDashboardPageState();
}

var _currentTabs = 1;
var _currentTabsTitle = "";

_getCurrentFragment() {
  switch (_currentTabs) {
    case 1:
     return FragmentOne();
      break;
    case 2:
      return FragmentTwo();
      break;
    case 3:
      return  FragmentThree();
      break;
  }
}


class _CustomerDashboardPageState extends State<CustomerDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          toolbarHeight: 0.0,
        ),
        drawer: Drawer(
            child: Container(
          color: Colors.blue,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Customer Dashboard'),
                onTap: () {
                  setState(() {
                    _currentTabs = 1;
                    _currentTabsTitle = "Customer Dashboard";
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
              ListTile(
                title: Text('Aarogya Sanjeevani'),
                onTap: () {
                  setState(() {
                    _currentTabs = 2;
                    _currentTabsTitle = "Aarogya Sanjeevani";
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  setState(() {
                    _currentTabs = 2;
                    _currentTabsTitle = "Item 2";
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
            ],
          ),
        )),
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
              AppBar(
                centerTitle: true,
                title: Title(
                  color: Colors.white,
                  child: Text(
                    _currentTabsTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(flex: 8, child: _getCurrentFragment()),
              Expanded(
                flex: 1,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Welcome to Oriental Insurance Welcome to Oriental Insurance Welcome to Oriental Insurance Welcome to Oriental Insurance',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            backgroundColor: Colors.blue,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
              ),
            ])));
  }
}

class FragmentOne extends StatefulWidget {
  @override
  _FragmentOneState createState() => _FragmentOneState();
}

class _FragmentOneState extends State<FragmentOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepOrange,
      child: Text(_currentTabsTitle),
    );
  }
}

class FragmentTwo extends StatefulWidget {
  @override
  _FragmentTwoState createState() => _FragmentTwoState();
}

class _FragmentTwoState extends State<FragmentTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.cyan,
      child: Text(_currentTabsTitle),

    );
  }
}

class FragmentThree extends StatefulWidget {
  @override
  _FragmentThreeState createState() => _FragmentThreeState();
}

class _FragmentThreeState extends State<FragmentThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: Text(_currentTabsTitle),

    );
  }
}
