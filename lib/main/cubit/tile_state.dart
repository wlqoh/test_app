part of 'tile_cubit.dart';

enum TileStatus {initial, error}

class TileState {
  final TileStatus _status;
  final List _tiles;

  TileState({required TileStatus status, required List tiles})
      : _status = status,
        _tiles = tiles;

  TileStatus get status => _status;

  List get tiles => _tiles;

  TileState copyWith({
    TileStatus? status,
    List? tiles,
  }) {
    return TileState(
      status: status ?? _status,
      tiles: tiles ?? _tiles,
    );
  }
}
