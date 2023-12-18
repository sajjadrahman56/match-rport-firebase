import 'package:flutter/material.dart';

class InformationDescription extends StatefulWidget {
   const InformationDescription({super.key , required this.title, required this.score, required this.time, required this.fullTime});
  final String title;
  final String score;
  final String time;
  final String fullTime;

  @override
  State<InformationDescription> createState() => _InformationDescriptionState();
}
class _InformationDescriptionState extends State<InformationDescription> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:   Text( widget.title   , style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,

      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white, // This will set the background color to white.
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // This is the color of the shadow.
                spreadRadius: 5, // This will spread the shadow outwards.
                blurRadius: 7, // This will blur the shadow.
                offset: const Offset(0, 3), // This will move the shadow vertically downwards by 3.
              ),
            ],
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Text(widget.title,style: const TextStyle(fontSize: 20,color: Colors.grey , fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(widget.score,style: const TextStyle(fontWeight: FontWeight.bold ,fontSize: 20,)),
              const SizedBox(height: 5),

              Text('Time : ${widget.time}',style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),

              Text( 'Total Time : ${widget.fullTime}',style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
            ],
          ),
        ),
      )
    );
  }
}


class Info{
  String bio;
  Info(this.bio);
}
