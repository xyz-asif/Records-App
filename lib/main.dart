
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
  "type": "service_account",
  "project_id": "data-356817",
  "private_key_id": "11ebab3a9def2c979a9f59983806648d559dd5cd",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCXohafmHkeL7kh\nH3xz3qqGKceUyWuwZHxkuqhPgsCUEjisCyDecFK5uTsu/EcSiyxy5KBeejr1ZtTU\nxn2bw7ei3XYBo1lzMEw4ZvyY+HL5fvgFAznT+3pYWnKiwyz7Sv8+KtMaIAtOFoWH\nNk4vev5Omb9t6a6j7aHby6LkrnJilzwCvKe6mvYHU55mLG+NIuFhBkdjGv+TneY5\nWEY8pPZtth8PWEPzFhmGIWGXsMb8dnAaEKPs/EERlsW73O3IzqZCn+IUxipVDfkl\nH63ZiR8+HjUNMnfTDA/DO2cVOTPbBmmE/RsXhoSgzM0TypBTg1qxXAmEQK+601x8\nFtkwACk9AgMBAAECggEAA8HPOAbHStFZj8cKcTUyr3P95Hi104nh2n2/ftzZWFyN\nN+y8qeue48gsUxE1fPGi2SPuD06NrcKYV79P9xnl2my3UvoQ/319CKa7RS+0FZd+\nSLgtk3bh2f+VDeWydHWFa9e+zEu/9qAwkHWZgVaq/MKVeivgmQzhxk2TjIFVXI5N\n81I1WLVXznXi/Et2dB4X82ibir03pw1AbCch3YGScPZd9akJ+wobT8Q1V8FXv6to\nh6e5tQL70AIFkUoyODv6fgcJgGwh6Iu0nIXxDdVNiZ+ameTfY8oyuH5oYd4j3XO2\nK8dL4VEGDZcqERwWZK9Ox6bHufe49VDF4GPLRH/ZVwKBgQDTnxv/BV7ES+IqGL6a\nDBBgDEQ0un107yUpFI3PQJ+8KJY3c1RvgwYQAjE3PuaQ8u/eIhsKhBbO3ML3akPB\nkI7H2DZpQAzoiQBYyIpkeJ0OyU8tLXFx3CBCURz5FVm4oR61FbqpNxcfhlpx9Ub8\nh6zzxVUybVQBeRIQwhAjSIDn7wKBgQC3boG7nO1JitRqXjojPXVlAYj8CJWY5M8B\nL3ntnyxpj2Hrpsm9QCYofNc2hJ0zbxt+R0U8LInF67QAPsUafrBD1lif/MxwOUL3\new3aCICKOj6+fM4x7HnYUdveIA6A8I8IXAFB0+QGcRg0+hJ2OEviZVtBcGZfh7dH\n6thWDvG1kwKBgFCUpnluFw7SAlWbRICuFVIteY9Gb90l7tV8sR748ZoZLlIBBWbM\n0nMoEouB1RPenb3M6NURRQoR/99sRE6hd+zbBKUBMakd+dbUzfXCA7QMrax7QFZl\nxpbaAhlKqvZly6aSlpg2lQR5CVmZVyVzmETeoDlqbfF9o4ZkDvcQdZ1bAoGAaEo3\nDoEpVC/Pl25dZZ3SugvGY21KCLTGkOj6TMS8DoRL6xxYBPaM+2YHQmLhsdWQ7xn8\nXjsAVfwtyhnmHKs88kTS/JtRbNjRnz1iYb2Fv5FgDROOdEn7+KaJ+F+Hf33GBL2y\npUeglJ0GY1Bu4LIfSufPm4QZYGUcKpJ2T2+Ns2sCgYBZgz0+DCg/cB03wMKXXQRq\nJR+MWtPRUydto4v+BFjJt5DRRyg9ySHxvPXDq9N4/nhp4mC3xz/VRGrwChZAp0Eq\nJ01Uopq7zhgaEepvIiljD47hhhZclnH+tkbaMYDvFcxSgjrVp/KTKDmIs2aZw9k1\n4yZN2ktTa4WL+fdb+tNkrg==\n-----END PRIVATE KEY-----\n",
  "client_email": "data-786@data-356817.iam.gserviceaccount.com",
  "client_id": "116567858700764657341",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/data-786%40data-356817.iam.gserviceaccount.com"
}

''';

static final id = '13caD5_ljQlwU3-VbbUeKSo-HnzrmEdfRXkhAWNAHitM';
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




