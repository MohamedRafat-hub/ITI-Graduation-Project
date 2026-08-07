abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterApplied extends FilterState {
  final String? selectedCategory;
  FilterApplied({this.selectedCategory});
}