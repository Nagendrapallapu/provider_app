import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Itemlist.dart';
import 'package:provider_app/model/item.dart';
import 'package:provider_app/model/item_data.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(

      create: (context) => ItemData() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green
        ),
        home: Home(

        ),

      ),
    );
  }
}

class Home extends StatefulWidget {



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController textEditingController = TextEditingController(text: "items");

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<ItemData>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Items List'),
        ),
        body: Center(
          child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 150)),
                TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Item",
                      border: OutlineInputBorder(),
                    )
                ),
                ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    // Add the item to the ItemData list
                    return itemData.items(textEditingController.text as Item);
                    // Clear the text field
                    textEditingController.clear();
                  },
                ),
                Container(
                  child: Column(
                    children: [
                      Text("Item List", style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(itemCount: itemData.items.length,itemBuilder: (context,index){
                          return ListTile(
                            title: Text(itemData.items[index]),
                          );
                        },),
                      )
                    ],
                  ),
                )
              ]
          ),
        )
    );
  }
}
