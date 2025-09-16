import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/countdown_bloc.dart';
import '../bloc/countdown_state.dart';
import '../widgets/ferrari_monza_background.dart';
import '../widgets/animated_monza_title.dart';
import '../widgets/animated_text_monza.dart';
import '../widgets/animated_checkered_flag.dart';
import '../widgets/animated_countdown_number.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  Future<void> _playMusic() async {
    if (_audioPlayer.state == PlayerState.playing) {
      return;
    }
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('inno.mp4'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CountdownBloc(),
      child: Scaffold(
        backgroundColor: Colors.black, // sfondo fuori dal "telefono"
        body: InkWell(
          onTap: () => _playMusic().then((_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Forza Ferrari!')));
          }),

          child: LayoutBuilder(
            builder: (context, constraints) {
              // Dimensione massima tipo smartphone
              const double phoneWidth = 390; // tipico iPhone 12
              const double phoneHeight = 844; // tipico iPhone 12

              return Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: phoneWidth,
                    height: phoneHeight,
                    color: Colors.black,
                    child: Stack(
                      children: [
                        Positioned.fill(child: FerrariMonzaBackground()),
                        const Positioned(
                          top: 150,
                          left: 0,
                          right: 0,
                          child: AnimatedMonzaTitle(),
                        ),
                        Positioned(
                          top: 180,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: BlocBuilder<CountdownBloc, CountdownState>(
                              builder: (context, state) {
                                if (state.isPassed) {
                                  return const Text(
                                    'La data è passata!',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10,
                                          color: Colors.yellow,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  );
                                }
                                final days = state.duration.inDays;
                                final hours = state.duration.inHours % 24;
                                final minutes = state.duration.inMinutes % 60;
                                final seconds = state.duration.inSeconds % 60;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 32),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AnimatedCountdownNumber(
                                          label: 'Giorni',
                                          value: days,
                                          color: Colors.yellow,
                                        ),
                                        AnimatedCountdownNumber(
                                          label: 'Ore',
                                          value: hours,
                                          color: Colors.redAccent,
                                        ),
                                        AnimatedCountdownNumber(
                                          label: 'Minuti',
                                          value: minutes,
                                          color: Colors.red,
                                        ),
                                        AnimatedCountdownNumber(
                                          label: 'Secondi',
                                          value: seconds,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
