import 'package:flutter/material.dart';
import '../views/product_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/theme/values_manager.dart';
import 'package:graduation_project/core/constants/strings_manager.dart';
import 'package:graduation_project/features/home/presentaion/cubit/gifts_cubit.dart';
import 'package:graduation_project/features/home/presentaion/cubit/gifts_state.dart';
import 'package:graduation_project/features/home/presentaion/widgets/product_card.dart';
import 'package:graduation_project/features/home/presentaion/widgets/section_title.dart';


class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: StringsManager.gifts,
          type: SectionType.gifts,
        ),

        const SizedBox(height: AppSize.s10),

        SizedBox(
          height: AppSize.s300,
          child: BlocBuilder<GiftsCubit, GiftsState>(
            builder: (context, state) {
              if (state is GiftsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is GiftsError) {
                return Center(
                  child: Text(state.message),
                );
              }

              if (state is GiftsLoaded) {
                final gifts = state.gifts;

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20,
                  ),
                  scrollDirection: Axis.horizontal,

                  itemCount: gifts.length,

                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: AppSize.s16,
                    );
                  },

                  itemBuilder: (context, index) {
                    final gift = gifts[index];

                    return ProductCard(
                      image: gift.imageUrl,
                      name: gift.name,
                      price: gift.price,
                      id: gift.id,
                      oldPrice: gift.oldPrice,
                      rating: gift.rating,
                      

                      // 👇 لما ندوس على المنتج
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailsView(
                              gift: gift,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}