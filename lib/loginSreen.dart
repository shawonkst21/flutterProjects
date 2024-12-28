import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  @override
  loginState createState() => loginState();
}

class loginState extends State<loginScreen> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? selectedInterest;
  List<bool> selectedPreferences = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 21,
        ),
        elevation: 2.0,
        shadowColor: Colors.black,
      ),
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
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter email address",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
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
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter first name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: 16),

              // Last Name Field
              Text(
                "Last name",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter last name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: 16),

              // Password Field
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              TextFormField(
                obscureText: true, // To hide password input
                decoration: InputDecoration(
                  hintText: "Enter password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Must be 10 or more characters",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 8),

              // Date of Birth Section with Horizontal Scrolling
              Text(
                "Date of birth",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: Row(
                  children: [
                    // Day Dropdown
                    Container(
                      width: 90, // You can adjust the width to fit your design
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'DD',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: selectedDay,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDay = newValue;
                          });
                        },
                        items: List.generate(31, (index) {
                          return DropdownMenuItem<String>(
                            value: (index + 1).toString().padLeft(2, '0'),
                            child: Text((index + 1).toString().padLeft(2, '0')),
                          );
                        }),
                      ),
                    ),
                    SizedBox(width: 10),

                    // Month Dropdown
                    Container(
                      width: 130, // You can adjust the width to fit your design
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Month',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: selectedMonth,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMonth = newValue;
                          });
                        },
                        items: [
                          'January',
                          'February',
                          'March',
                          'April',
                          'May',
                          'June',
                          'July',
                          'August',
                          'September',
                          'October',
                          'November',
                          'December'
                        ].map((month) {
                          return DropdownMenuItem<String>(
                            value: month,
                            child: Text(month),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 10),

                    // Year Dropdown
                    Container(
                      width: 90, // You can adjust the width to fit your design
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'YYYY',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: selectedYear,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedYear = newValue;
                          });
                        },
                        items: List.generate(100, (index) {
                          int year = DateTime.now().year - index;
                          return DropdownMenuItem<String>(
                            value: year.toString(),
                            child: Text(year.toString()),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "You need to be 16 or Over to use Ebuy",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              Text(
                "Mostly Intersted in (optional):",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
             Container(
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.grey.shade300),
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5), // Shadow color with transparency
                     spreadRadius: 3, // Spread radius
                     blurRadius: 9, // Blur radius
                     offset: Offset(3, 3), // Shadow position (x, y)
                   ),
                 ],

               ),
               child:Row(
                 children: [
                   Expanded(
                     child: ListTile(
                       title: Text(
                         "Womenswear",
                         style: TextStyle(
                           fontSize: 14,
                         ),
                       ),
                       leading: Radio<String>(
                         value: "Womenswear",
                         groupValue: selectedInterest,
                         onChanged: (value) {
                           setState(() {
                             selectedInterest = value;
                           });
                         },
                       ),
                     ),
                   ),
                   Expanded(
                     child: ListTile(
                       title: Text("Menswear"),
                       leading: Radio<String>(
                         value: "Menswear",
                         groupValue: selectedInterest,
                         onChanged: (value) {
                           setState(() {
                             selectedInterest = value;
                           });
                         },
                       ),
                     ),
                   ),
                 ],
               ),
             ),
              SizedBox(height: 20),
              // Contact Preferences Section (Checkboxes)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,

                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Contact prefested in",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            // Optional close functionality
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Tell us which email you'd like:",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    CheckboxListTile(
                      title: Text("Discounts and sales",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      value: selectedPreferences[0],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedPreferences[0] = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text("New stuff",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      value: selectedPreferences[1],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedPreferences[1] = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text("Your exclusives",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      value: selectedPreferences[2],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedPreferences[2] = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text("App partners",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      value: selectedPreferences[3],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedPreferences[3] = value ?? false;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "By creating your account, you agree to our\nTerms and Conditions & Privacy Policy",
                        style: TextStyle(fontSize: 12, color: Colors.brown),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){}, child: Text("Sign Up",style: TextStyle(fontSize: 20),),style:ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rectangle shape
                ),
                backgroundColor:Colors.orange,
                foregroundColor:Colors.white,
                fixedSize: Size(400, 50)

              ),)
              ,SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
