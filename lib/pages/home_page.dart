import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/hello_listview.dart';
import 'package:flutter_app1/pages/hello_page1.dart';
import 'package:flutter_app1/pages/hello_page2.dart';
import 'package:flutter_app1/pages/hello_page3.dart';
import 'package:flutter_app1/utils/nav.dart';
import 'package:flutter_app1/widgets/blue_button.dart';
import 'package:flutter_app1/widgets/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          bottom: TabBar(tabs: [
            Tab(text: "TAB 1"),
            Tab(text: "TAB 2"),
            Tab(text: "TAB 3"),
          ]),
          centerTitle: true,
        ),
        body: TabBarView(children: [
          _body(context),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          )

        ]),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
          _onClickFab();
        }),
        drawer: DrawerList()
      ),
    );
  }

  _onClickFab() {
      print("Adicionar");
  }

  _body(context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
           _buttons(),
          ],
        )
      ),
    );
  }

  _pageView() {
    return Container(
          margin: EdgeInsets.only(top: 20,bottom:20),
          height: 300,
          child: PageView(
            children: <Widget>[
              _img("assets/images/dog1.png"),
              _img("assets/images/dog2.png"),
              _img("assets/images/dog3.png"),
              _img("assets/images/dog4.png"),
              _img("assets/images/dog5.png")
            ],
          ),
        );
  }

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton( "ListView",onPressed: () => _onClickNavigator(context, HelloListView())),
              BlueButton( "Page 2", onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButton( "Page 3", onPressed: () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton( "Snack", onPressed: () => _onClickSnak(context)),
              BlueButton( "Dialog",onPressed: () => _onClickDialog(context)),
              BlueButton( "Toast", onPressed: _onClickToast),
            ],
          )
        ],
      );
    },);
  }



  _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    
    print(">> $s");
  }
  _img(String img){
    return Image.asset(
        img,
      fit: BoxFit.cover,
    );
  }
  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  _onClickSnak(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá FLutter"),
      action: SnackBarAction(
          textColor: Colors.amber,
          label: "OK",
          onPressed: () {
            print("OK!");
          }),
        ),
    );
  }

  _onClickDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        
        builder: (context){
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Flutter é muito Legal"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: (){
                Navigator.pop(context);
                print("OK!!!!!!");
              },
            ),
          ],
        ),
      );
    });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é muito legal e facil",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  _onClickListView() {
  }

  _onClickPage2() {
  }

  _onClickPage3() {
  }


}