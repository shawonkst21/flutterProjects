import 'package:flutter/material.dart';
class loginScreen extends StatefulWidget{
  @override
  loginState createState()=> loginState();
}
class loginState extends State<loginScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:AppBar(
          title: Text("Sign up",),
          centerTitle: true,
          titleTextStyle:TextStyle(
            color: Colors.black,
           fontWeight:FontWeight.bold,
            fontSize: 21,

          ),
          elevation: 2.0,
          shadowColor: Colors.black,
        ) ,
      body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      SizedBox(
        height: 20,
      ),
    Text(
    "Email address",
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
    ),
    TextFormField(
    decoration: InputDecoration(
    //  labelText: "hii",
    hintText: "Enter email address",
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 15
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),

      ),

    ),
    ),
    SizedBox(height: 8),
    Text(
    "We'll send your order confirmation here",
    style: TextStyle(fontSize: 12, color: Colors.grey),
    ),
    SizedBox(height: 16),

    // First Name Field
    Text(
    "First name",
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
    ),
    TextFormField(
    decoration: InputDecoration(
        hintText: "Enter first name",
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      hintStyle: TextStyle(
        color: Colors.grey
      )
    ),
    ),
    SizedBox(height: 16),

      Text(
        "Last name",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
      ),
      TextFormField(
        decoration: InputDecoration(
            hintText: "Enter last name",
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: TextStyle(
                color: Colors.grey
            )
        ),
      ),
      SizedBox(height: 16),

    // Password Field
    Text(
    "Password",
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
    ),
    TextFormField(
    obscureText: true, // To hide password input
    decoration: InputDecoration(
      hintText: "Enter password",
      hintStyle:TextStyle(
        color: Colors.grey
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
      )
    ),
    ),
    SizedBox(height: 8),
    Text(
    "Must be 10 or more characters",
    style: TextStyle(fontSize: 12, color: Colors.grey),
    ),
    ],
    ),
      ),
    )
    );
  }

}