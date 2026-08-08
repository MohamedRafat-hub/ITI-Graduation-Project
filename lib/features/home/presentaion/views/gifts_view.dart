import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/core/di/di.dart';

import '../cubit/gifts_cubit.dart';
import '../cubit/gifts_state.dart';

import '../utils/gift_sorting.dart';

import '../widgets/ gifts_filter.dart';
import '../widgets/gifts_grid.dart';
import '../widgets/gifts_header.dart';

class GiftsView extends StatefulWidget {
  final String? categoryName;

  const GiftsView({
    super.key,
    this.categoryName,
  });

  @override
  State<GiftsView> createState() => _GiftsViewState();
}

class _GiftsViewState extends State<GiftsView> {
  String selectedFilter = "Popular";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF8),

      body: BlocProvider(
        create: (_) {
          final cubit = getIt<GiftsCubit>();

          if (widget.categoryName != null) {
            cubit.getGiftsByCategory(
              widget.categoryName!,
            );
          } else {
            cubit.getGifts();
          }

          return cubit;
        },

        child: BlocBuilder<GiftsCubit, GiftsState>(
          builder: (context, state) {

            // =========================
            // LOADING
            // =========================

            if (state is GiftsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // =========================
            // ERROR
            // =========================

            if (state is GiftsError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
            }

            // =========================
            // LOADED
            // =========================

            if (state is GiftsLoaded) {

              final gifts = sortGifts(
                state.gifts,
                selectedFilter,
              );

              return SafeArea(
                child: CustomScrollView(
                  slivers: [

                    // HEADER
                    GiftsHeader(
                      title: widget.categoryName != null
                          ? "${widget.categoryName} Gifts"
                          : "All Gifts",
                      giftsCount: gifts.length,
                    ),

                    // FILTER
                    GiftsFilter(
                      selectedFilter: selectedFilter,
                      onFilterChanged: (filter) {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                    ),

                    // GRID
                    GiftsGrid(
                      gifts: gifts,
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}