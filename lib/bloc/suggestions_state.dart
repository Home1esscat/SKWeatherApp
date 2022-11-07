class SuggestionsState {
  final bool showSuggstion;

  const SuggestionsState({required this.showSuggstion});

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SuggestionsState &&
            runtimeType == other.runtimeType &&
            showSuggstion == other.showSuggstion);
  }

  @override
  int get hashCode => showSuggstion.hashCode;

  SuggestionsState copyWith(bool newState) {
    return SuggestionsState(showSuggstion: newState);
  }
}
