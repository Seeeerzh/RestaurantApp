import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:NetworkImage('data:image/png;base64,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'),
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
                    
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "ComNets Lab",
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
                    "data:image/png;base64,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"),
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
                  "ComNets Lab is joint research laboratory of Akdeniz University, Alanya Alaaddin Keykubat University and Antalya Bilim University established in Antalya/TURKEY in 2014. Directors of the lab are Umit Deniz Ulusar and Fadi Al-Turjman. ComNets Lab’s mission is to contribute to scientific production at a universal level through collaborations with high-quality academic people and organizations. It aims to contribute to the technological transformation of information and to meet the needs of information, technology and other fields at a high level. The vision of ComNets Lab is to be a distinguished research laboratory that is open to the world and internationally recognized for its scientific studies, which continuously contributes to the quality of its research and technology studies in the world.The lab accepts people all over around world who are open minded and hard-working. There is no nationality or religious discrimination in the lab. We believe in idea of “Our diversity is our richness”",
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
