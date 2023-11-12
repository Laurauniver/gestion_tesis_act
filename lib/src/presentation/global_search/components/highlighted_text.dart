import 'package:flutter/material.dart';
import 'package:gestion_tesis/common/app_colors.dart';
import 'package:gestion_tesis/common/clean_text.dart';

class HighlightedText extends StatelessWidget {
  const HighlightedText({
    super.key,
    required this.text,
    required this.query,
    required this.context,
  });

  final String text;
  final String query;
  final BuildContext context;

  List<TextSpan> _highlightOccurrences(
    BuildContext context,
    String source,
    String query,
  ) {
    final children = <TextSpan>[];
    final documental = TextStyle(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.black
          : Colors.white,
    );
    const highlighted = TextStyle(
      color: AppColors.baseColor,
      fontWeight: FontWeight.w900,
    );

    int lastMatchEnd = 0;

    final matches = cleanPlainText(query).allMatches(
      cleanPlainText(source),
    );

    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.start),
            style: documental,
          ),
        );
      }

      children.add(
        TextSpan(
          text: source.substring(match.start, match.end),
          style: highlighted,
        ),
      );

      if (i == matches.length - 1 && (match.end != source.length)) {
        children.add(
          TextSpan(
            text: source.substring(match.end, source.length),
            style: documental,
          ),
        );
      }

      lastMatchEnd = match.end;
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(children: _highlightOccurrences(context, text, query)),
      ),
    );
  }
}
