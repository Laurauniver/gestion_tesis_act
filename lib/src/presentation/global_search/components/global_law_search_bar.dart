import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/common/app_colors.dart';
import 'package:gestion_tesis/src/presentation/global_search/cubit/global_search_cubit.dart';

class GlobalSearchTextField extends StatelessWidget {
  const GlobalSearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<GlobalSearchCubit>();
    searchCubit.focusTextField();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: _TextField(),
            ),
            const SizedBox(width: 10),
            BlocBuilder<GlobalSearchCubit, GlobalSearchState>(
              builder: (context, state) {
                return Opacity(
                  opacity: searchCubit.searchController.text.isNotEmpty ? 1 : 0,
                  child: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () => searchCubit.searchController.text.isEmpty
                        ? null
                        : searchCubit.clearSearch(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField({
    Key? key,
  }) : super(key: key);

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<GlobalSearchCubit>();
    return BlocListener<GlobalSearchCubit, GlobalSearchState>(
      listener: (context, state) {
        if (context.read<GlobalSearchCubit>().searchController.text.isEmpty) {
          myFocusNode.requestFocus();
        }
      },
      child: TextField(
        maxLines: null,
        textInputAction: TextInputAction.search,
        onChanged: context.read<GlobalSearchCubit>().onSearch,
        controller: searchCubit.searchController,
        decoration: const InputDecoration.collapsed(
          hintText: 'Buscar',
        ),
      ),
    );
  }
}
