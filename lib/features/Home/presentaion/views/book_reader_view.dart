import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookReaderView extends StatelessWidget {
  const BookReaderView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BookReaderViewBody(bookModel: bookModel,);
  }
}



class BookReaderViewBody extends StatefulWidget {
  final BookModel bookModel;

  const BookReaderViewBody({
    super.key,
    required this.bookModel,
  });

  @override
  State<BookReaderViewBody> createState() => _BookReaderViewBodyState();
}

class _BookReaderViewBodyState extends State<BookReaderViewBody> {
  WebViewController? controller;
  String? bookContent;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadBook();
  }

  Future<void> loadBook() async {
    final book = widget.bookModel;

    try {
      if (book.readUrl != null && book.readUrl!.isNotEmpty) {
        final webController = WebViewController();

        await webController.setJavaScriptMode(
          JavaScriptMode.disabled,
        );

        await webController.loadRequest(
          Uri.parse(book.readUrl!),
        );

        if (!mounted) return;

        setState(() {
          controller = webController;
          isLoading = false;
        });

        return;
      }

      if (book.textUrl != null && book.textUrl!.isNotEmpty) {
        final response = await Dio().get<String>(
          book.textUrl!,
          options: Options(
            responseType: ResponseType.plain,
          ),
        );

        if (!mounted) return;

        setState(() {
          bookContent = response.data;
          isLoading = false;
        });

        return;
      }

      setState(() {
        isLoading = false;
        errorMessage = 'No reading format available for this book.';
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load the book. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.bookModel.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      errorMessage!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : controller != null
                  ? WebViewWidget(
                      controller: controller!,
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: SelectableText(
                        bookContent ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.8,
                        ),
                      ),
                    ),
    );
  }
}