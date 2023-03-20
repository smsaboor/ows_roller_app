import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerViewModel with ChangeNotifier {
  late StopWatchTimer _stopWatchTimer;
  // Start timer.
  StopWatchTimer get getStopWatchTimer=>_stopWatchTimer;
  informationOfStopWatch() {
    //This is StopWatchMode.
    //CountUp
    //CountDown
    //CountUp
    //This is default mode. If you' d like to set it explicitly, set StopWatchMode.countUp to mode.
    final stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);
    //CountDown
    //Can be set StopWatchMode.countDown mode and preset millisecond.
    final stopWatchTimer2 = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond:
      StopWatchTimer.getMilliSecFromMinute(1), // millisecond => minute.
    );
    //This is helper functions for presetTime.
    /// Get millisecond from hour
    final value = StopWatchTimer.getMilliSecFromHour(1);

    /// Get millisecond from minute
    final value2 = StopWatchTimer.getMilliSecFromMinute(60);

    /// Get millisecond from second
    final value3 = StopWatchTimer.getMilliSecFromSecond(60 * 60);

    // Usage
    // import 'package:stop_watch_timer/stop_watch_timer.dart';  // Import stop_watch_timer
    // class MyApp extends StatefulWidget {
    // @override
    //     _MyAppState createState() => _MyAppState();
    // }
    // class _MyAppState extends State<MyApp> {
    //     final StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.
    //       @override
    //       void initState() {
    //       super.initState();
    //       }
    //       @override
    //       void dispose() async {
    //       super.dispose();
    //       await _stopWatchTimer.dispose();  // Need to call dispose function.
    //       }
    //
    //     @override
    //     Widget build(BuildContext context) {
    //     ...
    //     }
    // }

    // To operation stop watch.
    // Start timer.
    _stopWatchTimer.onStartTimer();
    // Stop timer.
    _stopWatchTimer.onStopTimer();
    // Reset timer
    _stopWatchTimer.onResetTimer();
    // Lap time
    _stopWatchTimer.onAddLap();

    //Can be set preset time. This case is "00:01.23".
    // Set Millisecond.
    _stopWatchTimer.setPresetTime(mSec: 1234);

    // When timer is idle state, can be set this.
    // Set Hours. (ex. 1 hours)
    _stopWatchTimer.setPresetHoursTime(1);
    // Set Minute. (ex. 30 minute)
    _stopWatchTimer.setPresetMinuteTime(30);
    // Set Second. (ex. 120 second)
    _stopWatchTimer.setPresetSecondTime(120);
    //Using the stream to get the time
    _stopWatchTimer.rawTime.listen((value) => print('rawTime $value'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));
    _stopWatchTimer.fetchStopped
        .listen((value) => print('stopped from stream'));
    _stopWatchTimer.fetchEnded.listen((value) => print('ended from stream'));

    //Display time formatted stop watch. Using function of "rawTime" and "getDisplayTime".
    final raw = 3000; // 3sec
    final displayTime = StopWatchTimer.getDisplayTime(value); // 00:00:03.00
    //Example code using stream builder.
    StreamBuilder<int>(
      stream: _stopWatchTimer.rawTime,
      initialData: 0,
      builder: (context, snap) {
        final value = snap.data;
        final displayTime = StopWatchTimer.getDisplayTime(value!);
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                displayTime,
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                value.toString(),
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
    //Notify from "secondTime" every second.
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    //Example code using stream builder.
    StreamBuilder<int>(
      stream: _stopWatchTimer.secondTime,
      initialData: 0,
      builder: (context, snap) {
        final value = snap.data;
        print('Listen every second. $value');
        return Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        'second',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          ],
        );
      },
    );

    //Notify from "minuteTime" every minute.
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    // Example code using stream builder.
    StreamBuilder<int>(
      stream: _stopWatchTimer.minuteTime,
      initialData: 0,
      builder: (context, snap) {
        final value = snap.data;
        print('Listen every minute. $value');
        return Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        'minute',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          ],
        );
      },
    );

    //Notify lap time.
    _stopWatchTimer.records.listen((value) => print('records $value'));
    //Example code using stream builder.
    StreamBuilder<List<StopWatchRecord>>(
      stream: _stopWatchTimer.records,
      initialData: const [],
      builder: (context, snap) {
        final value = snap.data;
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final data = value[index];
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${index + 1} ${data.displayTime}',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1,
                )
              ],
            );
          },
          itemCount: value!.length,
        );
      },
    );

    //Using the Callback to get the time
  }
  double _kSize = 60;
  startWatch(second)async{
    _stopWatchTimer=StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromSecond(second.toInt()), // millisecond => minute.
    );
    _stopWatchTimer.onStartTimer();
  }

  stopWatch()async{
    await _stopWatchTimer.dispose();
  }
}
