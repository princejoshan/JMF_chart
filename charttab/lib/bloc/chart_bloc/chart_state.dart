part of 'chart_bloc.dart';

@immutable
abstract class ChartState {}

class ChartInitial extends ChartState {}
class ShowBuyContaner extends ChartState {}
class ShowSellContaner extends ChartState {}
class ShowMarketDepth extends ChartState {}
