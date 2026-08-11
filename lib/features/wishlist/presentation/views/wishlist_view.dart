import '../cubit/wishlist_cubit.dart';
import '../cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/di/di.dart';
import 'package:graduation_project/core/theme/color_manager.dart';






class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WishlistCubit>()..getWishlist(),
      child: Scaffold(
        backgroundColor: ColorManager.background,
        appBar: AppBar(
          title: const Text('My Wishlist'),
          centerTitle: true,
          backgroundColor: ColorManager.white,
          foregroundColor: ColorManager.primary,
          elevation: 0,
        ),
        body: BlocConsumer<WishlistCubit, WishlistState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),

              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),

              error: (message) => Center(
                child: Text(message),
              ),

              loaded: (items) {
                if (items.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 70,
                          color: ColorManager.grey500,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Your wishlist is empty',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add products you love to see them here.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorManager.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: items.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: item.image.isNotEmpty
                                ? Image.network(
                                    item.image,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) {
                                      return _placeholder();
                                    },
                                  )
                                : _placeholder(),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  '${item.price.toStringAsFixed(2)} EGP',
                                  style: const TextStyle(
                                    color: ColorManager.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              context
                                  .read<WishlistCubit>()
                                  .removeFromWishlist(item.id);
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: ColorManager.primary,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      width: 80,
      height: 80,
      color: ColorManager.grey100,
      child: const Icon(
        Icons.image_outlined,
        color: ColorManager.grey500,
      ),
    );
  }
}