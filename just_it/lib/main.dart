import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void launchWhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";

    await canLaunch(url) ? launch(url) : print("cant open ");
  }

  var _message;
  var _phone;
  final opmessage = new TextEditingController();
  final opphone = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:
        PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child:AppBar(
          backgroundColor: Colors.greenAccent,

          centerTitle: true,
          title: Text('Just IT'),
        ),),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment,
            children: [
              SizedBox(height: 150),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                controller: opphone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),

                ),
                  hintText: "Enter the whatsApp Number",

                ),
              ),
              ),
              SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),

            child: TextField(
                controller: opmessage,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                  hintText: "Enter the Message!",
                ),
              ),),
              SizedBox(height: 50),
              RaisedButton(
                color: Colors.greenAccent,
                onPressed: () {
                  _phone = opphone.text;
                  _message = opmessage.text;
                  launchWhatsapp(number: _phone, message: _message);
                },
                child: Text(
                  "Send via whatsapp",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
