import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:dsc/screens/add_item.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = [];
  var price = [];
  var time = [];
  var quant = [];
  var desc =[];
  double sum = 0;

  Widget itemCheck() {
    if (items.isEmpty) {
      return Container();
    } else {
      return Container(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return 
                  itemBlock(index);
              }
                    ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }
  }

  Widget itemBlock(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 8.0, bottom: 16.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 200,
                                child: AutoSizeText(
                                  items[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: AutoSizeText(
                                      "Price: " + price[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: AutoSizeText(
                                      "Quantity: " + quant[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: AutoSizeText(
                                      desc[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: AutoSizeText(
                                      "\n"+time[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: AutoSizeText(
                          //"\u{20B9} "+price[index]+"*"+quant[index]+" = "+ val(price[index],quant[index]),
                          "\u{20B9} "+price[index]+"*"+quant[index]+" = "+ (double.parse(price[index]) * double.parse(quant[index])).toString(),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*String val(String p,String q)
  {
    double pr = double.parse(p);
    double qr = double.parse(q);
    pr = pr*qr;
    return pr.toString();
  }*/

  String Sum()
  {
    sum=0;
    if(price.length==0)
      return '0';

    for(int i=0;i<price.length;i++)
      {
        double p = double.parse(price[i]);
        double q = double.parse(quant[i]);
        sum = sum + p*q;
      }
    return sum.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Padding(
          padding: EdgeInsets.all(0.0),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                //color: Colors.indigo
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Item List",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left:20,top: 20.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              ]
          ),
          ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 6.0, bottom: 15.0),
                  margin : EdgeInsets.only(bottom:10.0),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, left: 8.0, right: 8.0),
                    child: ListView(
                          children: [
                            itemCheck(),
                          ],
                        )
                    ),
                  ),
                ),
              /*Positioned(
                bottom:50,
                child:*/Container(
                    padding: const EdgeInsets.all(15.0),
                    margin: EdgeInsets.only(
                         bottom: 20),
                    decoration: BoxDecoration(
                      //color: Color(0xffeb5757),
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)),
                    ),
                    width: MediaQuery.of(context)
                        .size
                        .width *
                        0.5,
                    child: Center(
                      child: AutoSizeText(
                        'Total: ' + Sum(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                //),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddItem(items,price,time,quant,desc)));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}