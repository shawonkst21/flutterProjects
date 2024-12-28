import 'package:flutter/material.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  _detsilstate createState() => _detsilstate();
}

class _detsilstate extends State<details> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/viewProduct.png"),
                const Text("Choose Products",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold)),
                const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                const Text(
                  "Discover trendy picks to elevate your style effortlessly! Shop the latest must-haves today!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 40,
                ),
                row(),
                const SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(300, 30),
                  ),
                  child: const Text("Get Started"),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/test.png"),
                const Text("View product 360 degree",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold)),
                const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                const Text(
                  "you can see the product with all angles,"
                  "true and convenient",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                //   Padding(padding: EdgeInsets.symmetric(horizontal: 40,vertical: 100)),

                row(),

                const SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(300, 30),
                  ),
                  child: const Text("Get Started"),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/hii.png"),
                const Text("View product 360 degree",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold)),
                const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                const Text(
                  "you can see the product with all angles,"
                  "true and convenient",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                row(),
                const SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(300, 30),
                  ),
                  child: const Text("Get Started"),
                )
              ],
            )
          ]),
    );
  }

  Widget row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        currentPage == 0
            ? const Icon(Icons.circle, size: 10, color: Colors.purple)
            : const Icon(Icons.circle_outlined, size: 10, color: Colors.purple),
        currentPage == 1
            ? const Icon(Icons.circle, size: 10, color: Colors.purple)
            : const Icon(Icons.circle_outlined, size: 10, color: Colors.purple),
        currentPage == 2
            ? const Icon(Icons.circle, size: 10, color: Colors.purple)
            : const Icon(Icons.circle_outlined, size: 10, color: Colors.purple),
      ],
    );
  }
}
