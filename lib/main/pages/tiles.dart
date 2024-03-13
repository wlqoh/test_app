import 'package:auth_task/main/cubit/tile_cubit.dart';
import 'package:auth_task/main/pages/add_tile.dart';
import 'package:auth_task/widgets/default_button.dart';
import 'package:auth_task/widgets/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TilesPage extends StatelessWidget {
  const TilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: BlocBuilder<TileCubit, TileState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Мои объявления',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 30),
                  if (state.tiles.isEmpty)
                    const Center(child: Text('Пусто'))
                  else
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return TileWidget(tile: state.tiles[index], index: index,);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 5);
                        },
                        itemCount: state.tiles.length,
                      ),
                    ),
                  const Spacer(),
                  DefaultButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddTilePage()));
                      },
                      text: 'Разместить объявление')
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
