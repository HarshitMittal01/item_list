import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
class AddItem extends StatefulWidget {
  var items;
  var price;
  var time;
  var quant;
  var desc;
  AddItem(this.items,this.price,this.time,this.quant,this.desc);
  @override
  _AddItemState createState() => _AddItemState(items,price,time,quant,desc);
}

class _AddItemState extends State<AddItem> {
  var itemName = TextEditingController();
  var itemPrice = TextEditingController();
  var quantity = TextEditingController();
  var description = TextEditingController();
  var items ;
  var price ;
  var time;
  var quant;
  var desc;

  _AddItemState(this.items,this.price,this.time,this.quant,this.desc);
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    //String formattedDate = DateFormat('EEE d MMM  kk:mm:ss ').format(now);
    String formattedtime = DateFormat.jm().format(now);
    String formatteddate = "  "+now.year.toString()+"-"+now.month.toString()+"-"+now.day.toString();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child:Center(
          child: Column(
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
                                "Add Item",
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
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 30, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20))),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Item Name: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      TextField(
                          controller: itemName,
                          decoration: InputDecoration(),
                          onSubmitted: (text) {}
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 30, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20))),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Item Price: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      TextField(
                          controller: itemPrice,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter
                                .digitsOnly
                          ],
                          decoration: InputDecoration(),
                          onSubmitted: (text) {}
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 30, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20))),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Quantity: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      TextField(
                          controller: quantity,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter
                                .digitsOnly
                          ],
                          decoration: InputDecoration(),
                          onSubmitted: (text) {}
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 30, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20))),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Description: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      TextField(
                          controller: description,
                          decoration: InputDecoration(),
                          onSubmitted: (text) {}
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if(itemName.text=='')
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              content: Text(
                                  'Item Name not specified!!')
                          );
                        },
                      );
                    }
                  else if(itemName.text!='' && itemPrice.text=='')
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              content: Text(
                                  'Item Price not specified!!')
                          );
                        },
                      );
                    }
                  else if(itemName.text!='' && itemPrice.text!='' && quantity.text=='')
                  {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Text(
                                'Quantity not specified!!')
                        );
                      },
                    );
                  }
                  else if(itemName.text!='' && itemPrice.text!='' && quantity.text!='' && description.text=='')
                  {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Text(
                                'Description not specified!!')
                        );
                      },
                    );
                  }
                  else
                    {
                      items.add(itemName.text);
                      price.add(itemPrice.text);
                      time.add(formattedtime+formatteddate);
                      quant.add(quantity.text);
                      desc.add(description.text);

                      itemName.value = TextEditingValue.empty;
                      itemPrice.value = TextEditingValue.empty;
                      quantity.value = TextEditingValue.empty;
                      description.value = TextEditingValue.empty;

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              content: Text(
                                  'Item Added!!')
                          );
                        },
                      );
                    }

                },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: EdgeInsets.only(
                      top: 20, bottom: 10),
                  decoration: BoxDecoration(
                    //color: Color(0xffeb5757),
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context)
                      .size
                      .width *
                      0.7,
                  child: Center(
                    child: AutoSizeText(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}