import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotitle extends StatelessWidget {
  final String taskname;
  final bool taskcomplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;
  Todotitle(
      {super.key,
      required this.taskname,
      required this.taskcomplete,
      required this.onChanged,
      required this.deletefunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: taskcomplete,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskname,
                style: TextStyle(
                    decoration: taskcomplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
