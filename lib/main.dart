import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MaterialApp(
      title: 'xx Flutter Memegen',
      color: Colors.green,
      home: new Scaffold(
        body:
        Landing(),
        )
      )
    );
  }
}

class Landing extends StatefulWidget {

  Landing();

  @override
  State createState() => new LandingState();

}

class LandingState extends State<Landing> {
  bool _isLoading = false;
  String _currentUser = null;


  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  initState() {
    super.initState();
    setState(() {
      //_isLoading = true;
    });
    //widget.ssoAuth
    //    .signInSilently()
    //    .then(_handleSSOResult)
    //    .catchError((error, stack) {
    //  print("An unknown error occured: $error");
    //  print(stack);
    //});

    _handleSignIn().then(handle);
  }

  Future<Null> handle(String ldap) async {
    setState(() {

      _currentUser = ldap;
    });

    //Navigator.push(context, new MaterialPageRoute(builder: (_) => new Home()),);
  }

  Future<String> _handleSignIn() async {
      _isLoading = true;
    return Future.delayed(Duration(seconds: 5), () {
      print("Logging in jeffjose ..");
      _isLoading = false;
      return "jeffjose";
    });
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading) {
      // Transient
      return new CircularProgressIndicator();
    }
    print("currentUser ${_currentUser}");
    if (_currentUser == null) {
      // Logged out state
      return new MaterialButton(
        color: Colors.grey[200],
       child: const Text('Sign in'),
        onPressed: _handleSignIn,
      );
    }

    if (_currentUser != null) {
      return new Home();
    }

    }


   // print("xxxxxxxxxx");
   // print(_memes);
   // print("xxxxxxxxxx");
   // print("${_meme.canonicalLink}");
   // print('Returned a meme with text: ${_meme?.imageFifeUrl}');

   // return FutureBuilder(
   //     future: _memes,
   //     builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

   //       if (!snapshot.hasData)
   //         return new Container();

   //       api.MemeStream content = snapshot.data[0];

   //       print("content");
   //       print(content);
   //       print(content.memes.length);

   //       //return new MemeHome(content.memes);
   //       //return new content.memes.map<Widget>((api.MemeDetail item) {return new MemeTile(item: item); }).toList();
   //     return new CustomScrollView(
   //       slivers: <Widget>[
   //         new SliverGrid.count(
   //           crossAxisCount: 1,
   //           children: content.memes
   //               .map<Widget>((api.MemeDetail item) {
   //             return new MemeTile(item: item);
   //           }).toList(),
   //         ),
   //       ],
   //     );


   //     //return new ListView(
   //     //      children: content.memes
   //     //          .map<Widget>((api.MemeDetail item) {
   //     //        return new MemeTile(item: item);
   //     //      }).toList(),
   //     //);
   //       //return new ListView.builder(
   //       //    itemCount: content.memes.length,
   //       //    itemBuilder: (BuildContext context, int index) {
   //       //      return new Container(
   //       //          child: new Image.network(content.memes[index].imageFifeUrl),
   //       //          );
   //       //    }
   //       //    );

   //     }
   //     );



  Widget build(BuildContext context) {

      return new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: new SafeArea(
                child: new Center(
                  child: new Text("memegen")
                  )),
                pinned: true,
                expandedHeight: 192.0,
                ),
              new SliverGrid.count(
                crossAxisCount: 1,
                children: [
                  new Text("foo"),
                  new Text("bar"),
                  new Text("baz"),
                ]
                ),

          ]
    );
  }


}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

        return new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: new SafeArea(
                child: new Center(
                  child: new Text("memegen")
                  )),
                pinned: true,
                expandedHeight: 192.0,
                ),
              new SliverGrid.count(
                crossAxisCount: 1,
                children: [
                  new Text("LOGGED IN"),
                  new Text("bar"),
                  new Text("baz"),
                ]
                ),

          ]
    );


  }

}
