
// ignore: avoid_web_libraries_in_flutter

import 'package:asif/api.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:gsheets/gsheets.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await User.init();
   runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),));}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

TextEditingController one = TextEditingController();
TextEditingController two = TextEditingController();
TextEditingController three = TextEditingController();
TextEditingController four = TextEditingController();
TextEditingController five = TextEditingController();
TextEditingController six = TextEditingController();
TextEditingController seven = TextEditingController();
TextEditingController eight = TextEditingController();

@override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  initUser();
  }

void initUser(){
 one = TextEditingController();
 two = TextEditingController();
 three = TextEditingController();
 four = TextEditingController();
 five = TextEditingController();
 six = TextEditingController();
 seven = TextEditingController();
 eight = TextEditingController();
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(45.0,30,45,40),
            child: Column(
              
              children: [

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
        Text("F O R M S",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        IconButton(onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Display()),
  );
        }, icon: Icon(Icons.assignment,size: 30,))
  ],
),


    SizedBox(height: 25,),

                // one
    TextField(
      controller: one,
      decoration: InputDecoration(
      labelText: 'Id',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    ),
                  // 
    SizedBox(height: 25,),
    
      TextField(
      controller: two,
      decoration: InputDecoration(
      labelText: 'Date',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    ),
    
    SizedBox(height: 25,),
       TextField(
      controller: three,
      decoration: InputDecoration(
      labelText: 'Company',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    ),
            SizedBox(height: 25,),      
    TextField(
      controller: four,
      decoration: InputDecoration(
      labelText: 'Reason',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    ),
    
               SizedBox(height: 25,),   
    TextField(
      controller: five,
      decoration: InputDecoration(
      labelText: 'Calls',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    ),
    SizedBox(height: 25,),
                  
      TextField(
      controller: six,
      decoration: InputDecoration(
      labelText: 'Handled',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    ),
    
           SizedBox(height: 25,),       
    TextField(
      controller: seven,
      decoration: InputDecoration(
      labelText: 'Status',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    ),
    SizedBox(height: 25,),
                  
     TextField(
      controller: eight,
      decoration: InputDecoration(
      labelText: 'Task',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          
          backgroundColor: Colors.black12,
          foregroundColor: Colors.black45,
          onPressed: ()async{
    if(one.text == "" || two.text == "" || three.text == "" || four.text == "" || five.text == "" || six.text == "" || seven.text == "" || eight.text == "" ){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Enter every field!'),
        )     );
    }else{
     final c = U(date: two.text, company: three.text, reason: four.text, calls: five.text, handled: six.text, status: seven.text, task: eight.text,id: one.text);
          await User.insert([c.toJson()]);
       showDialog(context: context, builder: (BuildContext context) {
   return new AlertDialog(
      title: new Text("SUCCESS!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      content: new Text("Details uploaded to sheets"),
   );
       } );
          one.clear();
          two.clear();
          three.clear();
          four.clear();
          five.clear();
          six.clear();
          seven.clear();
          eight.clear();
    }
     
        } , child:  Icon(Icons.upload,color: Colors.black,)),
      ),
    );
  }
}



class User{
  static const credentials = r'''
{
your credentials here
}

''';

static final id = 'your google sheets id';
static final gsheets = GSheets(credentials);
static Worksheet? us;

static Future init() async{
  try{
  final spreadsheet = await gsheets.spreadsheet(id);
  us = await getWorkSheet(spreadsheet, title:"staff" );
  final firstRow = Uf.getF();
  us!.values.insertRow(1, firstRow);
} catch (e){
  print(e.toString());
}
}
static Future <Worksheet> getWorkSheet(
  Spreadsheet ss, {
    required String title,
  }
) async {
  try{
    return await ss.addWorksheet(title);
  }catch (e){
    return ss.worksheetByTitle(title)!;
  }
}


static Future insert(List<Map<String,dynamic>> rowList)async{
  if(us == null) return;
  us!.values.map.appendRows(rowList);
}

}




class Uf{
  static final String id = "Id";
  static final String date = "Date";
  static final String company = "Company";
  static final String reason = "Reason";
  static final String  received_calls= "Received Calls";
  static final String handled = "Handled";
  static final String status = "Status";
  static final String task = "Task";

  static List getF()=>[id,date,company,reason,received_calls,handled,status,task];
}


class U{
  final String id;
  final String date;
  final String company;
  final String reason;
  final String calls;
  final String handled;
  final String status;
  final String task;

  U({ required this.id, required this.date,required this.company,required this.reason,required this.calls,required this.handled,required this.status,required this.task});




Map <String , dynamic> toJson()=>{
  Uf.id : id,
  Uf.date : date,
  Uf.company : company,
  Uf.reason : reason,
  Uf.received_calls : calls,
  Uf.handled : handled,
  Uf.status : status,
  Uf.task : task,

};
}




