import 'package:flutter/material.dart';

class DetailPage20 extends StatefulWidget {
   
  
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage20> {
  static const String url = 'https://media.istockphoto.com/photos/chicken-filled-green-enchiladas-traditional-mexican-meal-picture-id1217896132?b=1&k=20&m=1217896132&s=612x612&w=0&h=GfWI_bEjIH5-ML0MlK7Zyztcol3d2q8E8C5YEV_W_LM=';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Chip(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.fromLTRB(55, 12, 55, 12),
          label: Text("book now from Table Status",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            right: 15.0,
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ),
         
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            left: 25.0,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(width: 1.0, color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0)),
              alignment: Alignment.center,
              child: Text(
                "4.5",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 25.0,
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2))
                    ]),
                    child: Text(
                      "176 reviews",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Oaxacan Red Chile Enchiladas",
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildItemRow(context),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildItemRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://media.istockphoto.com/photos/chicken-filled-green-enchiladas-traditional-mexican-meal-picture-id1217896132?b=1&k=20&m=1217896132&s=612x612&w=0&h=GfWI_bEjIH5-ML0MlK7Zyztcol3d2q8E8C5YEV_W_LM="),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Consists of:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 150,
                child: Text(
                  "dried guajillo chiles, garlic, plum tomatoes, serrano chiles, onions, corn tortillas, shredded cooked chicken  ",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }


  }
