import 'package:bloc/bloc.dart';
import 'package:weather_app/bloc/suggestions_popup/suggestions_popup_state.dart';

class SuggestionsCubit extends Cubit<SuggestionsState> {
  SuggestionsCubit() : super(const SuggestionsState(showSuggstion: false));

  Future<void> changeSuggestionState(bool newState) async {
    final newS = state.copyWith(newState);
    emit(newS);
  }
}
