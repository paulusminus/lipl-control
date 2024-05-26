enum LoadingStatus {
  initial,
  loading,
  success,
  unauthorized,
  changing,
  failure
}

extension LoadingStatusX on LoadingStatus {
  bool get isLoadingOrSuccess => <LoadingStatus>[
        LoadingStatus.loading,
        LoadingStatus.success,
      ].contains(this);
}
