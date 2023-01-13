import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:morg_tv/api.dart';
import 'package:morg_tv/models/beat.dart';
import 'package:tuple/tuple.dart';

class DebugView extends ConsumerStatefulWidget {
  const DebugView({super.key});

  @override
  ConsumerState<DebugView> createState() => _DebugViewState();
}

class _DebugViewState extends ConsumerState<DebugView> {
  final _beats = <Tuple2<String, FutureProvider<Beat>>>[];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
            child: ElevatedButton(
                onPressed: () {
                  final dt = DateTime.now();
                  final heartMsg = DateFormat("d/M/y H:m").format(dt);
                  final beat = heart(heartMsg);
                  setState(() {
                    _beats.add(Tuple2(heartMsg, beat));
                  });
                },
                child: const Text("Send Heartbeat"))),
        for (final beat in _beats.reversed)
          Heartbeat(heart: beat.item1, beat: beat.item2),
      ],
    );
  }
}

class Heartbeat extends ConsumerWidget {
  final String heart;
  final FutureProvider<Beat> beat;
  const Heartbeat({
    super.key,
    required this.heart,
    required this.beat,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beatValue = ref.watch(beat);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 211, 241, 255),
            border: Border.all(color: Color.fromARGB(255, 198, 205, 207)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                beatValue.when(
                  data: (_) => const Icon(Icons.favorite, color: Colors.green),
                  loading: () =>
                      const Icon(Icons.favorite, color: Colors.amber),
                  error: (_, __) =>
                      const Icon(Icons.heart_broken, color: Colors.red),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: Text("\"$heart\"",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 8),
                beatValue.when(
                  data: (data) => Text("\"${data.beat}\""),
                  loading: () => const CircularProgressIndicator(),
                  error: (error, _) => Text(
                    error.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
