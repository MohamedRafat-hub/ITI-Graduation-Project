
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/search/presentation/cubit/search_cubit.dart';

class FilterScreen extends StatefulWidget {
  final Function(String category, double maxPrice, double minRating) onApplyFilters;

  const FilterScreen({super.key, required this.onApplyFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String _selectedCategory = 'All';
  double _maxPrice = 250;
  final String _selectedRating = 'Any';

  final List<String> _categories = ['All', 'Electronics', 'Fashion', 'Wellness'];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFE8614A);

    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Filters', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: _categories.map((cat) {
                final isSelected = _selectedCategory == cat;
                return ChoiceChip(
                  label: Text(cat),
                  selected: isSelected,
                  selectedColor: primaryColor,
                  labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                  onSelected: (selected) => setState(() => _selectedCategory = cat),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Max Price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Slider(
              value: _maxPrice,
              min: 0,
              max: 500,
              activeColor: primaryColor,
              onChanged: (val) => setState(() => _maxPrice = val),
            ),
            Text('\$${_maxPrice.round()}'),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: primaryColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'All';
                        _maxPrice = 250;
                      });
                      BlocProvider.of<SearchCubit>(context).search("");
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      double ratingNum = _selectedRating == '3+' ? 3.0 : (_selectedRating == '4+' ? 4.0 : 0);
                      widget.onApplyFilters(_selectedCategory, _maxPrice, ratingNum);

                      if (_selectedCategory == 'All') {
                        BlocProvider.of<SearchCubit>(context).search("");
                      } else {
                        BlocProvider.of<SearchCubit>(context).searchByCategory(_selectedCategory);
                      }
                    },
                    child: const Text(
                      'Apply Filters',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

































