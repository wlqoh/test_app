import 'package:auth_task/database/hive_db.dart';
import 'package:auth_task/models/tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'tile_state.dart';

class TileCubit extends Cubit<TileState> {
  final ToDoDatabase _db;

  TileCubit(this._db)
      : super(TileState(
          status: TileStatus.initial,
          tiles: _db.loadData(),
        ));

  void addTile({
    required String name,
    required String description,
    required String from,
    required String to,
    required String dateFrom,
    required String dateTo,
  }) {
    if (name == '' ||
        description == '' ||
        dateTo == '' ||
        dateFrom == '' ||
        from == '' ||
        to == '') {
      emit(state.copyWith(status: TileStatus.error));
      print(state.status);
    }
    else {
      emit(state.copyWith(status: TileStatus.initial));
      _db.tiles.add(Tile(
          id: const Uuid().v4(),
          name: name,
          description: description,
          from: from,
          to: to,
          dateFrom: dateFrom,
          dateTo: dateTo));
    }
    _db.updateDatabase();
    emit(state.copyWith(tiles: _db.tiles));
  }

  void changeTile({
    required String name,
    required String description,
    required String from,
    required String to,
    required String dateFrom,
    required String dateTo,
    required String id,
  }) {
    final index = _db.tiles.indexWhere((element) => element.id == id);
    _db.tiles[index] = Tile(
      from: from,
      to: to,
      name: name,
      description: description,
      dateFrom: dateFrom,
      dateTo: dateTo,
      id: _db.tiles[index].id,
    );
    _db.updateDatabase();
    emit(state.copyWith(tiles: _db.tiles));
  }

  void deleteTile(int index) {
    _db.tiles.removeAt(index);
    _db.updateDatabase();
    emit(state.copyWith(tiles: _db.tiles));
  }
}
