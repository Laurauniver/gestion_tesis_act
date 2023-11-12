import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/presentation/global_search/components/global_law_search_bar.dart';
import 'package:gestion_tesis/src/presentation/global_search/components/highlighted_text.dart';
import 'package:gestion_tesis/src/presentation/global_search/cubit/global_search_cubit.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis/tesis_detail_page.dart';

class GlobalSearchTab extends StatefulWidget {
  const GlobalSearchTab({Key? key}) : super(key: key);

  @override
  State<GlobalSearchTab> createState() => _GlobalSearchTabState();
}

class _GlobalSearchTabState extends State<GlobalSearchTab> {
  @override
  void initState() {
    context.read<GlobalSearchCubit>().initGlobalSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar tesis'),
        centerTitle: false,
      ),
      body: const Padding(
        padding: EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _SearchBarView(),
            ),
            Expanded(child: _SearchView()),
          ],
        ),
      ),
    );
  }
}

class _SearchBarView extends StatelessWidget {
  const _SearchBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GlobalSearchTextField(),
        ),
      ],
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: BlocBuilder<GlobalSearchCubit, GlobalSearchState>(
        builder: (context, state) {
          if (state.getAllParagraph.isLoading) {
            return const _SearchingView();
          } else if (state.getAllParagraph.failure != null) {
            return Center(
              child: Text(state.getAllParagraph.failure!.message),
            );
          } else if (state.searchParagraph.failure != null) {
            return const _NoResultView();
          } else if (state.searchParagraph.isLoading) {
            return const _SearchingView();
          }
          if (state.searchParagraph.listData.isEmpty &&
              state.searchParagraph.isLoading == false &&
              state.searchParagraph.failure == null) {
            return const Center(child: Text('Sin tesis para mostrar'));
          } else {
            return _SearchListView(
              state: state,
              searchParagraph: state.searchParagraph.listData.toList(),
            );
          }
        },
      ),
    );
  }
}

class _SearchingView extends StatelessWidget {
  const _SearchingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CupertinoActivityIndicator(),
        Text(
          'buscando',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _NoResultView extends StatelessWidget {
  const _NoResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
        child: Text(
          'Búsqueda sin resultados',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _SearchListView extends StatelessWidget {
  const _SearchListView(
      {Key? key, required this.state, required this.searchParagraph})
      : super(key: key);

  final GlobalSearchState state;
  final List<TesisTableEntity> searchParagraph;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: searchParagraph.length,
      itemBuilder: (context, index) {
        final paragraph = searchParagraph[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => TesisDetailPage(
                          titulo: paragraph.titulo,
                          text: paragraph.texto,
                        ))));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BuildDocumentNameTextWidget(
                //   documentId: paragraph.id,
                //   textStyle: TextStyle(
                //     color: Theme.of(context).primaryColor,
                //   ),
                // ),
                HighlightedText(
                  context: context,
                  query:
                      context.read<GlobalSearchCubit>().searchController.text,
                  text: paragraph.texto.toString(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
