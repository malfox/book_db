import 'package:book_db/components/book_list_item.dart';
import 'package:book_db/models/book_list_dto.dart';
import 'package:book_db/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BookSearch extends StatefulWidget {
  const BookSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<BookSearch> createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  final TextEditingController _searchController = TextEditingController();
  final PagingController<int, BookListDto> _pagingController = PagingController(firstPageKey: 0);
  int? _totalCount;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book search'),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.brown,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Total count: ${_totalCount ?? 0}',
              style: const TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search for book',
                          prefixIcon: Icon(Icons.search),
                        ),
                        controller: _searchController,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      _pagingController.refresh();
                    },
                    child: const Text('Find'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: PagedListView<int, BookListDto>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<BookListDto>(
                    itemBuilder: (context, item, index) => BookListItem(
                      book: item,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final bookSearchResponse =
          (await BookProvider().findAll(_searchController.text, page: ++pageKey));

      if (pageKey != 0) {
        setState(() {
          _totalCount = int.parse(bookSearchResponse?.total ?? '0');
        });
      }

      final newItems = bookSearchResponse!.books;
      final isLastPage =
          ((_pagingController.itemList?.length ?? 0) + (newItems?.length ?? 0)) == _totalCount;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems!);
      } else {
        _pagingController.appendPage(newItems!, pageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}
