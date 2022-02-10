import 'package:api/api_service.dart';
import 'package:api/custom_card.dart';
import 'package:api/home.dart';
import 'package:api/update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _titleEditingController = TextEditingController();
  ApiService apiService = ApiService();
  var tasks = [];

  void initState() {
    WidgetsBinding.instance!.addPersistentFrameCallback((timeStamp) {
      getData();
    });


    super.initState();
  }

  getData() async {
    tasks = await apiService.getAlbum();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: _titleEditingController,
                decoration: InputDecoration(
                    labelText: "task title", hintText: "enter your title"),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () async {
                  await apiService.sendAlbum(_titleEditingController.text);
                  getData();

                }, child: Text("save"),
                ),
              ),
              ...tasks.map((task)  {
               return CustomCard(
                  deleteFunction: (){},
                  updateFunction: (){},
                  title: task["title"],
                  child: Container(),);
              })


            ],
          ),
        ),
      ),
    );
  }
}
