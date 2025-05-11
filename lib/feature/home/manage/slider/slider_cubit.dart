import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/feature/home/data/models/silder/silder_model.dart';
import 'package:ntigradproject/feature/home/data/repositories/repo_slider/repo.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  final SliderRepo sliderRepo;
  SliderCubit(this.sliderRepo) : super(SliderInitial());
  Future<void> getSliderData() async {
    emit(SliderLoadingState());
    final result = await sliderRepo.getSliderData();
    result.fold(
      (failure) => emit(SliderFailureState(errMessage: 'error')),
      (slider) => emit(SliderSuccessState(slider)),
    );
  }
}
