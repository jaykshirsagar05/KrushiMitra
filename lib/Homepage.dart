import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo/Start.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogggedin = false;
  User user;

  checkAuthentification() async
  {
    _auth.authStateChanges().listen((user) {

      if(user==null)
      {
        Navigator.push(context, MaterialPageRoute(

            builder: (context)=>Start()));
      }
    });

  }

  getuser() async
  {

    User Firebaseuser= await _auth.currentUser;
    await Firebaseuser?.reload();
    Firebaseuser =  _auth.currentUser;

    if(Firebaseuser != null)
      {

        setState(() {
          this.user = Firebaseuser;
          this.isLogggedin=true;
        });
      }


  }

  void initState()
  {

    this.checkAuthentification();
    this.getuser();

  }

  SignOut() async
  {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        child: !isLogggedin? CircularProgressIndicator():

        Column(
          children: [

            SizedBox(height: 60,),
            Container(

              height: 400,
              child: Image(
                image: AssetImage('Images/car.jpg'),
                fit: BoxFit.contain,
              ),

            ),
            Container(
              
              child: Column(
                children: [
                  Text("Name : ${user.displayName}"),
                  Text("Email : ${user.email}")
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(70, 10, 70,10),
                    onPressed: SignOut,
                    child: Text('LOGout',
                        style: TextStyle(

                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,

                        )),
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        ),
                  )

                ],

              ),
            ),

                        ])
      )

    );

  }
}
