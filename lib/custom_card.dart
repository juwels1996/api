import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {

  final Function updateFunction;
  final String title;
  final Function deleteFunction;
  final Widget child;



  const CustomCard({
    required this.deleteFunction, required this.updateFunction, required this.title,required this.child
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.edit,color: Colors.red,),
                  onPressed: widget.updateFunction()
              ),
              Container(
                child: widget.child,
              ),

              Expanded(child: Container(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.title}")
                ],
              ),)
              ),
              IconButton(
                  onPressed: widget.deleteFunction(),

                  icon: Icon(Icons.delete,color: Colors.red,))
            ],
          ),

        ),
      ),
    );
  }
}
