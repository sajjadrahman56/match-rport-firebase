import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:match_score/infoformation_screen.dart';


class MatcheDataFetch extends StatefulWidget {
  const MatcheDataFetch({super.key});

  @override
  State<MatcheDataFetch> createState() => _MatcheDataFetchState();
}

class _MatcheDataFetchState extends State<MatcheDataFetch> {

  List<Match> matchesList = [];

  Future<void> dataFeaatch() async {
    
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('matches-history').get();
    print(result.docs.length);
    
    for(QueryDocumentSnapshot element in result.docs){
      print(element.data());
      print(element.get('title'));

      Match matchReport = Match(
          element.get('title'),
          element.get('score'),
          element.get('time'),
          element.get('fullTime'),
      );

      matchesList.add(matchReport);
    }
    if(mounted)
      {
        setState(() {

        });
      }
  }
 
 void initState() {
    super.initState();
    dataFeaatch();
  }
  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
        appBar: AppBar(
          title: const Text('Match List' , style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,

        ),
        body: ListView.builder(
          itemCount: matchesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: index%2==0 ? Colors.cyan: Colors.yellow,
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          InformationDescription(
                        title: matchesList[index].title,  score: matchesList[index].score,
                              time: matchesList[index].time,fullTime: matchesList[index].fullTime
                      )),
                    );
                  },
                  title: Text(matchesList[index].title,style: const TextStyle(fontWeight: FontWeight.bold),),
                trailing: const Icon(Icons.arrow_forward_outlined),
                ),
              ),
            );
          },),
     );
  }
}

class Match{
  String title;
  String score;
  String time;
  String fullTime;
  Match(this.title,this.score,this.time,this.fullTime);
}