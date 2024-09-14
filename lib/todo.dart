import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class todo extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  todo({super.key,required this.taskname,required this.taskcompleted,required this.onChanged,required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.all(20.0),
    child: Slidable(endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
          onPressed: deleteFunction,
          icon: Icons.delete,
          )
        ]),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Checkbox(value: taskcompleted, onChanged: onChanged,
            activeColor: Color.fromARGB(255, 255, 255, 255),
            checkColor: Color.fromARGB(188, 54, 54, 54),
            ),
            Text(taskname, 
            style: TextStyle(decoration: taskcompleted ? TextDecoration.lineThrough:TextDecoration.none),
            textScaler: TextScaler.linear(1.25),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 204, 204, 204),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
    );
  }
}
class dialoggbox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  dialoggbox({super.key,required this.controller,required this.onsave,required this.oncancel});
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 189, 189, 189),
      content: Container(
        child: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "what is your task ?",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button(text: 'cancel', onPressed: oncancel),
                  button(text: 'save', onPressed: onsave)
                ],
              )
            ],
          ),
        ),
    )
    );
  }
}
class button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
button({super.key, required this.text,  required this.onPressed}
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    color: Theme.of(context).primaryColor,
    child: Text(text),
    );
  }
}