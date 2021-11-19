//Copyright (C) 2016 Potix Corporation. All Rights Reserved.
//History: Tue Feb 17 2:36 PM CST 2017
// Author: jimmy
library highcharts.src.chart_model;

enum SeriesStyle { 
  name, color, colorByPoint, borderRadius, fillOpacity,
  size, innerSize, lineColor, dataLabels, sliced, selected,
  markerLineColor, markerSymbol, markerFillColor, markerLineWidth // marker
}

abstract class ChartModel<S extends Comparable, C extends Comparable> {

  /**
   * Get all series as a collection.
   */
  List<S> get series;

  /**
   * Get categories of a specified series as a collection.
   */
  List<C> get categories;

  // Returns value of provided [series] style
  dynamic getSeriesStyle(S series, SeriesStyle name);
  // Sets value of provided [series] style
  void setSeriesStyle(S series, SeriesStyle name, dynamic value);

  /**
   * Clear all data
   */
  void clear();
}

abstract class AbstractChartModel<S extends Comparable, C extends Comparable> extends ChartModel<S, C> {
  final _seriesStyle = <S, Map<SeriesStyle, dynamic>>{};

  @override
  dynamic getSeriesStyle(S series, SeriesStyle name) {
    return _seriesStyle[series]?[name];
  }

  @override
  void setSeriesStyle(S series, SeriesStyle name, dynamic value) {
    final kv = _seriesStyle[series] ?? <SeriesStyle, dynamic>{};
    kv[name] = value;
    _seriesStyle[series] = kv;
  }

  /**
   * Clear all data
   */
  @override
  void clear() {
    _seriesStyle.clear();
  }
}

abstract class SingleValueCategoryModel<S extends Comparable, C extends Comparable> extends ChartModel<S, C> {
  static String DEFAULT_SERIES = 'ds';

  /**
   * Get categories as a collection.
   */
  @override
  List<C> get categories;

  /**
   * Get value of the specified category.
   * [category] the pie category.
   */
  num? getValue(C category);

  /**
   * add or update the value of a specified category.
   * [category] the pie category.
   * [value] the pie value.
   */
  void setValue(C category, num? value);

  // Returns color of [category] style
  String? getValueColor(C category);

  // Sets color
  void setValueColor(C category, String color);

  // Returns value of [category] style
  dynamic getValueStyle(C category, SeriesStyle name);

  // Sets color
  void setValueStyle(C category, SeriesStyle name, dynamic value);

  // Returns value of [series] style
  dynamic getSingleSeriesStyle(SeriesStyle name);

  // Sets value of [series] style
  void setSingleSeriesStyle(SeriesStyle name, dynamic value);
}

class DefaultSingleValueCategoryModel<C extends Comparable> extends AbstractChartModel<String, C> implements SingleValueCategoryModel<String, C> {
  final _data = <C, num?>{};
  final _color = <C, String>{};
  final _categoryStyle = <C, Map<SeriesStyle, dynamic>>{};

  /**
   * Get all series as a collection.
   */
  @override
  List<String> get series {
    return <String>[];
  }

  /**
   * Get categories as a collection.
   */
  @override
  List<C> get categories => _data.keys.toList();

  /**
   * Get value of the specified category.
   * [category] the pie category.
   */
  @override
  num? getValue(C category) => _data[category];

  /**
   * add or update the value of a specified category.
   * [category] the pie category.
   * [value] the pie value.
   */
  @override
  void setValue(C category, num? value) {
    _data[category] = value;
  }

  // Sets color
  @override
  String? getValueColor(C category) => _color[category];

  // Sets color of provided [series]
  @override
  void setValueColor(C category, String color) {
    _color[category] = color;
  }

  @override
  dynamic getValueStyle(C category, SeriesStyle name) {
    return _categoryStyle[category]?[name];
  }

  @override
  void setValueStyle(C category, SeriesStyle name, dynamic value) {
    final kv = _categoryStyle[category] ?? <SeriesStyle, dynamic>{};
    kv[name] = value;
    _categoryStyle[category] = kv;
  }

  /**
   * Clear all data
   */
  @override
  void clear() {
    super.clear();

    _data.clear();
    _color.clear();
    _categoryStyle.clear();
  }

  @override
  dynamic getSingleSeriesStyle(SeriesStyle name) {
    return super.getSeriesStyle(SingleValueCategoryModel.DEFAULT_SERIES, name);
  }

  @override
  void setSingleSeriesStyle(SeriesStyle name, dynamic value) {
    return super.setSeriesStyle(SingleValueCategoryModel.DEFAULT_SERIES, name, value);
  }

  // Returns value of marker of provided [series]
  @override
  dynamic getSeriesStyle(String series, SeriesStyle name) {
    assert(false, "shouldn't call this methid, use [getSingleSeriesStyle] instead.");
    return null;
  }
  // Sets value of marker of provided [series]
  @override
  void setSeriesStyle(String series, SeriesStyle name, dynamic value) {
    assert(false, "shouldn't call this methid, use [getSingleSeriesStyle] instead.");
  }
}

abstract class DonutModel<S extends Comparable, C extends Comparable> extends AbstractChartModel<S, C> {


  /**
   * Get (series) pairs of this chart data model. The returned
   */
  List<S> get keys;

  /**
   * Get value of the specified categoryModel
   */
  SingleValueCategoryModel<S, C>? getValue(S series);

  void addSeries(S series, SingleValueCategoryModel<S, C> model, {
    String size, String innerSize});
}

class DefaultDonutModel<S extends Comparable, C extends Comparable> extends DonutModel<S, C> {
  final _data = <S, SingleValueCategoryModel<S, C>>{};

  @override
  List<S> get keys => _data.keys.toList();

  @override
  SingleValueCategoryModel<S, C>? getValue(S series) => _data[series];

  @override
  void addSeries(S series, SingleValueCategoryModel<S, C> model, {
    String? size, String? innerSize}) {
    _data[series] = model;

    setSeriesStyle(series, SeriesStyle.size, size);
    setSeriesStyle(series, SeriesStyle.innerSize, innerSize);
  }

  @override
  List<S> get series => _data.keys.toList();

  @override
  List<C> get categories => <C>[];

  @override
  void clear() {
    super.clear();

    _data.clear();
  }
}

abstract class CategoryModel<S extends Comparable, C extends Comparable> extends ChartModel<S, C> {

  /**
   * Get (series, category) pairs of this chart data model. The returned
   * value is a collection of List where list[0] is the
   * series, list[1] is the category, in the order the [setValue] is
   * called.
   */
  List<List> get keys;

  /**
   * Get value of the specified series and category.
   * [series] - the series
   * [category] -  the category.
   */
  num? getValue(S series, C category);

  /**
   * add or update the value of a specified series and category.
   * [series] - the series
   * [category] -  the category.
   * [value] - the value
   */
  void setValue(S series, C category, num value);

}

class DefaultCategoryModel<S extends Comparable, C extends Comparable>
    extends AbstractChartModel<S, C> implements CategoryModel<S, C> {

  final _data = <S, Map<C, num?>>{};

  List<C>? _categories;

  @override
  List<List> get keys {
    final list = <List>[];
    for (final series in series) {
      for (final category in categories) {
        list.add([series, category]);
      }
    }

    return list;
  }

  @override
  List<S> get series => _data.keys.toList();

  @override
  List<C> get categories {
    if (_categories != null)
      return _categories!;

    if (_data.isEmpty)
      return const [];

    //merge all categories
    final list = <C>[];
    for (final series in series) {
      final categoryData = _data[series];
      if (categoryData == null)
        continue;

      final categories = categoryData.keys.toList();
      if (list.isEmpty) {
        list.addAll(categories);
        continue;
      }

      while (categories.isNotEmpty) {
        final cate = categories.cast<C?>().firstWhere(list.contains, orElse: () => null);
        var i = cate != null ? categories.indexOf(cate): -1;
        categories.removeAt(i);
        while (i > 0) {
          list.add(categories.removeAt(0));
          i--;
        }
      }
    }

    return _categories = list;
  }



  @override
  num? getValue(S series, C category) {
    return _data[series]?[category];
  }

  @override
  void setValue(S series, C category, num ?value) {
    final map = _data[series] ?? <C, num?>{};
    map[category] = value;
    _data[series] = map;

    _categories = null;//clear cache
  }


  @override
  void clear() {
    super.clear();

    _data.clear();
    _categories = null;//clear cache
  }
}