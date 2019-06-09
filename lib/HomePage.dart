import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AudioCache audioPlayer = AudioCache();
  List<NumberAudio> numberList = [
    NumberAudio("one.wav",Colors.red,"One"),
    NumberAudio("two.wav",Colors.purple,"two"),
    NumberAudio("three.wav",Colors.blue,"three"),
    NumberAudio("four.wav",Colors.green,"four"),
    NumberAudio("five.wav",Colors.orange,"five"),
    NumberAudio("six.wav",Colors.yellow,"six"),
    NumberAudio("seven.wav",Colors.black,"seven"),
    NumberAudio("eight.wav",Colors.pink,"eight"),
    NumberAudio("nine.wav",Colors.indigo,"nine"),
    NumberAudio("ten.wav",Colors.grey,"ten"),
  ];

  play(String uri){
    audioPlayer.play(uri);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spanish Numbers"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/logo.png"),

              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: numberList.length,
                  itemBuilder: (context,i) => SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: numberList[i].buttonColor,
                      child: Text(numberList[i].buttonText,style: TextStyle(fontSize: 20.0,color: Colors.white),),
                      onPressed: (){
                        play(numberList[i].audioUri);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}