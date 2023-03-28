import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timerblocapp/timer/bloc/timer_bloc.dart';

export 'bloc/timer_bloc.dart';
export 'view/timer_page.dart';

class ActionsP extends StatelessWidget {
  const ActionsP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: ((prev, state) => prev.runtimeType != state.runtimeType),
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration)),
                child: const Icon(Icons.play_arrow),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
                child: const Icon(Icons.pause),
              ),
              FloatingActionButton(
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
                child: const Icon(Icons.replay),
              ),
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
                child: const Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
                child: const Icon(Icons.replay),
              ),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
                child: const Icon(Icons.replay),
              ),
            ]
          ],
        );
      },
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter, colors: [Colors.lime.shade50,Colors.lime.shade700])),
    );
  }
}
