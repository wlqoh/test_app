import 'package:auth_task/main/cubit/tile_cubit.dart';
import 'package:auth_task/main/pages/add_tile.dart';
import 'package:auth_task/models/tile.dart';
import 'package:auth_task/utils/constants.dart';
import 'package:auth_task/widgets/default_button.dart';
import 'package:flutter/material.dart';

import 'package:auth_task/widgets/circles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TileWidget extends StatefulWidget {
  final Tile tile;
  final int index;

  const TileWidget({super.key, required this.tile, required this.index});

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  late Offset _tapPosition;

  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;

    setState(() {
      _tapPosition = renderBox.globalToLocal(tapPosition.globalPosition);
    });
  }

  void _showContextMenu(BuildContext context) async {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();

    final result = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(
          _tapPosition.dx,
          _tapPosition.dy,
          10,
          10,
        ),
        Rect.fromLTWH(
          0,
          0,
          overlay!.paintBounds.size.width,
          overlay.paintBounds.size.height,
        ),
      ),
      items: [
        const PopupMenuItem(
          value: 'delete',
          child: Text('Удалить'),
        ),
        const PopupMenuItem(
          value: 'cancel',
          child: Text('Отмена'),
        )
      ],
    );

    switch (result) {
      case 'delete':
        {
          if (!context.mounted) return;
          context.read<TileCubit>().deleteTile(widget.index);
          break;
        }
      case 'cancel':
        {
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (position) {
        _getTapPosition(position);
      },
      onLongPress: () {
        _showContextMenu(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        // alignment: Alignment.topLeft,
        height: 395,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: '${widget.tile.name}\n',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: <InlineSpan>[
                      TextSpan(
                        text: '600р',
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Повезу',
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
                ),
              ],
            ),
            // Text(from),
            // Text(to),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleDot(),
                    const SizedBox(width: 16),
                    Text.rich(
                      TextSpan(
                        text: '${widget.tile.from}\n',
                        style: Theme.of(context).textTheme.labelMedium,
                        children: <InlineSpan>[
                          TextSpan(
                            text: widget.tile.dateFrom,
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 34,
                  child: Center(
                    child: Column(
                      children: List.generate(
                        4,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 3,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CirclePlace(),
                    const SizedBox(width: 16),
                    Text.rich(
                      TextSpan(
                        text: '${widget.tile.to}\n',
                        style: Theme.of(context).textTheme.labelMedium,
                        children: <InlineSpan>[
                          TextSpan(
                            text: widget.tile.dateTo,
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text.rich(
              maxLines: 2,
              TextSpan(
                text: 'Описание: ',
                style: Theme.of(context).textTheme.titleLarge,
                children: <InlineSpan>[
                  TextSpan(
                    text: widget.tile.description,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
            const Spacer(),
            DefaultButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTilePage(
                      tile: widget.tile,
                    ),
                  ),
                );
              },
              text: 'Изменить',
              backgroundColor: const Color.fromRGBO(229, 234, 255, 1),
              foregroundColor: MyColors.kPrimaryColor,
              borderRadius: 30,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
