import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;
  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Id: $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (pokemonName) => Text(pokemonName),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text(error.toString()),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'next-btn',
            child: const Icon(Icons.plus_one_outlined),
            onPressed: () {
              pokemonId++;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'previous-btn',
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () {
              if (pokemonId > 1) {
                pokemonId--;
              }
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
