import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/custom_text.dart';
import 'package:bookly_app/features/Home/data/model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel, });
    final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetails , extra: bookModel);
      },
      child: SizedBox(
        height: 135,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.8 / 4,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: bookModel.imageUrl??"https://www.kingfut.com/wp-content/uploads/2023/07/F08VuHAWwAkiBI_.jpeg",
                  errorWidget: (context, url, error) => Icon(Icons.book_rounded),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CustomText(
                      text: bookModel.title,
                      size: 20.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'GTSectraFine',
                    ),
                  ),
                      
                  const SizedBox(height: 3),
                      
                  CustomText(
                    text: bookModel.authorName,
                    size: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                      
                  const SizedBox(height: 3),
                      
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                      
                    child: Row(
                      children:  [
                        CustomText(
                          text: "free-book",
                          size: 20.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                        ),
                        const Spacer(flex: 1),
                        const Icon(Icons.star, color: Colors.amber, size: 20.0),
                      
                        const SizedBox(width: 6.3),
                        CustomText(
                          text: "4.8",
                          size: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      
                        SizedBox(width: 5),
                      
                        CustomText(
                          text: "250",
                          size: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
