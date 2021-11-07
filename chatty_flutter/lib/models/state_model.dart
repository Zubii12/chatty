part of models;

@freezed
class StateModel<T> with _$StateModel<T> {
  const factory StateModel.loading() = Loading<T>;
  const factory StateModel.fulfilled({required T data}) = Fulfilled<T>;
  const factory StateModel.error({required String message}) = Error<T>;
}
