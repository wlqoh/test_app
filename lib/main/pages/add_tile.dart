import 'package:auth_task/main/cubit/tile_cubit.dart';
import 'package:auth_task/main/pages/tiles.dart';
import 'package:auth_task/models/tile.dart';
import 'package:auth_task/widgets/add_tile_text_field.dart';
import 'package:auth_task/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTilePage extends StatefulWidget {
  final Tile? tile;

  const AddTilePage({super.key, this.tile});

  @override
  State<AddTilePage> createState() => _AddTilePageState();
}

class _AddTilePageState extends State<AddTilePage> {
  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.tile?.name);
    descriptionController =
        TextEditingController(text: widget.tile?.description);
    fromController = TextEditingController(text: widget.tile?.from);
    toController = TextEditingController(text: widget.tile?.to);
    dateFrom = TextEditingController(text: widget.tile?.dateFrom);
    dateTo = TextEditingController(text: widget.tile?.dateTo);
    cubit = context.read<TileCubit>();
  }

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController fromController;
  late final TextEditingController toController;
  late final TextEditingController dateFrom;
  late final TextEditingController dateTo;
  late final TileCubit cubit;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Сохранить и выйти',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.tile == null
                        ? 'Новое объявление'
                        : 'Изменить объявление',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Название объявления',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  AddTileTextField(
                    errorText: cubit.state.status == TileStatus.error &&
                        nameController.text == ''
                        ? 'Поле не должно быть пустым'
                        : null,
                    controller: nameController,
                    hintText: 'Введите название',
                    height: 47,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Описание',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  AddTileTextField(
                    errorText: cubit.state.status == TileStatus.error &&
                        descriptionController.text == ''
                        ? 'Поле не должно быть пустым'
                        : null,
                    controller: descriptionController,
                    hintText: 'Введите описание',
                    height: 90,
                    maxLines: 8,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Откуда',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  AddTileTextField(
                    errorText: cubit.state.status == TileStatus.error &&
                        fromController.text == ''
                        ? 'Поле не должно быть пустым'
                        : null,
                    controller: fromController,
                    hintText: 'Страна, Город, Аэропорт',
                    height: 47,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Куда',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  AddTileTextField(
                    errorText: cubit.state.status == TileStatus.error &&
                        toController.text == ''
                        ? 'Поле не должно быть пустым'
                        : null,
                    controller: toController,
                    hintText: 'Страна, Город, Аэропорт',
                    height: 47,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Дата отъезда',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  AddTileTextField(
                    errorText: cubit.state.status == TileStatus.error &&
                        dateFrom.text == ''
                        ? 'Поле не должно быть пустым'
                        : null,
                    controller: dateFrom,
                    hintText: 'Введите дату отъезда',
                    maxLines: 1,
                    height: 47,
                    prefixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _showDialog(
                          CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            // showDayOfWeek: true,
                            onDateTimeChanged: (DateTime newDate) {
                              dateFrom.text =
                                  newDate.toString().substring(0, 10);
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Дата приезда',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  AddTileTextField(
                    errorText: cubit.state.status == TileStatus.error &&
                            dateTo.text == ''
                        ? 'Поле не должно быть пустым'
                        : null,
                    controller: dateTo,
                    hintText: 'Введите дату приезда',
                    maxLines: 1,
                    height: 47,
                    prefixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _showDialog(
                          CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            onDateTimeChanged: (DateTime newDate) {
                              dateTo.text = newDate.toString().substring(0, 10);
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(height: 20),
                  DefaultButton(
                      onPressed: () {
                        setState(() {});
                        if (widget.tile == null) {
                          context.read<TileCubit>().addTile(
                                name: nameController.text,
                                description: descriptionController.text,
                                from: fromController.text,
                                to: toController.text,
                                dateFrom: dateFrom.text,
                                dateTo: dateTo.text,
                              );

                        } else {
                          cubit.changeTile(
                            name: nameController.text,
                            description: descriptionController.text,
                            from: fromController.text,
                            to: toController.text,
                            dateFrom: dateFrom.text,
                            dateTo: dateTo.text,
                            id: widget.tile!.id,
                          );
                        }
                        if (cubit.state.status == TileStatus.initial) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TilesPage()));
                        }
                      },
                      text: widget.tile == null
                          ? 'Разместить объявление'
                          : 'Изменить объявление'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
