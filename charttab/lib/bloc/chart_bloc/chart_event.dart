part of 'chart_bloc.dart';

@immutable
abstract class ChartEvent {}
class OnBuyButtonPress extends ChartEvent {}
class OnSellButtonPress extends ChartEvent {}
class OnMarketDepthPress extends ChartEvent {}
