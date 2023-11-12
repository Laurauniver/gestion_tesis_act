import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/common/app_colors.dart';
import 'package:gestion_tesis/src/presentation/global_search/cubit/global_search_cubit.dart';
import 'package:sizer/sizer.dart';

class AutocompleteSearchBar extends StatefulWidget {
  const AutocompleteSearchBar({Key? key}) : super(key: key);

  @override
  State<AutocompleteSearchBar> createState() => _AutocompleteSearchBarState();
}

class _AutocompleteSearchBarState extends State<AutocompleteSearchBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<GlobalSearchCubit>();
    return BlocBuilder<GlobalSearchCubit, GlobalSearchState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.baseColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 1.10.h, horizontal: 1.06.w),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.search,
                          size: 5.5.w,
                          color: AppColors.baseColor,
                        ),
                        SizedBox(width: 2.6.w),
                        BlocBuilder<GlobalSearchCubit, GlobalSearchState>(
                          builder: (context, state) {
                            return Opacity(
                              opacity: searchCubit
                                      .typeAheadController.text.isNotEmpty
                                  ? 1
                                  : 0,
                              child: IconButton(
                                color: AppColors.baseColor,
                                icon: const Icon(Icons.cancel),
                                onPressed: () =>
                                    searchCubit.typeAheadController.text.isEmpty
                                        ? null
                                        : searchCubit.clearByTermsSearch(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
//   TypeAheadField<TermForSearchModel> _typeAheadField(GlobalSearchState state) {
//     return TypeAheadField<TermForSearchModel>(
//       textFieldConfiguration: TextFieldConfiguration(
//         // autofocus: true,
//         maxLines: null,
//         controller: context.read<GlobalSearchCubit>().typeAheadController,
//         style: textStyleBody.copyWith(
//           fontWeight: FontWeight.w500,
//           color: Colors.black,
//         ),
//         decoration: InputDecoration.collapsed(
//           hintText: S.current.search,
//           hintStyle: textStyleBody.copyWith(color: Colors.grey),
//         ),
//       ),
//       suggestionsCallback: (pattern) {
//         final cleanPattern = cleanPlainText(pattern);
//         return state.getAllTermsForSearch.listData
//             .where((p0) => cleanPlainText(p0.term ?? '').contains(cleanPattern))
//             .toList();
//       },
//       itemBuilder: (context, suggestion) {
//         return ListTile(
//           title: Text(
//             suggestion.term ?? '',
//             style: textStyleBody,
//           ),
//         );
//       },
//       onSuggestionSelected: (suggestion) {
//         context.read<GlobalSearchCubit>().getSelectedTerm(suggestion);
//         context.read<GlobalSearchCubit>().typeAheadController.text =
//             suggestion.term ?? '';
//       },
//       noItemsFoundBuilder: (context) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           S.of(context).noData,
//           style: textStyleBody,
//         ),
//       ),
//     );
//   }
// }
