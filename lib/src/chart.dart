//Copyright (C) 2016 Potix Corporation. All Rights Reserved.
//History: Tue Feb 17 10:10 AM CST 2017
// Author: jimmy
library highcharts.src.chart;

import 'dart:html';
import 'dart:js' show JsObject;
import "package:js/js.dart" show allowInteropCaptureThis;

import 'chart_model.dart';
import 'highcharts_js.dart';

abstract class ChartType {
  static final String column = 'column';
  static final String pie = 'pie';
  static final String area = 'area';
  static final String line = 'line';
}

abstract class Chart<S extends Comparable, C extends Comparable, T extends ChartModel<S, C>> {

  Element get element;

  /**
   * Returns model
   */
  T get model;

  /**
   * Sets model
   */
  void set model(T model);

  /**
   * Returns title of chart
   */
  ChartTitle get title;
  /**
   * Sets title of chart
   */
  void set title(ChartTitle title);

  /**
   * Returns subtitle of chart
   */
  ChartTitle get subtitle;
  /**
   * Sets subtitle of chart
   */
  void set subtitle(ChartTitle subtitle);

  /**
   * Returns xAxis of chart
   */
  ChartXAxis get xAxis;
  /**
   * Sets xAxis of chart
   */
  void set xAxis(ChartXAxis xAxis);

  /**
   * Returns yAxis of chart
   */
  ChartYAxis get yAxis;
  /**
   * Sets yAxis of chart
   */
  void set yAxis(ChartYAxis yAxis);

  /**
   * Returns width of chart
   */
  dynamic get width;
  /**
   * Sets width of chart
   */
  void set width(dynamic width);

  /**
   * Returns height of chart
   */
  dynamic get height;
  /**
   * Sets height of chart
   */
  void set height(dynamic height);

  /**
   * Returns chartOptions of chart
   */
  ChartOptions get chartOptions;
  /**
   * Sets the chartOptions of chart
   */
  void set chartOptions(ChartOptions options);

  /**
   * Returns plotOptions of chart
   */
  ChartPlotOptions get plotOptions;
  /**
   * Sets plotOptions of chart
   */
  void set plotOptions(ChartPlotOptions plotOptions);

  /**
   * Returns legend of chart
   */
  ChartLegend get legend;
  /**
   * Sets legend of chart
   */
  void set legend(ChartLegend legend);

  /**
   * Returns tooltip of chart
   */
  ChartTooltip get tooltip;

  /**
   * Sets tooltip of chart
   */
  void set tooltip(ChartTooltip tooltip);

  /**
   * Render chart with chart model
   */
  void render();

  /**
   * update chart's data and redraw
   */
  void update();

  /**
   * Reflows the chart to its container.
   * By default, the chart reflows automatically to
   * its container following a window.resize event,
   * as per the chart.reflow option. However, there are no reliable events for div resize,
   * so if the container is resized without a window resize event,
   * this must be called explicitly.
   */
  void reflow();

  /**
   * Resize the chart to a given width and height.
   * In order to set the width only, the height argument may be skipped.
   * To set the height only, pass undefined for the width.
   */
  void setSize([num width, num height, AnimationOptions animation]);
}

abstract class ColumnChart<S extends Comparable, C extends Comparable> implements Chart<S, C, CategoryModel<S, C>> {
  factory ColumnChart({String titleText: '', String subtitleText: '',
    dynamic width, dynamic height, ChartXAxis xAxis, ChartYAxis yAxis})
    => new _ColumnChartImpl<S, C>(titleText: titleText, subtitleText: subtitleText,
        width: width, height: height, xAxis: xAxis, yAxis: yAxis);
}

abstract class PieChart<S extends Comparable, C extends Comparable> extends Chart<S, C, SingleValueCategoryModel<S, C>> {
  factory PieChart({String titleText: '', String subtitleText: '',
  dynamic width, dynamic height, ChartXAxis xAxis, ChartYAxis yAxis})
  => new _PieChartImpl<S, C>(titleText: titleText, subtitleText: subtitleText,
      width: width, height: height, xAxis: xAxis, yAxis: yAxis);
}

abstract class DonutChart<S extends Comparable, C extends Comparable> extends Chart<S, C, DonutModel<S, C>> {
  factory DonutChart({String titleText: '', String subtitleText: '',
  dynamic width, dynamic height, ChartXAxis xAxis, ChartYAxis yAxis})
  => new _DonutChartImpl<S, C>(titleText: titleText, subtitleText: subtitleText,
      width: width, height: height, xAxis: xAxis, yAxis: yAxis);
}

abstract class AreaChart<S extends Comparable, C extends Comparable> extends Chart<S, C, CategoryModel<S, C>> {
  factory AreaChart({String titleText: '', String subtitleText: '',
  dynamic width, dynamic height, ChartXAxis xAxis, ChartYAxis yAxis})
  => new _AreaChartImpl<S, C>(titleText: titleText, subtitleText: subtitleText,
      width: width, height: height, xAxis: xAxis, yAxis: yAxis);
}

abstract class _BaseChartImpl<S extends Comparable, C extends Comparable, T extends ChartModel<S, C>> implements Chart<S, C, T> {

  final String type;
  @override
  final Element element = _createUncheckedHtml('<div class="highchart-wrap"></div>');

  _BaseChartImpl(this.type, {String titleText: '', String subtitleText: '',
      dynamic width, dynamic height, ChartXAxis xAxis, ChartYAxis yAxis}):
    this._titleText = titleText,
    this._subtitleText = subtitleText,
    this._width = width,
    this._height = height,
    this._xAxis = xAxis,
    this._yAxis = yAxis;

  dynamic _width, _height;

  String _titleText, _subtitleText;

  ChartTitle _title, _subtitle;

  ChartXAxis _xAxis;
  ChartYAxis _yAxis;
  ChartOptions _chartOptions;
  ChartPlotOptions _plotOptions;
  ChartLegend _legend;
  ChartTooltip _tooltip;

  HighChart _chart;
  T _model;

  @override
  dynamic get width => _width;
  @override
  void set width(dynamic width) {
    _width = width;
  }

  @override
  dynamic get height => _height;
  @override
  void set height(dynamic height) {
    _height = height;
  }

  @override
  ChartTitle get title => _title;
  @override
  void set title(ChartTitle title) {
    _title = title;
  }

  @override
  ChartTitle get subtitle => _subtitle;
  @override
  void set subtitle(ChartTitle subtitle) {
    _subtitle = subtitle;
  }

  @override
  ChartXAxis get xAxis => _xAxis;
  @override
  void set xAxis(ChartXAxis xAxis) {
    this._xAxis = xAxis;
  }

  @override
  ChartYAxis get yAxis => _yAxis;
  @override
  void set yAxis(ChartYAxis yAxis) {
    this._yAxis = yAxis;
  }

  @override
  ChartPlotOptions get plotOptions => _plotOptions;
  @override
  void set plotOptions(ChartPlotOptions plotOptions) {
    _plotOptions = plotOptions;
  }

  ChartOptions get _defaultChartOptions
  => new ChartOptions(type: type, width: width, height: height);

  @override
  ChartOptions get chartOptions => _chartOptions ?? _defaultChartOptions;
  @override
  void set chartOptions(ChartOptions options) {
    _chartOptions = options;
  }

  @override
  ChartLegend get legend => _legend;
  @override
  void set legend(ChartLegend legend) {
    _legend = legend;
  }

  @override
  ChartTooltip get tooltip => _tooltip;
  @override
  void set tooltip(ChartTooltip tooltip) {
    this._tooltip = tooltip;
  }

  ChartConfiguration get _chartConfig {
    return new ChartConfiguration(
      chart: chartOptions,
      title: new ChartTitle(text: _titleText),
      subtitle: new ChartTitle(text: _subtitleText),
      xAxis: xAxis, yAxis: yAxis,
      credits: new ChartCredits(enabled: false),
      series: series);
  }

  List<ChartDataSets> get series;

  @override
  T get model => _model;
  @override
  void set model(T model) {
    if (model is! T)
      return;

    _model = model;
    render();
  }

  @override
  void render() {
    if (_model == null)
      return;

    if (_chart == null)
      _initChart();

  }

  void _initChart() {
    ChartConfiguration config = _chartConfig;

    if (tooltip != null)
      config.tooltip = tooltip;

    if (legend != null)
      config.legend = legend;

    if (plotOptions != null)
      config.plotOptions = plotOptions;

    _chart = new HighChart(element, config);
  }

  @override
  void update() {
    _chart?.update(_chartConfig, true);
  }

  @override
  void reflow() {
    _chart?.reflow();
  }

  @override
  void setSize([num width, num height, AnimationOptions animation]) {
    _chart?.setSize(width, height, animation);
  }
}

class _ColumnChartImpl<S extends Comparable, C extends Comparable> extends _BaseChartImpl<S, C, CategoryModel<S, C>> implements ColumnChart<S, C> {

  _ColumnChartImpl({String titleText, String subtitleText,
    dynamic width, dynamic height, ChartXAxis xAxis, ChartYAxis yAxis}):
  super(ChartType.column, titleText: titleText, subtitleText: subtitleText,
    width: width, height: height, xAxis: xAxis, yAxis: yAxis);

  @override
  List<ChartDataSets> get series {
    final list = <ChartDataSets>[];
    final data = <S, List<int>>{};

    for (List entry in model.keys) {
      final series = entry[0], category = entry[1];
      final values = data[series] ?? <int>[];
      values.add(model.getValue(series, category));
      data[series] = values;
    }

    for (S series in data.keys)
      list.add(new ChartDataSets(
        name: series.toString(),
        color: model.getSeriesStyle(series, SeriesStyle.color),
        borderRadius: model.getSeriesStyle(series, SeriesStyle.borderRadius),
        fillOpacity: model.getSeriesStyle(series, SeriesStyle.fillOpacity),
        data: data[series]));

    return list;
  }

}

class _PieChartImpl<S extends Comparable, C extends Comparable> extends _BaseChartImpl<S, C, SingleValueCategoryModel<S, C>> implements PieChart<S, C> {

  _PieChartImpl({String titleText, String subtitleText,
    dynamic width, dynamic height, ChartXAxis xAxis, ChartYAxis yAxis}):
  super(ChartType.pie, titleText: titleText, subtitleText: subtitleText,
    width: width, height: height, xAxis: xAxis, yAxis: yAxis) {
  }

  @override
  List<ChartDataSets> get series {
    final singleCategoryModel = model;
    final seriesData = <ChartInnerDataSets>[];

    for (final category in singleCategoryModel.categories) {
      seriesData.add(new ChartInnerDataSets(
        name: category.toString(),
        y: singleCategoryModel.getValue(category),
        color: singleCategoryModel.getValueColor(category)));
    }

    return [new ChartDataSets(
      innerSize: model.getSingleSeriesStyle(SeriesStyle.innerSize),
      data: seriesData
    )];
  }
}

class _DonutChartImpl<S extends Comparable, C extends Comparable> extends _BaseChartImpl<S, C, DonutModel<S, C>> implements DonutChart<S, C> {

  _DonutChartImpl({String titleText, String subtitleText,
    dynamic width, dynamic height, ChartXAxis xAxis, ChartYAxis yAxis}):
  super(ChartType.pie, titleText: titleText, subtitleText: subtitleText,
    width: width, height: height, xAxis: xAxis, yAxis: yAxis);

  @override
  List<ChartDataSets> get series {
    final seriesDatas = <ChartDataSets>[];

    for (final key in model.keys) {
      final singleCategoryModel = model.getValue(key);
      final seriesData = <ChartInnerDataSets>[];

      for (final category in singleCategoryModel.categories) {
        seriesData.add(new ChartInnerDataSets(
          name: category.toString(),
          y: singleCategoryModel.getValue(category),
          color: singleCategoryModel.getValueColor(category),
          visible: singleCategoryModel.getValueColor(category) != null));
      }

      seriesDatas.add(new ChartDataSets(
        size: model.getSeriesStyle(key, SeriesStyle.size),
        innerSize: model.getSeriesStyle(key, SeriesStyle.innerSize),
        data: seriesData
      ));
    }

    return seriesDatas;
  }
}

class _AreaChartImpl<S extends Comparable, C extends Comparable> extends _BaseChartImpl<S, C, CategoryModel<S, C>> implements AreaChart<S, C> {

  _AreaChartImpl({String titleText, String subtitleText,
    dynamic width, dynamic height, ChartXAxis xAxis, ChartYAxis yAxis}):
  super(ChartType.area, titleText: titleText, subtitleText: subtitleText,
    width: width, height: height, xAxis: xAxis, yAxis: yAxis);

  @override
  List<ChartDataSets> get series {
    final list = <ChartDataSets>[];
    final data = <S, List<int>>{};

    for (List entry in model.keys) {
      final series = entry[0], category = entry[1];
      final values = data[series] ?? <int>[];
      values.add(model.getValue(series, category));
      data[series] = values;
    }

    for (S series in data.keys)
      list.add(new ChartDataSets(
        name: series.toString(),
        color: model.getSeriesStyle(series, SeriesStyle.color),
        fillOpacity: model.getSeriesStyle(series, SeriesStyle.fillOpacity),
        marker: new ChartMarker(
          symbol: model.getSeriesStyle(series, SeriesStyle.markerSymbol),
          fillColor: model.getSeriesStyle(series, SeriesStyle.markerFillColor),
          lineColor: model.getSeriesStyle(series, SeriesStyle.markerLineColor) ?? '#ffffff', // charts default value
          lineWidth: model.getSeriesStyle(series, SeriesStyle.markerLineWidth) ?? 0 // charts default value
        ),
        lineColor: model.getSeriesStyle(series, SeriesStyle.lineColor),
        borderRadius: model.getSeriesStyle(series, SeriesStyle.borderRadius),
        data: data[series]));

    return list;
  }
}
///in dart2js: native js object place in 'o' property
jsProperty(o, String key) => (_toJsObject(o)['o'] ?? _toJsObject(o))[key];
JsObject _toJsObject(o) => new JsObject.fromBrowserObject(o);
//in dart2js: js Date object will be JsObject not DateTime object
DateTime jsDate(o, String key) {
  var val = jsProperty(o, key);

  //dart2js only: do val.toString() for make val['date'] accessable
  if (val is JsObject && val.toString().isNotEmpty)
    val = val['date'];

  return val is DateTime ? val: null;
}

Function jsFunction(Function f) => allowInteropCaptureThis(f);

Element _createUncheckedHtml(String html)
=> new Element.html(html, treeSanitizer: NodeTreeSanitizer.trusted);



/* column chart sample
new HighChart(div, new ChartConfiguration(
    chart: new ChartOptions(type: 'column'),
    title: new ChartTitle(text: 'Monthly Average Rainfall'),
    subtitle: new ChartTitle(text: 'Source: WorldClimate.com'),
    xAxis: new ChartXAxis(categories: [
      'Jan', 'Feb', 'Mar', 'Apr',
      'May', 'Jun', 'Jul', 'Aug',
      'Sep', 'Oct', 'Nov', 'Dec'], crosshair: true),
    yAxis: new ChartYAxis(min: 0, title: new ChartTitle(text: 'Rainfall (mm)')),
    tooltip: new ChartTooltip(
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true),
    plotOptions: new ChartColumn(column: new ColumnOptions(
        pointPadding: 0.2,
        borderWidth: 0)),
    series: [
      new ChartDataSets(name: 'Tokyo',
          data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]),
      new ChartDataSets(name: 'New York',
          data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3])]
));
*/
/* pie chart sample
_chart = new HighChart(div, new ChartConfiguration(
    chart: new ChartOptions(type: 'pie'),
    title: new ChartTitle(text: ''),
    yAxis: new ChartYAxis(title: new ChartTitle(text: 'Proportion')),
    tooltip: new ChartTooltip(valueSuffix: '%'),
    plotOptions: new ChartPlotOptions(
      column: new ColumnOptions(
        pointPadding: 0.2,
        borderWidth: 0) ,
      pie: new PiePlotOptions(
        dataLabels: new ChartDataLabels(enabled: false),
        showInLegend: true)),
    series: [
      new ChartDataSets(name: 'Species', size: '40%',
        data: [
          new ChartDataSets(name: 'Completed', y: 141),
          new ChartDataSets(name: 'In progress', y: 4),
          new ChartDataSets(name: 'To-Do', y: 122)],
        dataLabels: new ChartDataLabels(
          formatter: allowInteropCaptureThis((self ,o) {
            num y = _jsProp(self, 'y');
            return y > 5 ? _jsProp(_jsProp(self, 'point'), 'name'): null;
          }),
          color: 'white',
          distance: -30)),
      new ChartDataSets(name: 'Number', size: '100%', innerSize: '60%',
        data: [
          new ChartDataSets(name: '', y: 141, visible: false),
          new ChartDataSets(name: 'Overdue', y: 21),
          new ChartDataSets(name: 'Today', y: 1),
          new ChartDataSets(name: 'Tomorrow', y: 1),
          new ChartDataSets(name: 'In 5 days', y: 4),
          new ChartDataSets(name: 'Later', y: 99),],
        dataLabels: new ChartDataLabels(formatter: allowInteropCaptureThis((self ,o) {
          num y = _jsProp(self, 'y');
          return y > 1 ? '<b>${_jsProp(_jsProp(self, 'point'), 'name')}</b> $y%': null;
        })), startAngle: 90, endAngle: 360)]
));

_jsProp(o, String key) => JsNative.getProperty(o, key);
*/

/* area chart sample
new HighChart(div, new ChartConfiguration(
    chart: new ChartOptions(type: 'area'),
    title: new ChartTitle(text: 'Area chart with negative values'),
    xAxis: new ChartXAxis(categories: [
      'Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']),
    series: [
      new ChartDataSets(name: 'John',
          data: [5, 3, 4, 7, 2]),
      new ChartDataSets(name: 'Jane',
          data: [2, -2, -3, 2, 1])]
));
*/