import 'package:flutter/material.dart';
class details extends StatefulWidget{
  @override
    _detsilstate createState()=> _detsilstate();
}
class _detsilstate extends State<details>{

  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/hii.png"),
                Text("View product 360 degree",style: TextStyle(fontSize: 20,color: Colors.brown,fontWeight:FontWeight.bold)),
                Padding(padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15)),
                Text("you can see the product with all angles,"
                    "true and convenient",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
                  row(),

                SizedBox(
                  height: 150,
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/login');

                }, child: Text("Get Started"),style:ElevatedButton.styleFrom(
                  backgroundColor:Colors.orange,
                  foregroundColor:Colors.white,
                  fixedSize: Size(300, 30),


                ),)
              ],
            ),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/hii.png"),
              Text("View product 360 degree",style: TextStyle(fontSize: 20,color: Colors.brown,fontWeight:FontWeight.bold)),
              Padding(padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10)),
              Text("you can see the product with all angles,"
                  "true and convenient",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
           //   Padding(padding: EdgeInsets.symmetric(horizontal: 40,vertical: 100)),

               row(),

              SizedBox(
                height: 150,
              ),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/login');
              }, child: Text("Get Started"),style:ElevatedButton.styleFrom(
                backgroundColor:Colors.orange,
                foregroundColor:Colors.white,
                fixedSize: Size(300, 30),


              ),)
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/hii.png"),
              Text("View product 360 degree",style: TextStyle(fontSize: 20,color: Colors.brown,fontWeight:FontWeight.bold)),
              Padding(padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15)),
              Text("you can see the product with all angles,"
                  "true and convenient",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),

               row(),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/login');

              }, child: Text("Get Started"),style:ElevatedButton.styleFrom(
                backgroundColor:Colors.orange,
                foregroundColor:Colors.white,
                fixedSize: Size(300, 30),


              ),)
            ],
          )
        ],
        physics: BouncingScrollPhysics(),
        onPageChanged: (index){
          setState(() {
            currentPage=index;
          });
        }
      ),
    );
  }
  Widget row()
  {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
         currentPage==0?Icon(Icons.circle,size: 10,color: Colors.purple):Icon(Icons.circle_outlined,size: 10,color: Colors.purple),
        currentPage==1?Icon(Icons.circle,size: 10,color: Colors.purple):Icon(Icons.circle_outlined,size: 10,color: Colors.purple),
        currentPage==2?Icon(Icons.circle,size: 10,color: Colors.purple):Icon(Icons.circle_outlined,size: 10,color: Colors.purple),


      ],

    );
  }
}
