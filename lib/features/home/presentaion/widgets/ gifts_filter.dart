import 'package:flutter/material.dart';
import 'filter_ship.dart';

class GiftsFilter extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const GiftsFilter({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 52,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          children: [
            FilterShip(
              title: "Popular",
              selected: selectedFilter == "Popular",
              onTap: () {
                onFilterChanged("Popular");
              },
            ),

            FilterShip(
              title: "\$ Low",
              selected: selectedFilter == "\$ Low",
              onTap: () {
                onFilterChanged("\$ Low");
              },
            ),

            FilterShip(
              title: "\$ High",
              selected: selectedFilter == "\$ High",
              onTap: () {
                onFilterChanged("\$ High");
              },
            ),

            FilterShip(
              title: "★ Rating",
              selected: selectedFilter == "★ Rating",
              onTap: () {
                onFilterChanged("★ Rating");
              },
            ),
          ],
        ),
      ),
    );
  }
}