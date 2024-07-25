import 'package:flutter/material.dart';
import 'package:news/ui/home/news/NewsListWidget.dart';



import '../../../../data/model/sourcesResponse/Source.dart';
import 'TabWidget.dart';

class SourcesTabWidget extends StatefulWidget {
  List<Source> sources = [];
  SourcesTabWidget(this.sources);

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
              onTap: (newIndex) {
                selectedIndex = newIndex;
                setState(() {});
              },
              isScrollable: true,
              labelColor: Colors.black,
              tabs: widget.sources
                  .map((source) => TabWidget(
                      source, widget.sources.indexOf(source) == selectedIndex))
                  .toList()),
          Expanded(child: NewsListWidget(widget.sources[selectedIndex]))
        ],
      ),
    );
  }
}
