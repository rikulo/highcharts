//Copyright (C) 2016 Potix Corporation. All Rights Reserved.
//History: Tue Feb 16 4:08 PM CST 2017
// Author: jimmy
@JS()
library highcharts.src.highcharts_js;

import "dart:js" show JsFunction;
import "package:js/js.dart";

@JS('Highcharts.chart')
class HighChart {

  external void redraw();

  external factory HighChart(dynamic container, ChartConfiguration options);
}

@anonymous
@JS()
abstract class ChartConfiguration {

  external ChartOptions get chart;
  external set chart(ChartOptions v);

  external ChartTitle get title;
  external set title(ChartTitle v);

  external ChartTitle get subtitle;
  external set subtitle(ChartTitle v);

  external ChartXAxis get xAxis;
  external set xAxis(ChartXAxis v);

  external ChartYAxis get yAxis;
  external set yAxis(ChartYAxis v);

  external ChartLegend get legend;
  external set legend(ChartLegend v);

  external ChartCredits get credits;
  external set credits(ChartCredits v);



  external ChartTooltip get tooltip;
  external set tooltip(ChartTooltip v);

  external ChartPlotOptions get plotOptions;
  external set plotOptions(ChartPlotOptions v);

  external List<ChartDataSets> get series;
  external set series(List<ChartDataSets> v);

  external factory ChartConfiguration({
    ChartOptions chart,
    ChartTitle title,
    ChartTitle subtitle,
    ChartXAxis xAxis, ChartYAxis yAxis,
    ChartCredits credits,
    ChartLegend legend,
    ChartTooltip tooltip,
    ChartPlotOptions plotOptions,
    List<ChartDataSets> series});
}

@anonymous
@JS()
abstract class ChartOptions {
  external String get type;
  external set type(String v);

  external dynamic get width;
  external set width(dynamic v);

  external dynamic get height;
  external set height(dynamic v);

  external factory ChartOptions({String type,
    dynamic width, dynamic height});
}

@anonymous
@JS()
abstract class ChartTitle {
  external String get text;
  external set text(String v);

  external factory ChartTitle({String text});
}

@anonymous
@JS()
abstract class ChartXAxis {
  external List<dynamic> get categories;
  external set categories(List<dynamic> v);

  external bool get crosshair;
  external set crosshair(bool v);

  external bool get allowDecimals;
  external set allowDecimals(bool v);

  external ChartLabels get labels;
  external set labels(ChartLabels v);

  external ChartTooltip get tooltip;
  external set tooltip(ChartTooltip v);

  external num get tickLength;
  external set tickLength(num v);

  external String get lineColor;
  external set lineColor(String v);

  external num get lineWidth;
  external set lineWidth(num v);

  external factory ChartXAxis({
    List<dynamic> categories,
    ChartLabels labels,
    bool allowDecimals, bool crosshair, num tickLength,
    String lineColor, num lineWidth});
}

@anonymous
@JS()
abstract class ChartYAxis {
  external ChartTitle get title;
  external set title(ChartTitle v);

  external num get min;
  external set min(num v);

  external ChartLabels get labels;
  external set labels(ChartLabels v);

  external String get gridLineColor;
  external set gridLineColor(String v);

  external num get tickAmount;
  external set tickAmount(num v);

  external num get tickInterval;
  external set tickInterval(num v);

  external bool get showFirstLabel;
  external set showFirstLabel(bool v);

  external factory ChartYAxis({
    ChartTitle title, num min,
    ChartLabels labels,
    String gridLineColor, num tickAmount,
    num tickInterval, bool showFirstLabel});
}

@anonymous
@JS()
abstract class ChartLegend {
  external String get align;
  external set align(String v);

  external String get verticalAlign;
  external set verticalAlign(String v);

  external num get x;
  external set x(num v);

  external num get y;
  external set y(num v);

  external String get borderColor;
  external set borderColor(String v);

  external num get borderWidth;
  external set borderWidth(num v);

  external bool get floating;
  external set floating(bool v);

  external bool get shadow;
  external set shadow(bool v);

  external Map<String, String> get itemStyle;
  external set itemStyle(Map<String, String> v);

  external factory ChartLegend({
    String align,
    String verticalAlign,
    num x, num y,
    String borderColor,
    num borderWidth,
    bool floating,
    bool shadow,
    Map<String, String> itemStyle});
}

@anonymous
@JS()
abstract class ChartCredits {
  external bool get enabled;
  external set enabled(bool v);

  external factory ChartCredits({bool enabled});
}

@anonymous
@JS()
abstract class ChartTooltip {

  external String get valueSuffix;
  external set valueSuffix(String v);

  external String get headerFormat;
  external set headerFormat(String v);

  external String get pointFormat;
  external set pointFormat(String v);

  external String get footerFormat;
  external set footerFormat(String v);

  external bool get shared;
  external set shared(bool v);

  external bool get useHTML;
  external set useHTML(bool v);

  external JsFunction get formatter;
  external set formatter(JsFunction v);

  external factory ChartTooltip({
    String valueSuffix,
    String headerFormat,
    String pointFormat,
    String footerFormat,
    bool shared,
    bool useHTML,
    JsFunction formatter});
}

@anonymous
@JS()
abstract class ChartPlotOptions {

  external ChartColumn get column;
  external set column(ChartColumn v);

  external PiePlotOptions get pie;
  external set pie(PiePlotOptions v);

  external AreaPlotOptions get area;
  external set area(AreaPlotOptions v);

  external factory ChartPlotOptions({
    ChartColumn column,
    PiePlotOptions pie,
    AreaPlotOptions area});
}

@anonymous
@JS()
abstract class PiePlotOptions {

  external String get cursor;
  external set cursor(String v);

  external bool get shadow;
  external set shadow(bool v);

  external bool get showInLegend;
  external set showInLegend(bool v);

  external List<dynamic> get center;
  external set center(List<dynamic> v);

  external ChartDataLabels get dataLabels;
  external set dataLabels(ChartDataLabels v);

  external factory PiePlotOptions({
    String cursor,
    bool shadow,
    bool showInLegend,
    List<dynamic> center,
    ChartDataLabels dataLabels});
}

@anonymous
@JS()
abstract class AreaPlotOptions {

  external num get pointStart;
  external set pointStart(num v);

  external ChartMarker get marker;
  external set marker(ChartMarker v);

  external factory AreaPlotOptions({
    num radius,
    ChartMarker marker});

}

@anonymous
@JS()
abstract class ChartColumn {
  external num get pointPadding;
  external set pointPadding(num v);

  external num get groupPadding;
  external set groupPadding(num v);

  external num get borderWidth;
  external set borderWidth(num v);

  external String get stacking;
  external set stacking(String v);

  external factory ChartColumn({num pointPadding, groupPadding, num borderWidth, String stacking});
}

@anonymous
@JS()
abstract class ChartMarker {

  external bool get enabled;
  external set enabled(bool v);

  external String get symbol;
  external set symbol(String v);

  external num get radius;
  external set radius(num v);

  external ChartStates get states;
  external set states(ChartStates v);

  external factory ChartMarker({
    bool enabled, String symbol, num radius,
    ChartStates states});
}

@anonymous
@JS()
abstract class ChartStates {

  external ChartHover get hover;
  external set hover(ChartHover v);

  external factory ChartStates({ChartHover hover});
}

@anonymous
@JS()
abstract class ChartHover {

  external bool get enabled;
  external set enabled(bool v);

  external factory ChartHover({bool enabled});
}

@anonymous
@JS()
abstract class ChartLabels {
  external JsFunction get formatter;
  external set formatter(JsFunction v);

  external Map<String, String> get style;
  external set style(Map<String, String> v);

  external num get step;
  external set step(num step);

  external factory ChartLabels({JsFunction formatter, Map<String, String> style, num step});
}

@anonymous
@JS()
abstract class ChartDataLabels {
  external String get color;
  external set color(String v);

  external num get distance;
  external set distance(num v);

  external bool get enabled;
  external set enabled(bool v);

  external JsFunction get formatter;
  external set formatter(JsFunction v);

  external factory ChartDataLabels({
    String color,
    bool enabled,
    num distance,
    JsFunction formatter});

}

@anonymous
@JS()
abstract class ChartDataSets {
  external String get name;
  external set name(String v);

  external String get color;
  external set color(String v);

  external String get stack;
  external set stack(String v);

  external String get size;
  external set size(String v);

  external String get innerSize;
  external set innerSize(String v);

  external num get y;
  external set y(num v);

  external num get startAngle;
  external set startAngle(num v);

  external num get endAngle;
  external set endAngle(num v);

  external num get borderRadius;
  external set borderRadius(num v);

  external num get borderWidth;
  external set borderWidth(num v);

  external bool get visible;
  external set visible(bool v);

  external ChartDataLabels get dataLabels;
  external set dataLabels(ChartDataLabels v);

  external List<dynamic> get data;
  external set data(List<dynamic> v);

  external factory ChartDataSets({
    String name, String color, num y,
    String size, String innerSize,
    bool visible,
    num startAngle, num endAngle,
    num borderRadius, num borderWidth,
    String stack,
    ChartDataLabels dataLabels,
    List<dynamic> data});
}