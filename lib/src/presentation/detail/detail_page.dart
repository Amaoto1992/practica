import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/dependency_injection.dart';
import 'package:practica1/src/domain/entities/character_entity.dart';
import 'package:practica1/src/presentation/detail/cubit/detail_cubit.dart';
import 'package:practica1/src/presentation/detail/cubit/detail_state.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DetailCubit>()..getACharacter(id),
      child: Scaffold(
        appBar: AppBar(title: Text('Character'), centerTitle: true),
        body: BlocBuilder<DetailCubit, DetailState>(
          builder:
              (context, state) => switch (state) {
                DetailInitialState() => Center(child: Text('One Piece App')),
                DetailLoadingState() => Center(
                  child: CircularProgressIndicator(),
                ),
                DetailErrorState(:final message) => Center(
                  child: Text('Problems with the App $message'),
                ),
                DetailLoadedState(:final character) => _CharacterDetail(
                  character: character,
                ),
              },
        ),
      ),
    );
  }
}

class _CharacterDetail extends StatelessWidget {
  const _CharacterDetail({required this.character});
  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (character.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                character.imageUrl!,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 16),
          Text(
            character.name.romaji,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          _InfoRow(label: 'English', value: character.name.en),
          _InfoRow(label: 'Japanese', value: character.name.jp),
          _InfoRow(label: 'Status', value: character.status),
          _InfoRow(
            label: 'Age',
            value: character.age?.toString() ?? 'Unknown',
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
