import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> listPost=[
    {
      'Image':'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/sports-shoes-poster-design-template-a58174228e55386c4929efe474ebb13d_screen.jpg?ts=1661329820'
    },
    {'Image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_acQR5buVuMmb8D4i2ZFWdyXSxlpIhwpM5ZDHaPgqCo7Y3UKYEuqT_12SprMzH2BVkcg&usqp=CAU'
    }, {'Image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL5HdgUkpkuJTo8dFO8sEeGisOG47Xx9NMWgTqahCpX9JrwdsIyETm8AEfR5vNLYj_G7g&usqp=CAU'
    }, {'Image':'https://img.freepik.com/premium-psd/premium-classic-watch-promotion-social-media-instagram-story-banner-template_70055-879.jpg'
    },
  ];

  List<Map<String,dynamic>> listDet=[
    {
      'Image':'https://img.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19723.jpg',
      'Text':'Mens\nFashion'
    },{
      'Image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPgG9N560fvjhW8uvJiuv_ltkLKxrkf4_LDQ&usqp=CAU',
      'Text':'Shoes'
    },{
      'Image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIVH0anGz7ZU4tWdZF-DhNXzMUOU_FxiACGA&usqp=CAU',
      'Text':'Watch'
    },{
      'Image':'https://images.unsplash.com/photo-1513094735237-8f2714d57c13?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d29tZW4lMjBmYXNoaW9ufGVufDB8fDB8fHww',
      'Text':'Womens\nFashion'
    },{
      'Image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN_Vmax4XAgNv2q98duYoovaRqF2Z96sviRQ&usqp=CAU',
      'Text':'Jewelry'
    },{
      'Image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyZXmU9VlthLLhslRwmdjhHI9aZdcqI-juWA&usqp=CAU',
      'Text':'Kids\nClothes'
    },
  ];

  List<Map<String,dynamic>> listClo=[
    {
      'Image':'assets/images/hea.png',
      'Text':'HeadPhone',
      'Text2':'\$560',

    }, {
      'Image':'assets/images/swet.png',
      'Text':'Sweter',
      'Text2':'\$678',

    }, {
      'Image':'assets/images/what.png',
      'Text':'Watch',
      'Text2':'\$900',

    }, {
      'Image':'assets/images/shoes.png',
      'Text':'Men Shoes',
      'Text2':'\$599',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: 10,right: 10,top: 50),
        child: Column(children: [
          Padding(
            padding:  EdgeInsets.only(bottom: 12,),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffe3e3e3)),
                    child: Icon(Icons.menu,size: 32,)),
                Container(width: 50,
                    height: 50,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffe3e3e3)),child: Icon(Icons.notifications_none_outlined,size: 32)),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffe3e3e3),
              suffixIcon: SizedBox(width: 60,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.filter_list_rounded,size: 32,),
                      // Icon(Icons.image,size: 32,),
                    ],
                  ),
                ),
              ),
              hintStyle: TextStyle(fontSize: 23,),
              prefixIcon: Icon(Icons.search,size: 38,),
              hintText: 'Search...',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40,),
                  borderSide: BorderSide(color: Color(0xffe3e3e3))
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40,),
                  borderSide: BorderSide(color: Color(0xffe3e3e3))
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4, itemBuilder: (BuildContext c,i) =>
                Container(
                  width: 415,
                  margin: EdgeInsets.only(top: 15,left: 5,right: 5,bottom: 5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(listPost[i]['Image'],fit: BoxFit.fill,)),
                )
            ),
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listDet.length, itemBuilder: (BuildContext c,i) =>
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipOval(child: Image.network(listDet[i]['Image'],fit: BoxFit.fill,))),
                    ),
                    Text(listDet[i]['Text'],style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                  ],
                )
            ),
          ),
          Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Text(' Special For You',style: TextStyle(fontSize: 30,fontWeight: FontWeight.normal),),
              Text(' See all ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal,color: Colors.grey.shade600),),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: listClo.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9/14
              ),
              itemBuilder: (c, i) =>
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffe3e3e3),
                        ),
                        margin: EdgeInsets.all(5),
                      ),
                      Align(alignment: Alignment.topRight,
                        child: Container(
                          width: 48,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(22)),
                            color: Colors.orange.shade700,
                          ),
                          margin: EdgeInsets.all(5),
                          child: Center(child: Icon(Icons.favorite_border,color: Colors.white,size: 30,)),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        bottom: 82,
                        child: SizedBox(
                          width: 180,
                          height: 190,
                          child: ClipRRect(
                            child: Image.asset(listClo[i]['Image'],fit: BoxFit.fill,),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 23,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(listClo[i]['Text'],style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                            Text(listClo[i]['Text2'],style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 12,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(3),
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black
                              ),

                            ),
                            Container(
                              margin: EdgeInsets.all(3),
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(3),
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange
                              ),
                            ),
                            Center(child: Text('+2')),
                          ],
                        ),
                      ),
                    ],
                  ),),
          ),

        ],
        ),
      ),
    );
  }
}