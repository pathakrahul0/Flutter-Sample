import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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
                            'Customer Login',
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
                  child: SingleChildScrollView(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            color: Colors.black38,
                            size: 120.0,
                          ),
                          TextField(
                            maxLines: 1,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'User Id',
                                prefixIcon: Icon(Icons.account_circle_rounded,
                                    color: Colors.grey)),
                          ),
                          TextField(
                            maxLines: 1,
                            textAlign: TextAlign.justify,
                            keyboardType: TextInputType.visiblePassword,
                            enableSuggestions: false,
                            autocorrect: false,
                            obscureText: false,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                )),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: RaisedButton(
                                color: Colors.blue,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                textColor: Colors.white,
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CustomerDashboardPage()))),
                          ),
                        ],
                      ),
                    ),
                  ))),
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
            ])));
  }
}
