import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );
  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
          child: Text("STOPWATCH",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              )),
        ),
        Expanded(
          // Wrap the Container with Expanded widget
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.shade800, width: 1),
              // boxShadow: [
              //   BoxShadow(
              //       offset: Offset(5, 5),
              //       color: Colors.black38,
              //       blurRadius: 10),
              //   BoxShadow(
              //       offset: Offset(-10, -5),
              //       color: Colors.white.withOpacity(0.85),
              //       blurRadius: 10)
              // ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.timer, size: 60, color: Colors.blue.shade900),
                StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    builder: (context, snapshot) {
                      return Text(StopWatchTimer.getDisplayTime(snapshot.data!),
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold));
                    })
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                  onPressed: () async {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                    setState(() {});
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.refresh,
                        size: 60, color: Colors.blue.shade900),
                  )),
              FlatButton(
                  onPressed: () async {
                    _stopWatchTimer.onExecute.add(_stopWatchTimer.isRunning
                        ? StopWatchExecute.stop
                        : StopWatchExecute.start);
                    setState(() {});
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: _stopWatchTimer.isRunning
                        ? Icon(
                            Icons.pause,
                            size: 60,
                            color: Colors.blue.shade900,
                          )
                        : Icon(
                            Icons.play_arrow,
                            size: 60,
                            color: Colors.blue.shade900,
                          ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
