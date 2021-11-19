//Copyright (C) 2016 Potix Corporation. All Rights Reserved.
//History: Tue Feb 16 4:08 PM CST 2017
// Author: jimmy
@JS()
library highcharts.src.highcharts_js;

import "package:js/js.dart";


@JS('Highcharts')
class Highcharts {
  external static ChartOptionsStatic getOptions();
}

@JS('Highcharts.chart')
class HighChart {

  external void redraw();
  external void update(ChartConfiguration options, bool redraw);
  external void reflow();
  external void setSize(num? width, num? height, AnimationOptions? animation);

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

  external ChartAccessibility get accessibility;
  external set accessibility(ChartAccessibility v);

  external List<ChartDataSets> get series;
  external set series(List<ChartDataSets> v);

  external factory ChartConfiguration({
    ChartOptions chart,
    ChartTitle title,
    ChartTitle subtitle,
    ChartXAxis? xAxis, ChartYAxis? yAxis,
    ChartCredits credits,
    ChartLegend legend,
    ChartTooltip tooltip,
    ChartPlotOptions plotOptions,
    ChartAccessibility accessibility,
    List<ChartDataSets> series});
}

@anonymous
@JS()
class ChartOptionsStatic {
  external List<String> get colors;
  external List<String> get symbols;
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

  external List<num> get margin;
  external set margin(List<num> v);

  external num get marginTop;
  external set marginTop(num v);

  external String get zoomKey;
  external set zoomKey(String v);

  external String get zoomType;
  external set zoomType(String v);

  external factory ChartOptions({String type,
    dynamic width, dynamic height, List<num> margin, num marginTop, String zoomKey, String zoomType});
}

@anonymous
@JS()
abstract class AnimationOptions {
  external num get duration;
  external set duration(num v);

  external String get easing;
  external set easing(String v);

  external Function get complete;
  external set complete(Function v);

  external Function get step;
  external set step(Function v);

  external factory AnimationOptions({
    num duration,
    String easing,
    Function complete,
    Function step});

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

  external dynamic get crosshair;
  external set crosshair(dynamic v);

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

  external num get tickWidth;
  external set tickWidth(num v);

  external String get tickColor;
  external set tickColor(String v);

  external String get tickmarkPlacement;
  external set tickmarkPlacement(String v);

  external String get type;
  external set type(String v);

  external ChartAccessibility get accessibility;
  external set accessibility(ChartAccessibility v);

  external factory ChartXAxis({
    List<dynamic> categories,
    ChartLabels labels,
    bool allowDecimals, dynamic crosshair, num tickLength,
    String lineColor, num lineWidth, num tickWidth,
    String tickColor, String tickmarkPlacement, String type,
    ChartAccessibility accessibility});
}

@anonymous
@JS()
abstract class ChartCrosshair {
  external num get width;
  external set width(num v);

  external String get color;
  external set color(String v);

  external String get dashStyle;
  external set dashStyle(String v);

  external factory ChartCrosshair({
    num width, String color, String dashStyle});
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

  external String get type;
  external set type(String v);

  external ChartAccessibility get accessibility;
  external set accessibility(ChartAccessibility v);

  external factory ChartYAxis({
    ChartTitle title, num min,
    ChartLabels labels,
    String gridLineColor, num tickAmount,
    num tickInterval, bool showFirstLabel,
    String type, ChartAccessibility accessibility});
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

  external bool get enabled;
  external set enabled(bool v);

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
    bool enabled,
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

  external Function get formatter;
  external set formatter(Function v);

  external factory ChartTooltip({
    String valueSuffix,
    String headerFormat,
    String pointFormat,
    String footerFormat,
    bool shared,
    bool useHTML,
    Function formatter});
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
abstract class ChartAccessibility {


  external String get description;
  external set description(String v);

  external String get rangeDescription;
  external set rangeDescription(String v);

  external bool get enabled;
  external set enabled(bool v);

  external ChartAccessibilityPoint get point;
  external set point(ChartAccessibilityPoint v);


  external factory ChartAccessibility({bool? enabled,
    String? description, String? rangeDescription,
    ChartAccessibilityPoint? point});
}

@anonymous
@JS()
abstract class ChartAccessibilityPoint {

  external String get dateFormat;
  external set dateFormat(String v);

  external Function get dateFormatter;
  external set dateFormatter(Function v);

  external Function get descriptionFormatter;
  external set descriptionFormatter(Function v);

  external num get valueDecimals;
  external set valueDecimals(num v);

  external String get valueDescriptionFormat;
  external set valueDescriptionFormat(String v);

  external String get valuePrefix;
  external set valuePrefix(String v);

  external String get valueSuffix;
  external set valueSuffix(String v);


  external factory ChartAccessibilityPoint({
    String? dateFormat, Function? dateFormatter, Function? descriptionFormatter,
    num? valueDecimals, String? valueDescriptionFormat,
    String? valuePrefix, String? valueSuffix});
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

  external bool get ignoreHiddenPoint;
  external set ignoreHiddenPoint(bool v);

  external bool get allowPointSelect;
  external set allowPointSelect(bool v);

  external String get size;
  external set size(String v);

  external ChartStates get states;
  external set states(ChartStates v);

  external num get startAngle;
  external set startAngle(num v);

  external num get endAngle;
  external set endAngle(num v);

  external factory PiePlotOptions({
    String cursor,
    bool shadow,
    bool showInLegend,
    List<dynamic> center,
    ChartDataLabels dataLabels,
    bool allowPointSelect,
    bool ignoreHiddenPoint,
    String size, ChartStates states,
    num startAngle, num endAngle,
    String borderColor, num borderWidth});
}

@anonymous
@JS()
abstract class AreaPlotOptions {

  external num get pointStart;
  external set pointStart(num v);

  external num get pointInterval;
  external set pointInterval(num v);

  external String get pointIntervalUnit;
  external set pointIntervalUnit(String v);

  external dynamic get pointPlacement;
  external set pointPlacement(v);

  external ChartMarker get marker;
  external set marker(ChartMarker v);

  external String get stacking;
  external set stacking(String v);

  external num get lineWidth;
  external set lineWidth(num v);

  external String get lineColor;
  external set lineColor(String v);

  external factory AreaPlotOptions({
    num pointStart, num pointInterval,
    String pointIntervalUnit, pointPlacement,
    ChartMarker marker, String stacking,
    num lineWidth, String lineColor});
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

  external String get fillColor;
  external set fillColor(String v);

  external String get lineColor;
  external set lineColor(String v);

  external num get lineWidth;
  external set lineWidth(num v);

  external factory ChartMarker({
    bool? enabled, String? symbol, num? radius,
    ChartStates? states,
    String? fillColor, String? lineColor, num? lineWidth});
}

@anonymous
@JS()
abstract class ChartStates {

  external ChartHover get hover;
  external set hover(ChartHover v);

  external String get symbol;
  external set symbol(String v);

  external factory ChartStates({
    ChartHover hover, String symbol});
}

@anonymous
@JS()
abstract class ChartHover {

  external bool get enabled;
  external set enabled(bool v);

  external num get brightness;
  external set brightness(num v);

  external ChartHalo get halo;
  external set halo(ChartHalo v);  

  external factory ChartHover({bool enabled, num brightness, ChartHalo halo});
}

@anonymous
@JS()
abstract class ChartHalo {
  external factory ChartHalo();
}

@anonymous
@JS()
abstract class ChartLabels {
  external Function get formatter;
  external set formatter(Function v);

  external Map<String, String> get style;
  external set style(Map<String, String> v);

  external num get step;
  external set step(num step);

  external bool get enabled;
  external set enabled(bool v);

  external factory ChartLabels({Function formatter, Map<String, String> style, num step, bool enabled});
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

  external Function get formatter;
  external set formatter(Function v);

  external factory ChartDataLabels({
    String? color,
    bool? enabled,
    num? distance,
    Function? formatter});

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

  external bool get colorByPoint;
  external set colorByPoint(bool v);

  external ChartDataLabels get dataLabels;
  external set dataLabels(ChartDataLabels v);

  external List<dynamic> get data;
  external set data(List<dynamic> v);

  external ChartMarker get marker;
  external set marker(ChartMarker v);

  external num get fillOpacity;
  external set fillOpacity(num v);

  external num get lineWidth;
  external set lineWidth(num v);

  external String get lineColor;
  external set lineColor(String v);

  external factory ChartDataSets({
    String? name, String? color, num? y,
    String? size, String? innerSize,
    bool? visible, bool? colorByPoint,
    num? startAngle, num? endAngle,
    num? borderRadius, num? borderWidth, String? stack,
    ChartDataLabels? dataLabels,
    List<dynamic>? data, ChartMarker? marker,
    num? fillOpacity, num? lineWidth, String? lineColor});
}

@anonymous
@JS()
abstract class ChartInnerDataSets {
  external String get name;
  external set name(String v);

  external num get y;
  external set y(num v);

  external num get color;
  external set color(num v);

  external bool get visible;
  external set visible(bool v);

  external bool get sliced;
  external set sliced(bool v);

  external bool get selected;
  external set selected(bool v);

  external factory ChartInnerDataSets({
    String name, num? y, String? color,
    bool? visible, bool? sliced, bool? selected});
}
