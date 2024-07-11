import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget{
  List<Map<String,dynamic>> listItem=[
    {
      'Image':'assets/images/hea.png',
      'Text':'Wireless HeadPhone',
      'Text2':'\$560',
      'Text3':'Electronics',

    }, {
      'Image':'assets/images/swet.png',
      'Text':'Men Sweter',
      'Text2':'\$678',
      'Text3':'Mens Fashion',

    }, {
      'Image':'assets/images/what.png',
      'Text':'Watch',
      'Text2':'\$900',
      'Text3':'Electronics',

    }, {
      'Image':'assets/images/shoes.png',
      'Text':'Men Shoes',
      'Text2':'\$599',
      'Text3':'Mens Fashion',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffe3e3e3),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                      child: Icon(Icons.arrow_back_ios_new,size: 30,)),
                ),
                SizedBox(width: 100,),
                Text('My Cart',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w400),),
              ],
            ),
            SizedBox(
              width: 500,
              height: 520,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: listItem.length,
                itemBuilder: (c, i) =>
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 150,
                          width: 460,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                        ),
                        Positioned(
                          left: 20,
                          top: 20,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffe3e3e3)),
                            child: Image.asset(listItem[i]['Image']),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 40,
                          child: Container(
                            height: 150,
                            width: 250,
                            child: Column(children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Text(listItem[i]['Text'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500)),
                                Icon(Icons.delete,color: Colors.red,size: 30,),
                              ],),
                              Row(
                                children: [
                                  Text(listItem[i]['Text3'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.grey.shade600)),
                                ],
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Text(listItem[i]['Text2'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700)),
                                Container(
                                  height: 25,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffe3e3e3),
                                  ),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      Text('1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                      Text('+',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),

                              ],),
                            ],),
                          ),
                        )

                      ],
                    ),
              ),
            ),
            SizedBox(
              height: 300,
              child: Container(
                height: 100,
                width: 550,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 30,right: 15,left: 15),
                    child: Container(
                      height: 60,
                      width: 410,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffe3e3e3),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 10,right: 15),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Enter Discount Code',style: TextStyle(fontSize: 23,color: Colors.grey.shade600),),
                            Text('Apply',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xffff660e)))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,right: 15,left: 15),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal',style: TextStyle(fontSize: 30,color: Colors.grey.shade600),),
                        Text('\$2737.00',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700))

                      ],),
                  ),
                  Container(
                    height: 4,
                    width: 425,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffe3e3e3),
                    ),),

                  Padding(
                    padding: EdgeInsets.only(top: 10,right: 15,left: 15),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',style: TextStyle(fontSize: 30),),
                        Text('\$2737.00',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700))

                      ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                        height: 65,
                        width: 410,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xffff660e),
                        ),
                        child: Center(
                          child: Text('Ceckout',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white)),
                        )
                    ),
                  ),
                ],
                ),
              ),
            )
          ],
        )
    );
  }
}