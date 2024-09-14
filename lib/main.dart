import 'package:flutter/material.dart';
import 'todo.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:homepage() ,
    );
    }
    }
bool? ischecked=false;
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}
class _homepageState extends State<homepage> {
  //text controller
  final _controller=TextEditingController();
  //the actual todo list
  List todolist = [];
  //the newtask method
  void newtask (){
    setState(() {
      todolist.add([_controller.text,false]);
    });
  }

  void checkboxchanged(bool? value, int index){
    setState(() {
      todolist[index][1] =!todolist[index][1];
    });
  }
  void createnewtask(){
    showDialog(context: context, builder: (context){
      return dialoggbox(controller:_controller ,
      onsave: newtask,
      oncancel: (){
        Navigator.of(context).pop();
      },
      );
    }
  );
  }
  void deletetask(int index){
    setState(() {
      todolist.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBodyBehindAppBar: true,
     appBar: AppBar(title: Title(color: const Color.fromARGB(255, 8, 8, 8), child:const Text('TheList',)),centerTitle: true,),
     floatingActionButton: FloatingActionButton(onPressed: createnewtask,
     backgroundColor: Color.fromARGB(255, 218, 218, 218),
     child: Icon(Icons.add),
     ),
     body:ListView.builder(
      itemCount: todolist.length,
      itemBuilder: (context,index){
        return todo(taskname: todolist[index][0], taskcompleted:todolist[index][1] , onChanged: (value) =>checkboxchanged(value,index) ,deleteFunction: (context) =>deletetask ,);
      },
     ) ,
     );
  }
}
