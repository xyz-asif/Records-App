

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
 List data = [];
 bool got_data = true;
 
Future fetch() async{
  http.Response response;
  response = await http.get(Uri.parse("your url here"));
  if( response.statusCode == 200){
  if(mounted){
      setState(() {
      data = json.decode(response.body);
      got_data = false;
      print(data) ;
    });
  }
  }
}



@override
void initState() {
  fetch();
  super.initState();
   
}

  @override
  Widget build(BuildContext context) {
    return got_data ? const Center(child: const CircularProgressIndicator(color: Colors.white60,)): SafeArea(
      child: Scaffold(
        appBar: AppBar(
           iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
         backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text("R E C O R D S", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
        body: ListView.builder(itemCount: data.length, itemBuilder: ((context, index) => Padding(
          padding: const EdgeInsets.only(top: 10,left: 15,right: 15,),
          child: GestureDetector(
            onTap: () {
              
            },
            child: Card(
                shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            ),elevation: 15,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Id : ",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white ),),
                        Text(data[index]["id"].toString(),style:TextStyle(color: Colors.white ) ,),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("Date : ",style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.white)),
                        Text(data[index]["date"].toString(),style:TextStyle(color: Colors.white )),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("Company : ",style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.white)),
                        Text(data[index]["company"].toString(),style:TextStyle(color: Colors.white )),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("Reason : ",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white )),
                        Text(data[index]["reason"].toString(),style:TextStyle(color: Colors.white )),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("Calls : ",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white )),
                        Text(data[index]["calls"].toString(),style:TextStyle(color: Colors.white )),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("Handled : ",style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.white)),
                        Text(data[index]["handled"].toString(),style:TextStyle(color: Colors.white )),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("Status : ",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white )),
                        Text(data[index]["status"].toString(),style:TextStyle(color: Colors.white )),
                      ],
                    ),
                    SizedBox(height: 5,),
              
                  ],
                ),
              ),
            ),
          ),
        ))),
      ),
    );
  }
}
