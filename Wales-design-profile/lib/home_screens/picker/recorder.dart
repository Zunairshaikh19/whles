import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:app/app_theme.dart';
import 'package:app/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../../models/attachment_model.dart';

class Recorder extends StatefulWidget {
  const Recorder({super.key});

  @override
  State<Recorder> createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  bool showPlayer = false;
  String? audioPath;
  int duration = 0;
  bool isRecording = false;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  void done() async {
    // User? user = FirebaseAuth.instance.currentUser;
    // if (user == null) {
    //   return;
    // }
    if (!isRecording) {
      AttachmentModel attatchmentModel = AttachmentModel(
        "",
        "",
        "",
        "memo",
        "memo",
        "",
        "",
        audioPath!,
        duration,
        DateTime.now(),
        file: File(audioPath!),
      );
      Navigator.of(context).pop(attatchmentModel);
    } else {
      Constants.showMessage(context, "Stop the recoridng first");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Record"),
      ),
      body: Center(
        child: showPlayer
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: AudioPlayer(
                  source: audioPath!,
                  onDelete: () {
                    setState(() => showPlayer = false);
                  },
                  showDelete: true,
                ),
              )
            : AudioRecorder(onStop: (path, d) {
                setState(() {
                  isRecording = false;
                  duration = d;
                  audioPath = path;
                  showPlayer = true;
                });
              }, onStart: () {
                setState(() {
                  isRecording = true;
                });
              }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: done,
              child: const Text("Done"),
            )
          ],
        ),
      ),
    );
  }
}

class AudioRecorder extends StatefulWidget {
  final void Function(String path, int duration) onStop;
  final void Function() onStart;

  const AudioRecorder({Key? key, required this.onStop, required this.onStart})
      : super(key: key);

  @override
  State<AudioRecorder> createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  int recordDuration = 0;
  Timer? timer;
  // final _audioRecorder = Record();
  // StreamSubscription<RecordState>? _recordSub;
  // RecordState _recordState = RecordState.stop;
  // StreamSubscription<Amplitude>? _amplitudeSub;
  // // ignore: unused_field
  // Amplitude? _amplitude;

  // @override
  // void initState() {
  //   _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
  //     setState(() => _recordState = recordState);
  //   });
  //   _amplitudeSub = _audioRecorder
  //       .onAmplitudeChanged(const Duration(milliseconds: 300))
  //       .listen((amp) => setState(() => _amplitude = amp));
  //   super.initState();
  // }

  // Future<void> _start() async {
  //   try {
  //     if (await _audioRecorder.hasPermission()) {
  //       await _audioRecorder.start();
  //       widget.onStart();
  //       recordDuration = 0;
  //       _startTimer();
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // Future<void> _stop() async {
  //   timer?.cancel();
  //   int d = recordDuration;
  //   recordDuration = 0;
  //   final path = await _audioRecorder.stop();
  //   if (path != null) {
  //     widget.onStop(path, d);
  //   }
  // }

//  Future<void> _pause() async {
  //   timer?.cancel();
  //   await _audioRecorder.pause();
  // }

  // Future<void> _resume() async {
  //   _startTimer();
  //   await _audioRecorder.resume();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRecordStopControl(),
            const SizedBox(height: 20),
            _buildPauseResumeControl(),
            const SizedBox(height: 20),
            _buildText(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    // _recordSub?.cancel();
    // _amplitudeSub?.cancel();
    // _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    // if (_recordState != RecordState.stop) {
    //   icon = Icon(Icons.stop, color: AppTheme.primaryColor, size: 100);
    //   color = AppTheme.primaryColor.withOpacity(0.1);
    // } else {
    //   icon = Icon(Icons.mic, color: AppTheme.primaryColor, size: 100);
    //   color = AppTheme.primaryColor.withOpacity(0.1);
    // }

    return ClipOval(
      child: Material(
          //    color: color,
          // child: InkWell(
          //   child: SizedBox(width: 120, height: 120, child: icon),
          //   onTap: () {
          //     (_recordState != RecordState.stop) ? _stop() : _start();
          //   },
          // ),
          ),
    );
  }

  Widget _buildPauseResumeControl() {
    // if (_recordState == RecordState.stop) {
    //   return const SizedBox.shrink();
    // }

    late Icon icon;
    late Color color;

    // if (_recordState == RecordState.record) {
    //   icon = Icon(Icons.pause, color: AppTheme.primaryColor, size: 100);
    //   color = AppTheme.primaryColor.withOpacity(0.1);
    // } else {
    //   icon = Icon(Icons.play_arrow, color: AppTheme.primaryColor, size: 100);
    //   color = AppTheme.primaryColor.withOpacity(0.1);
    // }

    return ClipOval(
      child: Material(
          //    color: color,
          // child: InkWell(
          //   child: SizedBox(width: 120, height: 120, child: icon),
          //   onTap: () {
          //     (_recordState == RecordState.pause) ? _resume() : _pause();
          //   },
          // ),
          ),
    );
  }

  Widget _buildText() {
    // if (_recordState != RecordState.stop) {
    //   return _buildTimer();
    // }

    return const Text("Tap to start recording");
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(recordDuration ~/ 60);
    final String seconds = _formatNumber(recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: TextStyle(color: AppTheme.primaryColor),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => recordDuration++);
    });
  }
}

class AudioPlayer extends StatefulWidget {
  /// Path from where to play recorded audio
  final String source;

  /// Callback when audio file should be removed
  /// Setting this to null hides the delete button
  final VoidCallback onDelete;
  final bool? showDelete;

  const AudioPlayer({
    Key? key,
    required this.source,
    required this.onDelete,
    this.showDelete,
  }) : super(key: key);

  @override
  AudioPlayerState createState() => AudioPlayerState();
}

class AudioPlayerState extends State<AudioPlayer> {
  static const double _controlSize = 120;
  static const double _deleteBtnSize = 24;

  // final _audioPlayer = ap.AudioPlayer();
  late StreamSubscription<void> _playerStateChangedSubscription;
  late StreamSubscription<Duration?> _durationChangedSubscription;
  late StreamSubscription<Duration> _positionChangedSubscription;
  Duration? _position;
  Duration? _duration;

  @override
  void initState() {
    // _playerStateChangedSubscription =
    //     _audioPlayer.onPlayerComplete.listen((state) async {
    //   await stop();
    //   setState(() {});
    // });
    // _positionChangedSubscription = _audioPlayer.onPositionChanged.listen(
    //   (position) => setState(() {
    //     _position = position;
    //   }),
    // );
    // _durationChangedSubscription = _audioPlayer.onDurationChanged.listen(
    //   (duration) => setState(() {
    //     _duration = duration;
    //   }),
    // );

    super.initState();
  }

  @override
  void dispose() {
    _playerStateChangedSubscription.cancel();
    _positionChangedSubscription.cancel();
    _durationChangedSubscription.cancel();
    //   _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildControl(),
              _buildSlider(constraints.maxWidth),
              if (widget.showDelete != null && widget.showDelete!)
                IconButton(
                  icon: const Icon(Icons.delete,
                      color: Color(0xFF73748D), size: _deleteBtnSize),
                  onPressed: () {
                    //   stop().then((value) => widget.onDelete());
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildControl() {
    Icon icon;
    Color color;

    // if (_audioPlayer.state == ap.PlayerState.playing) {
    //   icon = Icon(Icons.pause, color: AppTheme.primaryColor, size: 100);
    //   color = AppTheme.primaryColor.withOpacity(0.1);
    // } else {
    //   final theme = Theme.of(context);
    //   icon = Icon(Icons.play_arrow, color: theme.primaryColor, size: 100);
    //   color = theme.primaryColor.withOpacity(0.1);
    // }

    return ClipOval(
      child: Material(
          // color: color,
          // child: InkWell(
          //   child:
          //       SizedBox(width: _controlSize, height: _controlSize, child: icon),
          //   onTap: () {
          //     if (_audioPlayer.state == ap.PlayerState.playing) {
          //       pause();
          //     } else {
          //       play();
          //     }
          //   },
          // ),
          ),
    );
  }

  Widget _buildSlider(double widgetWidth) {
    bool canSetValue = false;
    final duration = _duration;
    final position = _position;

    if (duration != null && position != null) {
      canSetValue = position.inMilliseconds > 0;
      canSetValue &= position.inMilliseconds < duration.inMilliseconds;
    }

    double width = widgetWidth;

    return SizedBox(
      width: width,
      child: Slider(
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).colorScheme.secondary,
        onChanged: (v) {
          if (duration != null) {
            final position = v * duration.inMilliseconds;
            //     _audioPlayer.seek(Duration(milliseconds: position.round()));
          }
        },
        value: canSetValue && duration != null && position != null
            ? position.inMilliseconds / duration.inMilliseconds
            : 0.0,
      ),
    );
  }

//   Future<void> play() {
//     return _audioPlayer.play(
//       kIsWeb ? ap.UrlSource(widget.source) : ap.DeviceFileSource(widget.source),
//     );
//   }

//   Future<void> pause() => _audioPlayer.pause();

//   Future<void> stop() => _audioPlayer.stop();
}
