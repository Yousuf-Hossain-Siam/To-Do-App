import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/todo_model.dart';
import 'package:todo_app/Provider/todo_provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _textController = TextEditingController();
  
  Future<void>_showDialog() async{
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Add todo List"),
        content: TextField(
          controller: _textController ,
          decoration: InputDecoration(hintText: "write to do item"),
        ),
        actions: [
          TextButton(onPressed: (){

            if (_textController.text.isEmpty) {
              return;
            }

            context.read<TodoProvider>().addTodoList( TodoModel(title: _textController.text, isCompleted: false));
              _textController..clear();

            Navigator.pop(context);
          }, child: Text("Submit")),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
          
        ],
        );
    });
  } 






  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TodoProvider>(context);
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Container(
              width: double.infinity,
              child: Center(child: Text("To Do List" ,style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold) ,)),
             decoration: BoxDecoration(color: const Color.fromARGB(255, 63, 95, 202),
             borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
            )),
              Expanded(
                flex: 4,
                child:ListView.builder(itemBuilder: (context, itemIndex){
                 return ListTile(
                  
                  leading: MSHCheckbox(
                    size: 30,
                    value: provider.allTodoList[itemIndex].isCompleted,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(checkedColor: Colors.blue),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {
                      provider.todoStatusChange(provider.allTodoList[itemIndex]);
                    },
                    ),
                  title: Text(provider.allTodoList[itemIndex].title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25, decoration: 
                  provider.allTodoList[itemIndex].isCompleted == true ? TextDecoration.lineThrough : null),
                  ),

                  trailing: IconButton(onPressed: (){
                    provider.removeTodoList(provider.allTodoList[itemIndex]);
                  }, icon: Icon(Icons.delete)),
                  );
                },
                itemCount: provider.allTodoList.length,
                )
                 ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: (){_showDialog();},child: Icon(Icons.add,color: Colors.white,) ,),
    );
  }
}