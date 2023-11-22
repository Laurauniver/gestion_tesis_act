import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gestion_tesis/common/base_state.dart';
import 'package:gestion_tesis/common/clean_text.dart';
import 'package:gestion_tesis/core/failure/failures.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/domain/repositories/tesis_repository.dart';

part 'global_search_state.dart';

class GlobalSearchCubit extends Cubit<GlobalSearchState> {
  GlobalSearchCubit(
    this.tesisRepository,
  ) : super(GlobalSearchState.initial());

  final TesisRepository tesisRepository;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _typeAheadController = TextEditingController();

  List<TesisTableEntity> allTesis = [];

  TextEditingController get searchController => _searchController;
  TextEditingController get typeAheadController => _typeAheadController;

//   void getTesis(String query, titulo) {
//   final searchResponse = allTesis.where((tesis) {
//     if (tesis.texto == null) return false;
//     final texto = cleanPlainText(tesis.texto);
//     return texto.contains(cleanPlainText(query)) ||
//         tesis.autor == query ||
//         tesis.titulo == query ||
//         tesis.area == query ||
//         // Agrega otros criterios de búsqueda según tus necesidades
//         // Ejemplo: tesis.estado == query, tesis.tutor == query, etc.
//         false;
//   }).toList();

//   if (searchResponse.isEmpty) {
//     emit(
//       state.copyWith(
//         searchParagraph: BaseListState<TesisTableEntity>.fail(
//           const NoDataFailure('Sin resultados...'),
//         ),
//       ),
//     );
//   } else {
//     emit(
//       state.copyWith(
//         searchParagraph: BaseListState<TesisTableEntity>.loaded(
//           searchResponse.toList(),
//         ),
//       ),
//     );
//   }
// }
// }

  void initGlobalSearch() {
    emit(
      state.copyWith(
          searchParagraph: BaseListState<TesisTableEntity>.initial()),
    );
    clearSearch();
  }

  void initSearchByTerms() {
    emit(
      state.copyWith(),
    );
    clearByTermsSearch();
  }

  Future<void> getTesis() async {
    emit(
      state.copyWith(
          getAllParagraph: state.getAllParagraph.copyWith(isLoading: true)),
    );
    final response = await tesisRepository.getAllTesis();

    emit(
      state.copyWith(
        getAllParagraph:
            BaseListState<TesisTableEntity>.loaded(response.toList()),
      ),
    );
    allTesis = response;
  }

  Future<void> focusTextField() async {
    await Future.delayed(const Duration(milliseconds: 650));
    emit(
      state.copyWith(
          searchParagraph: BaseListState<TesisTableEntity>.initial()),
    );
  }

  void onSearch(String query) {
    emit(
      state.copyWith(
          searchParagraph: state.searchParagraph.copyWith(isLoading: true)),
    );
    final query = _searchController.text;
    if (query.isEmpty) {
      emit(
        state.copyWith(
            searchParagraph: BaseListState<TesisTableEntity>.initial()),
      );
    } else {
      Future.delayed(const Duration(milliseconds: 650)).then((value) {
        _search(query);
      });
    }
  }

  void clearSearch() {
    _searchController.clear();
    emit(
      state.copyWith(
          searchParagraph: BaseListState<TesisTableEntity>.initial()),
    );
  }

  void clearByTermsSearch() {
    _typeAheadController.clear();
    emit(
      state.copyWith(),
    );
  }

  void _search(String query) {
    final searchResponse = allTesis.where((tesis) {
      if (tesis.texto == null) return false;
      final texto = cleanPlainText(tesis.texto);
      return texto.contains(cleanPlainText(query));
    }).toList();

    if (searchResponse.isEmpty) {
      // emit(const GlobalSearchState.noFound());
      emit(
        state.copyWith(
          searchParagraph: BaseListState<TesisTableEntity>.fail(
            const NoDataFailure('Sin resultados...'),
          ),
        ),
      );
    } else {
      // emit(GlobalSearchState.searched(searchResponse));
      emit(
        state.copyWith(
          searchParagraph: BaseListState<TesisTableEntity>.loaded(
            searchResponse.toList(),
          ),
        ),
      );
    }
  }
}
