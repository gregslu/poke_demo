/// DataSource represents a data source for type [T]. Each data source
/// supports one-shot CRUD operations on the data [T]. For more information
/// see https://developer.android.com/jetpack/guide/data-layer
abstract class LocalDataSource<T> {
  /// Creates the given data into this data source, replacing it if
  /// it exists already. It throws an [Exception] in case of any error
  void create(T data);

  /// Creates all the given data into this data source, replacing them if
  /// it exists already. It throws an [Exception] in case of any error
  void createAll(List<T> data);

  /// Returns the data specified by the given id if any, null otherwise. It
  /// throws an [Exception] in case of any error
  T read(int id);

  /// Returns all the data if any, an empty list otherwise. It throws an
  /// [Exception] in case of any error
  List<T> readAll();

  /// Updates the given data into this data source. It throws an [Exception]
  /// in case of any error
  void update(T data);

  /// Deletes the data specified by the given id if any. It throws an
  /// [Exception] in case of any error
  void delete(int id);

  void deleteLast();
}
