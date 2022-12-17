import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(ChartInitial()) {
    on<ChartEvent>((event, emit) {
      if(event is OnBuyButtonPress) {
        emit(ShowBuyContaner());
      }
      if(event is OnSellButtonPress) {
        emit(ShowSellContaner());
      }
      if(event is OnMarketDepthPress) {
        emit(ShowMarketDepth());
      }
    });
  }
}
