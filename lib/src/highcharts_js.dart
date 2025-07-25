//Copyright (C) 2016 Potix Corporation. All Rights Reserved.
//History: Tue Feb 16 4:08 PM CST 2017
// Author: jimmy
library highcharts.src.highcharts_js;

import 'package:web/web.dart';
import 'dart:js_interop';

@JS('Highcharts')
extension type Highcharts._(JSObject _) implements JSObject {
  external static ChartOptionsStatic getOptions();

  external static HighChart chart(JSAny container, ChartConfiguration options);
}

@JS('Highcharts.chart')
extension type HighChart._(JSObject _) implements JSObject {

  external JSArray<ChartSeries> get series;

  external ChartSeries addSeries (ChartDataSets options, [bool redraw, bool animation]);

  external void redraw();
  external void update(ChartConfiguration options, [bool redraw, bool oneToOne, bool animation]);
  external void reflow();
  external void setSize(num? width, num? height, JSAny? animation);
  external void destroy();

  external set isDirtyLegend(bool v);
  external set isDirtyBox(bool v);
}

extension type ChartConfiguration._(JSObject _) implements JSObject {

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

  external ChartResponsive? get responsive;
  external set responsive(ChartResponsive? v);

  external ChartCredits get credits;
  external set credits(ChartCredits v);



  external ChartTooltip get tooltip;
  external set tooltip(ChartTooltip v);

  external ChartPlotOptions get plotOptions;
  external set plotOptions(ChartPlotOptions v);

  external ChartAccessibility get accessibility;
  external set accessibility(ChartAccessibility v);

  external JSArray<ChartDataSets> get series;
  external set series(JSArray<ChartDataSets> v);

  external factory ChartConfiguration({
    ChartOptions chart,
    ChartTitle title,
    ChartTitle subtitle,
    ChartXAxis? xAxis, ChartYAxis? yAxis,
    ChartCredits credits,
    ChartLegend legend,
    ChartResponsive? responsive,
    ChartTooltip tooltip,
    ChartPlotOptions plotOptions,
    ChartAccessibility accessibility,
    JSArray<ChartDataSets> series});
}

extension type ChartOptionsStatic._(JSObject _) implements JSObject {
  external JSArray<JSString> get colors;
  external JSArray<JSString> get symbols;
}

extension type ChartOptions._(JSObject _) implements JSObject {
  external String get type;
  external set type(String v);

  external JSAny get width;
  external set width(JSAny v);

  external JSAny get height;
  external set height(JSAny v);

  external JSArray<JSNumber> get margin;
  external set margin(JSArray<JSNumber> v);

  external num get marginTop;
  external set marginTop(num v);

  external String get zoomKey;
  external set zoomKey(String v);

  external String get zoomType;
  external set zoomType(String v);

  external factory ChartOptions({String type,
    JSAny? width, JSAny? height, JSArray<JSNumber>? margin, 
    num? marginTop, String? zoomKey, String? zoomType});
}

extension type AnimationOptions._(JSObject _) implements JSObject {
  external num get duration;
  external set duration(num v);

  external String get easing;
  external set easing(String v);

  external JSFunction get complete;
  external set complete(JSFunction v);

  external JSFunction get step;
  external set step(JSFunction v);

  external factory AnimationOptions({
    num duration,
    String easing,
    JSFunction complete,
    JSFunction step});

}

extension type ChartTitle._(JSObject _) implements JSObject {
  external String get text;
  external set text(String v);

  external factory ChartTitle({String text,
    bool useHTML,
    DOMStringMap? style});
}

extension type ChartXAxis._(JSObject _) implements JSObject {
  external JSArray<JSAny> get categories;
  external set categories(JSArray<JSAny> v);

  external JSAny get crosshair;
  external set crosshair(JSAny v);

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

  external JSFunction get tickPositioner;
  external set tickPositioner(JSFunction v);

  external String get tickmarkPlacement;
  external set tickmarkPlacement(String v);

  external String get type;
  external set type(String v);

  external ChartAccessibility get accessibility;
  external set accessibility(ChartAccessibility v);

  external factory ChartXAxis({
    ChartTitle title, 
    JSArray<JSAny> categories,
    ChartLabels labels,
    bool allowDecimals, JSAny crosshair, num tickLength,
    String lineColor, num lineWidth, num tickWidth,
    String tickColor, JSFunction tickPositioner, String tickmarkPlacement, String type,
    ChartAccessibility accessibility});
}

extension type ChartCrosshair._(JSObject _) implements JSObject {
  external num get width;
  external set width(num v);

  external String get color;
  external set color(String v);

  external String get dashStyle;
  external set dashStyle(String v);

  external factory ChartCrosshair({
    num width, String color, String dashStyle});
}

extension type ChartYAxis._(JSObject _) implements JSObject {
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

  external JSFunction get tickPositioner;
  external set tickPositioner(JSFunction v);

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
    num tickInterval, JSFunction tickPositioner, 
    bool showFirstLabel,
    JSObject stackLabels,
    String type, ChartAccessibility accessibility});
}

extension type ChartLegend._(JSObject _) implements JSObject {
  external String get align;
  external set align(String v);

  external String get verticalAlign;
  external set verticalAlign(String v);

  external String get layout;
  external set layout(String v);

  external num get x;
  external set x(num v);

  external num get y;
  external set y(num v);

  external num get width;
  external set width(num v);

  external num get margin;
  external set margin(num v);

  external num get padding;
  external set padding(num v);

  external num get itemMarginTop;
  external set itemMarginTop(num v);

  external num get itemMarginBottom;
  external set itemMarginBottom(num v);

  external num get itemWidth;
  external set itemWidth(num v);

  external num get symbolPadding;
  external set symbolPadding(num v);

  external num get symbolHeight;
  external set symbolHeight(num v);

  external num get symbolWidth;
  external set symbolWidth(num v);

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

  external DOMStringMap get itemStyle;
  external set itemStyle(DOMStringMap v);

  external bool get useHTML;
  external set useHTML(bool v);

  external JSAny? get navigation;
  external set navigation(JSAny? v);

  external JSFunction get labelFormatter;
  external set labelFormatter(JSFunction v);

  external factory ChartLegend({
    String align,
    String verticalAlign,
    String layout,
    num x, num y, num width, num margin, num padding, 
    num itemMarginTop, num itemMarginBottom, num itemWidth,
    num symbolPadding, num symbolHeight, num symbolWidth,
    String borderColor,
    num borderWidth,
    bool floating,
    bool reversed,
    bool shadow,
    bool enabled,
    bool useHTML,
    JSAny navigation,
    JSFunction labelFormatter,
    DOMStringMap itemStyle,
    DOMStringMap itemHoverStyle});
}

extension type ChartResponsive._(JSObject _) implements JSObject {

  external JSArray<ChartResponsiveRules> get rules;
  external set rules(JSArray<ChartResponsiveRules> v);

  external factory ChartResponsive({
    JSArray<ChartResponsiveRules> rules,
  });
}

extension type ChartResponsiveRules._(JSObject _) implements JSObject {

  external JSObject get condition;
  external set condition(JSObject v);

  external JSObject get chartOptions;
  external set chartOptions(JSObject v);

  external factory ChartResponsiveRules({
    JSObject condition,
    JSObject chartOptions,
  });
}

extension type ChartCredits._(JSObject _) implements JSObject {
  external bool get enabled;
  external set enabled(bool v);

  external factory ChartCredits({bool enabled});
}

extension type ChartTooltip._(JSObject _) implements JSObject {

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

  external JSFunction get formatter;
  external set formatter(JSFunction v);

  external factory ChartTooltip({
    String valueSuffix,
    String headerFormat,
    String pointFormat,
    String footerFormat,
    String borderColor,
    String backgroundColor,
    DOMStringMap style,
    bool shared,
    bool useHTML,
    JSFunction formatter});
}

extension type ChartPlotOptions._(JSObject _) implements JSObject {

  external ColumnPlotOptions get column;
  external set column(ColumnPlotOptions v);

  external PiePlotOptions get pie;
  external set pie(PiePlotOptions v);

  external AreaPlotOptions get area;
  external set area(AreaPlotOptions v);

  external LinePlotOptions get line;
  external set line(LinePlotOptions v);

  external factory ChartPlotOptions({
    ColumnPlotOptions column,
    PiePlotOptions pie,
    LinePlotOptions line,
    AreaPlotOptions area,
    SeriesPlotOptions series});
}

extension type ChartAccessibility._(JSObject _) implements JSObject {
  
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

extension type ChartAccessibilityPoint._(JSObject _) implements JSObject {

  external String get dateFormat;
  external set dateFormat(String v);

  external JSFunction get dateFormatter;
  external set dateFormatter(JSFunction v);

  external JSFunction get descriptionFormatter;
  external set descriptionFormatter(JSFunction v);

  external num get valueDecimals;
  external set valueDecimals(num v);

  external String get valueDescriptionFormat;
  external set valueDescriptionFormat(String v);

  external String get valuePrefix;
  external set valuePrefix(String v);

  external String get valueSuffix;
  external set valueSuffix(String v);


  external factory ChartAccessibilityPoint({
    String? dateFormat, JSFunction? dateFormatter, JSFunction? descriptionFormatter,
    num? valueDecimals, String? valueDescriptionFormat,
    String? valuePrefix, String? valueSuffix});
}

extension type PlotOptions._(JSObject _) implements JSObject {
  external bool get showCheckbox;
  external set showCheckbox(bool v);

  external EventPlotOptions get events;
  external set events(EventPlotOptions v);
}

extension type PiePlotOptions._(JSObject _) implements PlotOptions, JSObject {

  external String get cursor;
  external set cursor(String v);

  external bool get shadow;
  external set shadow(bool v);

  external bool get showInLegend;
  external set showInLegend(bool v);

  external JSArray<JSAny> get center;
  external set center(JSArray<JSAny> v);

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
    bool shadow, bool showCheckbox,
    bool showInLegend,
    JSArray<JSAny> center,
    JSArray<ChartDataLabels> dataLabels,
    bool allowPointSelect,
    bool ignoreHiddenPoint,
    String fillColor,
    String size, ChartStates states,
    num startAngle, num endAngle,
    String borderColor, num borderWidth,
    JSObject? point,
    EventPlotOptions? events});
}

extension type LinePlotOptionsBase._(JSObject _) implements PlotOptions, JSObject {
  external num get pointStart;
  external set pointStart(num v);

  external num get pointInterval;
  external set pointInterval(num v);

  external String get pointIntervalUnit;
  external set pointIntervalUnit(String v);

  external JSAny get pointPlacement;
  external set pointPlacement(JSAny v);

  external ChartMarker get marker;
  external set marker(ChartMarker v);

  external String get stacking;
  external set stacking(String v);

  external num get lineWidth;
  external set lineWidth(num v);
}

extension type SeriesPlotOptions._(JSObject _) implements LinePlotOptionsBase, JSObject {
  external factory SeriesPlotOptions({
    num pointStart, num pointInterval, bool showCheckbox,
    String pointIntervalUnit, JSAny pointPlacement,
    ChartMarker marker, String? stacking, 
    ChartLabels? label,
    JSArray<ChartDataLabels> dataLabels,
    num lineWidth, EventPlotOptions events});
}

extension type LinePlotOptions._(JSObject _) implements LinePlotOptionsBase, JSObject {
  external factory LinePlotOptions({
    num pointStart, num pointInterval, bool showCheckbox,
    String pointIntervalUnit, JSAny pointPlacement,
    ChartMarker marker, String? stacking, 
    JSArray<ChartDataLabels> dataLabels,
    num lineWidth, EventPlotOptions events});
}

extension type AreaPlotOptions._(JSObject _) implements LinePlotOptionsBase, JSObject {

  external String get lineColor;
  external set lineColor(String v);

  external factory AreaPlotOptions({
    num pointStart, num pointInterval, bool showCheckbox,
    String pointIntervalUnit, JSAny pointPlacement,
    ChartMarker marker, String? stacking, 
    JSArray<ChartDataLabels> dataLabels,
    num lineWidth, String lineColor, EventPlotOptions events});
}

extension type ColumnPlotOptions._(JSObject _) implements PlotOptions, JSObject {

  external num get pointPadding;
  external set pointPadding(num v);

  external num get groupPadding;
  external set groupPadding(num v);

  external num get borderWidth;
  external set borderWidth(num v);

  external String get stacking;
  external set stacking(String v);

  external factory ColumnPlotOptions({
    bool showCheckbox, ChartDataLabels dataLabels,
    num pointPadding, num groupPadding, num borderWidth,
    String? stacking, EventPlotOptions events});
}

extension type EventPlotOptions._(JSObject _) implements JSObject {
  external JSFunction get afterAnimate;
  external set afterAnimate(JSFunction v);

  external JSFunction get show;
  external set show(JSFunction v);

  external JSFunction get hide;
  external set hide(JSFunction v);

  external JSFunction get click;
  external set click(JSFunction v);

  external JSFunction get checkboxClick;
  external set checkboxClick(JSFunction v);

  external JSFunction get legendItemClick;
  external set legendItemClick(JSFunction v);

  external JSFunction get mouseOver;
  external set mouseOver(JSFunction v);

  external JSFunction get mouseOut;
  external set mouseOut(JSFunction v);

  external factory EventPlotOptions({JSFunction afterAnimate,
    JSFunction show, JSFunction hide, JSFunction click,
    JSFunction checkboxClick, JSFunction legendItemClick,
    JSFunction mouseOver, JSFunction mouseOut});
}

extension type ChartMarker._(JSObject _) implements JSObject {

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

extension type ChartStates._(JSObject _) implements JSObject {

  external ChartHover get hover;
  external set hover(ChartHover v);

  external String get symbol;
  external set symbol(String v);

  external factory ChartStates({
    ChartHover hover, String symbol});
}

extension type ChartHover._(JSObject _) implements JSObject {

  external bool get enabled;
  external set enabled(bool v);

  external num get brightness;
  external set brightness(num v);

  external ChartHalo get halo;
  external set halo(ChartHalo v);  

  external factory ChartHover({bool enabled, num brightness, ChartHalo halo});
}

extension type ChartHalo._(JSObject _) implements JSObject {
  external factory ChartHalo();
}

extension type ChartLabels._(JSObject _) implements _ChartLabels, JSObject {

  external num get step;
  external set step(num step);

  external factory ChartLabels({JSFunction formatter, 
    JSArray<JSNumber>? autoRotation,
    bool? reserveSpace,
    bool useHTML,
    DOMStringMap? style, num step, bool enabled});
}

extension type _ChartLabels._(JSObject _) implements JSObject {
  external bool get enabled;
  external set enabled(bool v);

  external JSFunction get formatter;
  external set formatter(JSFunction v);

  external bool get useHTML;
  external set useHTML(bool v);

  external DOMStringMap get style;
  external set style(DOMStringMap v);
}


extension type ChartDataLabels._(JSObject _) implements _ChartLabels, JSObject {
  external String get color;
  external set color(String v);

  external JSAny? get distance;
  external set distance(JSAny? v);
  

  external factory ChartDataLabels({
    String? color, bool? enabled,
    bool useHTML,
    DOMStringMap? style,
    String? format, JSAny? distance,
    JSFunction? formatter});

}

extension type ChartDataSetsBase._(JSObject _) implements JSObject {
  external String? get name;
  external set name(String? v);

  external String get color;
  external set color(String v);

  external num get y;
  external set y(num v);

  external bool get visible;
  external set visible(bool v);
}

extension type ChartDataSets._(JSObject _) implements ChartDataSetsBase, JSObject {
  external String get stack;
  external set stack(String v);

  external String get size;
  external set size(String v);

  external String get innerSize;
  external set innerSize(String v);

  external num get startAngle;
  external set startAngle(num v);

  external num get endAngle;
  external set endAngle(num v);

  external num get borderRadius;
  external set borderRadius(num v);

  external num get borderWidth;
  external set borderWidth(num v);

  external bool get colorByPoint;
  external set colorByPoint(bool v);

  external bool get showInLegend;
  external set showInLegend(bool v);

  external ChartDataLabels get dataLabels;
  external set dataLabels(ChartDataLabels v);

  external JSArray<JSAny> get data;
  external set data(JSArray<JSAny> v);

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
    bool? visible, bool? colorByPoint, bool? showInLegend,
    num? startAngle, num? endAngle,
    num? borderRadius, num? borderWidth, String? stack,
    ChartLabels? label,
    ChartDataLabels? dataLabels,
    JSArray<JSAny>? data, ChartMarker? marker,
    num? fillOpacity, num? lineWidth, String? lineColor});
}

extension type ChartInnerDataSets._(JSObject _) implements ChartDataSetsBase, JSObject {
  external bool get sliced;
  external set sliced(bool v);

  external bool get selected;
  external set selected(bool v);

  external factory ChartInnerDataSets({
    String name, num? y, String? color,
    int? legendIndex,
    bool? visible, bool? sliced, bool? selected});
}

extension type ChartSeries._(JSObject _) implements JSObject {
  external String get name;
  external set name(String v);

  external String get type;

  external int get index;

  external bool get visible;

  external bool get selected;

  external JSArray<ChartPoint> get data;

  external JSArray<ChartPoint> get points;

  external void setVisible(bool visible, bool redraw);

  external void show();
  external void hide();

  external void update();
  external void remove();

  external factory ChartSeries({
    String name});
}

extension type ChartPoint._(JSObject _) implements JSObject {
  external String get category;
  external int get index;
  external String get name;
  external String get color;
  external int get plotX;
  external int get plotY;
  external bool get selected;
  external ChartSeries series;
  external bool get visible;
  external int get x;
  external num get y;
  external num get total;
  external num get percentage;
  external JSObject get legendGroup;
  external JSObject get legendItem;
  external JSObject get legendSymbol;

  external void update(num yValue, bool? redraw, bool? animation);
  external void remove();
  external void select(bool selected, bool accumulate);
  external void setState(String state, bool move);
  external void tooltipFormatter(String context);
}