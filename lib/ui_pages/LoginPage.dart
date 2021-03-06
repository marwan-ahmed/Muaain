import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class  LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateLoginPage();
  }

}

FirebaseAuth myAuth = FirebaseAuth.instance;

class StateLoginPage extends State<LoginPage>{

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(backgroundColor:new Color(0xffff006064),
        elevation: 0,
      ),

      body: new ListView(
          children: <Widget>[

            new Container(
              alignment: Alignment.center,
              height: 200,
              color: new Color(0xffff006064),
              child: new Text('تسجيل الدخول',style: new TextStyle(fontSize: 30,color: Colors.white),),
            ),


            new Container(
              padding: EdgeInsets.all(50),
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Column(
                      children: <Widget>[
                        new TextField(
                          controller: _email,
                          decoration: InputDecoration(labelText: 'البريد الالكتروني'),
                        ),

                        new TextField(
                          controller: _password,
                          decoration: InputDecoration(labelText: 'كلمة المرور'),
                        ),

                        new Padding(padding: EdgeInsets.only(top: 40)),


                        new Padding(padding: EdgeInsets.only(top: 40)),

                        new RaisedButton(onPressed: (){
                          myAuth.signInWithEmailAndPassword(email: _email.text,
                              password: _password.text).then((_){
                            Navigator.of(context).pushReplacementNamed('/HomePage');
                          });
                        },
                          elevation: 5,
                          color: new Color(0xffff006064),
                          shape: RoundedRectangleBorder(
                              borderRadius:new BorderRadius.circular(10)),

                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              new Text('تسجيل الدخول',style: new TextStyle(fontSize: 25,color: Colors.white),),

                            ],
                          ),
                        ),


                      ],
                    ),
                  )

                ],
              ),
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new FlatButton(onPressed: (){
                  Navigator.of(context).pushNamed('/Register');
                },
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('انشاء حساب',style: TextStyle(fontSize: 20,color: Color(0xffff006064),fontWeight: FontWeight.bold),),
                        new Padding(padding: EdgeInsets.only(left: 15)),
                        new Icon(Icons.person_add,color: Color(0xffff006064),)
                      ],
                    )
                ),

                new Text('لا تمتلك حساب؟',
                    textDirection:TextDirection.ltr ,
                    style: new TextStyle(fontSize: 18,color: Colors.black ,)
                ),


              ],
            ),

          ]
      ),
    );
  }

}