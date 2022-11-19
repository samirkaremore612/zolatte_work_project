import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zolatte_work_project/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var size,height,width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Column(
        children: [
          appBar(),
          GetInfo()

        ],
      ),
    );
  }
}
class appBar extends StatelessWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        width:double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 30,
            shadowColor: Colors.white70,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(15))),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.fromLTRB(4, 40, 100, 2),

                  child: Text("Hello Their..\n $username",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                TextButton(onPressed: (){}, child: Text("Submit details"))

              ],

            ),

          ),
        ),
      ),
    );
  }
}
class GetInfo extends StatefulWidget {
  const GetInfo({Key? key}) : super(key: key);

  @override
  State<GetInfo> createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileNoCntroller = TextEditingController();
  TextEditingController adressCntroller = TextEditingController();
  TextEditingController massageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Expanded(child: Container(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(5))),
          elevation: 30,
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => adress,
                  controller: adressCntroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adress',
                    hintText: 'Enter your adress here',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => mobile_no,
                  controller: mobileNoCntroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile No',
                    hintText: 'Enter your Mobile No'
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => age,
                  controller: ageController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age',
                      hintText: 'Enter your age here'
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 20),
                  child: TextField(
                    onChanged: (value) => massage,
                    controller: massageController ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'any massage',
                      hintText: 'any massge or feedback for us',
                    ),
                  ),
                ),
                
              ),
              Expanded(
                child: Container(decoration:BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),

                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextButton(onPressed: (){
                        FirebaseFirestore.instance
                            .collection('data')
                            .add({'text': 'data added through app'});
                      }, child: Text("Submit details",style: TextStyle(
                        color: Colors.white70
                      ),
                      )),
                    )),
              )


            ],
          ),
        ),
       )),
    );
  }
}


