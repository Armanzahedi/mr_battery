import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:mr_battery/screens/search_screen.dart';
import 'package:mr_battery/services/utils/my_theme.dart';

class SearchBar extends StatefulWidget {
  SearchBar({this.child});
  final Widget child;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @required
  static const historyLength = 5;
  FloatingSearchBarController controller;
// The "raw" history that we don't access from the UI, prefilled with values
  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
  ];
// The filtered & ordered history that's accessed from the UI
  List<String> filteredSearchHistory;

// The currently searched-for term
  String selectedTerm;

  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      // Reversed because we want the last added items to appear first in the UI
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      // This method will be implemented soon
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
    // Changes in _searchHistory mean that we have to update the filteredSearchHistory
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  void searchForTerm(String term) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchScreen(term)),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: FloatingSearchBar(
          controller: controller,
          body: FloatingSearchBarScrollNotifier(
            child: widget.child,
          ),
          transition: CircularFloatingSearchBarTransition(),
          physics: BouncingScrollPhysics(),
          title: Text(
            selectedTerm ?? 'جستجو در آقای باتری',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                color: MyTheme.secondaryColor),
          ),
          hint: 'در محصولات جستجو کنید..',
          actions: [
            FloatingSearchBarAction.searchToClear(),
          ],
          onQueryChanged: (query) {
            setState(() {
              filteredSearchHistory = filterSearchTerms(filter: query);
            });
          },
          onSubmitted: (query) {
            setState(() {
              addSearchTerm(query);
              selectedTerm = null;
            });
            controller.close();
            searchForTerm(query);
          },
          builder: (context, transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 4,
                child: Builder(
                  builder: (context) {
                    if (filteredSearchHistory.isEmpty &&
                        controller.query.isEmpty) {
                      return Container(
                          height: 56,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: widget.child);
                    } else if (filteredSearchHistory.isEmpty) {
                      return ListTile(
                        title: Text(controller.query),
                        leading: const Icon(Icons.search),
                        onTap: () {
                          setState(() {
                            addSearchTerm(controller.query);
                            selectedTerm = null;
                          });
                          controller.close();
                          searchForTerm(controller.query);
                        },
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: filteredSearchHistory
                            .map(
                              (term) => ListTile(
                                title: Text(
                                  term,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: const Icon(Icons.history),
                                trailing: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      deleteSearchTerm(term);
                                    });
                                  },
                                ),
                                onTap: () {
                                  setState(() {
                                    putSearchTermFirst(term);
                                    selectedTerm = null;
                                  });
                                  controller.close();
                                  searchForTerm(term);
                                },
                              ),
                            )
                            .toList(),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;
  final Widget defaultwidget;

  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
    @required this.defaultwidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null) {
      return defaultwidget;
    }
    return ListView(
      // padding: EdgeInsets.only(top: 10 + fsb.margins.vertical),
      children: List.generate(
        50,
        (index) => ListTile(
          title: Text('$searchTerm search result'),
          subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}
