// lib/features/ai_gift_recommendation/presentation/pages/gift_finder_input_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/theme/color_manager.dart';
import 'package:graduation_project/features/aiFinder/presentation/views/widgets/age_selector_slider.dart';
import 'package:graduation_project/features/aiFinder/presentation/views/widgets/ai_header_banner.dart';
import 'package:graduation_project/features/aiFinder/presentation/views/widgets/budget_range_slider.dart';
import 'package:graduation_project/features/aiFinder/presentation/views/widgets/interester_tag_selector.dart';
import 'package:graduation_project/features/aiFinder/presentation/views/widgets/occasion_chip_selector.dart';
import 'package:graduation_project/features/aiFinder/presentation/views/widgets/profession_drop_down_field.dart';
import '../../../../core/di/di.dart';
import '../../domain/entities/gift_request_entity.dart';
import '../cubits/ai_recommendation_cubit/ai_recommendation_cubit.dart';
import 'gift_recommentation_result_page.dart';

class GiftFinderInputPage extends StatefulWidget {
  const GiftFinderInputPage({super.key});

  @override
  State<GiftFinderInputPage> createState() => _GiftFinderInputPageState();
}

class _GiftFinderInputPageState extends State<GiftFinderInputPage> {
  final _formKey = GlobalKey<FormState>();

  // Form State
  double _age = 25;
  String _selectedProfession = 'Software Engineer';
  String _selectedOccasion = 'Birthday';
  double _maxBudget = 50;
  final List<String> _selectedInterests = ['Coding', 'Coffee'];

  // Static Data
  static const List<String> _professions = [
    'Software Engineer',
    'Doctor',
    'Teacher',
    'Student',
    'Gamer',
    'Artist',
    'Other'
  ];

  static const List<String> _occasions = [
    'Birthday',
    'Graduation',
    'Wedding',
    'Anniversary',
    'New Job',
    'Holiday'
  ];

  static const List<String> _availableInterests = [
    'Coding',
    'Gaming',
    'Reading',
    'Coffee',
    'Sports',
    'Music',
    'Fashion',
    'Tech Accessories',
    'Fitness'
  ];

  void _onToggleInterest(String interest, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedInterests.add(interest);
      } else {
        _selectedInterests.remove(interest);
      }
    });
  }

  void _submitForm() {
    final request = GiftRequestEntity(
      age: _age.round(),
      profession: _selectedProfession,
      occasion: _selectedOccasion,
      interests: _selectedInterests,
      maxBudget: _maxBudget,
    );

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return BlocProvider(
        create: (_) => getIt<AiRecommendationCubit>()..fetchRecommendations(request),
        child: GiftRecommendationResultsPage(request: request),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Gift Finder ✨'),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AiHeaderBanner(),
              const SizedBox(height: 24),
              AgeSelectorSlider(
                age: _age,
                onChanged: (val) => setState(() => _age = val),
              ),
              const SizedBox(height: 16),
              ProfessionDropdownField(
                selectedProfession: _selectedProfession,
                professions: _professions,
                onChanged: (val) => setState(() => _selectedProfession = val!),
              ),
              const SizedBox(height: 20),
              OccasionChipSelector(
                selectedOccasion: _selectedOccasion,
                occasions: _occasions,
                onSelected: (val) => setState(() => _selectedOccasion = val),
              ),
              const SizedBox(height: 20),
              InterestsTagSelector(
                selectedInterests: _selectedInterests,
                availableInterests: _availableInterests,
                onToggleInterest: _onToggleInterest,
              ),
              const SizedBox(height: 20),
              BudgetRangeSlider(
                maxBudget: _maxBudget,
                onChanged: (val) => setState(() => _maxBudget = val),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.auto_awesome, color: Colors.white),
                  label: const Text(
                    'Find Gifts with AI ✨',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _submitForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}