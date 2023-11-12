import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/dependencies.dart';
import 'package:gestion_tesis/src/presentation/global_search/components/global_search_tab.dart';

import 'cubit/global_search_cubit.dart';

@RoutePage()
class GlobalSearchPage extends StatefulWidget {
  const GlobalSearchPage({
    Key? key,
    this.startedTabIndex = 0,
  }) : super(key: key);

  final int startedTabIndex;

  @override
  State<GlobalSearchPage> createState() => _GlobalSearchPageState();
}

class _GlobalSearchPageState extends State<GlobalSearchPage> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalSearchCubit(
        injector(),
      )..getTesis(),
      child: const GlobalSearchTab(),
    );
  }
}
