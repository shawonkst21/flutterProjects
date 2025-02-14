import 'package:flutter/material.dart';

class SignuPage extends StatefulWidget {
  const SignuPage({super.key});

  @override
  signupState createState() => signupState();
}

class signupState extends State<SignuPage> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? selectedInterest;
  List<bool> selectedPreferences = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Sign up",
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: const TextStyle(
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
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username or Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "We'll send your order confirmation here",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // First Name Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter first name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),

              // Last Name Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter last name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.remove_red_eye)),
              ),
              const SizedBox(height: 8),
              const Text(
                "Must be 10 or more characters",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 8),

              // Date of Birth Section with Horizontal Scrolling
              const Text(
                "Date of birth",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: Row(
                  children: [
                    // Day Dropdown
                    SizedBox(
                      width: 90, // You can adjust the width to fit your design
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'DD',
                          hintStyle: const TextStyle(color: Colors.grey),
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
                    const SizedBox(width: 10),

                    // Month Dropdown
                    SizedBox(
                      width: 130, // You can adjust the width to fit your design
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Month',
                          hintStyle: const TextStyle(color: Colors.grey),
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
                    const SizedBox(width: 10),

                    // Year Dropdown
                    SizedBox(
                      width: 90, // You can adjust the width to fit your design
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'YYYY',
                          hintStyle: const TextStyle(color: Colors.grey),
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
              const Text(
                "You need to be 16 or Over to use Ebuy",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              const Text(
                "Mostly Intersted in (optional):",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Shadow color with transparency
                      spreadRadius: 3, // Spread radius
                      blurRadius: 9, // Blur radius
                      offset: const Offset(3, 3), // Shadow position (x, y)
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        dense: true, // Reduces vertical spacing
                        contentPadding:
                            EdgeInsets.zero, // Removes extra padding
                        title: const Text(
                          "Womenswear",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        leading: Radio<String>(
                          value: "Womenswear",
                          groupValue: selectedInterest,
                          materialTapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // Shrinks Radio button
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
                        dense: true, // Reduces vertical spacing
                        contentPadding:
                            EdgeInsets.zero, // Removes extra padding
                        title: const Text(
                          "Menswear",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        leading: Radio<String>(
                          value: "Menswear",
                          groupValue: selectedInterest,
                          materialTapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // Shrinks Radio button
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

              const SizedBox(height: 20),
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Contact prefested in",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            // Optional close functionality
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Tell us which email you'd like:",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text("Discounts and sales",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      value: selectedPreferences[0],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedPreferences[0] = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("New stuff",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      value: selectedPreferences[1],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedPreferences[1] = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("Your exclusives",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      value: selectedPreferences[2],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedPreferences[2] = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("App partners",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      value: selectedPreferences[3],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedPreferences[3] = value ?? false;
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "By creating your account, you agree to our\nTerms and Conditions & Privacy Policy",
                        style: TextStyle(fontSize: 12, color: Colors.brown),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rectangle shape
                    ),
                    backgroundColor: Colors.blueGrey.shade900,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(400, 40)),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              const Center(child: Text('- OR Continue with -')),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata),
                    color: Colors.red,
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.apple),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook),
                    color: Colors.blue,
                    iconSize: 30,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an Account?',
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
