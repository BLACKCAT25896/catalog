import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedBtn = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter UserName",
                      labelText: "UserName",
                    ),
                    onChanged: (value){
                      name = value;
                      setState(() {

                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Ink(

              child: InkWell(
                onTap: (){
                  setState(() {
                    changedBtn = true;
                  });
                  // Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width: changedBtn? 50:150,
                  alignment: Alignment.center,


                  child: changedBtn? Icon(Icons.done,color: Colors.white,):Text("Login",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(changedBtn?25:10),
                    color: Colors.deepPurple,
                    // shape: changedBtn? BoxShape.circle:BoxShape.rectangle,
                  ),
                ),
              ),
            ),
            // ElevatedButton(onPressed: (){
            //   Navigator.pushNamed(context, MyRoutes.homeRoute);
            //   print("button Pressed");
            // }, child: Text("Login"),
            // style: TextButton.styleFrom(minimumSize: Size(150, 40)),),
          ],
        ),
      ),
    );
  }
}
