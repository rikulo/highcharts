//Copyright (C) 2016 Potix Corporation. All Rights Reserved.
//History: Tue Feb 17 2:36 PM CST 2017
// Author: jimmy
library highcharts.src.chart_model;

enum SeriesStyle { 
  color, borderRadius, fillOpacity, size, innerSize, 
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

  // Returns vlaue of provided [series] style
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

  // Returns vlaue of marker of provided [series]
  @override
  dynamic getSeriesStyle(S series, SeriesStyle name) {
    final kv = _seriesStyle[series];
    return kv != null ? kv[name] : null;
  }
  // Sets value of marker of provided [series]
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

abstract class SingleValueCategoryModel<C extends Comparable> extends AbstractChartModel<String, C> {

  /**
   * Get categories as a collection.
   */
  List<C> get categories;

  /**
   * Get value of the specified category.
   * [category] the pie category.
   */
  num getValue(C category);

  /**
   * add or update the value of a specified category.
   * [category] the pie category.
   * [value] the pie value.
   */
  void setValue(C category, num value);

  // Sets color
  String getValueColor(C category);

  // Sets color
  void setValueColor(C category, String color);

}

class DefaultSingleValueCategoryModel<C extends Comparable> extends SingleValueCategoryModel<C> {
  final _data = <C, num>{};
  final _color = <C, String>{};

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
  num getValue(C category) => _data[category];

  /**
   * add or update the value of a specified category.
   * [category] the pie category.
   * [value] the pie value.
   */
  @override
  void setValue(C category, num value) {
    _data[category] = value;
  }

  // Sets color
  @override
  String getValueColor(C category) => _color[category];

  // Sets color of provided [series]
  @override
  void setValueColor(C category, String color) {
    _color[category] = color;
  }

  /**
   * Clear all data
   */
  @override
  void clear() {
    super.clear();

    _data.clear();
    _color.clear();
  }
}

abstract class PieModel extends SingleValueCategoryModel {

}

abstract class DonutModel<S extends Comparable, C extends Comparable> extends AbstractChartModel<S, C> {


  /**
   * Get (series) pairs of this chart data model. The returned
   */
  List<S> get keys;

  /**
   * Get value of the specified categoryModel
   */
  SingleValueCategoryModel<C> getValue(S series);

  void addSeries(S series, SingleValueCategoryModel<C> model, {
    String size, String innerSize});
}

class DefaultDonutModel<S extends Comparable, C extends Comparable> extends DonutModel<S, C> {
  final _data = <S, SingleValueCategoryModel<C>>{};

  /**
   * Get (series) pairs of this chart data model. The returned
   */
  List<S> get keys => _data.keys.toList();

  /**
   * Get value of the specified categoryModel
   */
  SingleValueCategoryModel<C> getValue(S series) => _data[series];

  @override
  void addSeries(S series, SingleValueCategoryModel<C> model, {
    String size, String innerSize}) {
    _data[series] = model;

    setSeriesStyle(series, SeriesStyle.size, size);
    setSeriesStyle(series, SeriesStyle.innerSize, innerSize);
  }

  /**
   * Get all series as a collection.
   */
  List<S> get series {
    return _data.keys;
  }

  /**
   * Get categories as a collection.
   */
  List<C> get categories => <C>[];

  /**
   * Clear all data
   */
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
  num getValue(S series, C category);

  /**
   * add or update the value of a specified series and category.
   * [series] - the series
   * [category] -  the category.
   * [value] - the value
   */
  void setValue(S series, C category, num value);
}

class DefaultCategoryModel<S extends Comparable, C extends Comparable> extends AbstractChartModel<S, C> implements CategoryModel<S, C> {

  var _data = <S, Map<C, num>>{};

  @override
  List<List> get keys {
    var list = <List>[];
    for (S series in series) {
      for (C category in categories) {
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
      return _categories;

    //merge all categories
    var list = <C>[];
    for (S series in series) {
      List<C> categories = _data[series].keys.toList();
      if (list.isEmpty) {
        list.addAll(categories);
        continue;
      }

      while (categories.isNotEmpty) {
        C cate = categories.firstWhere(list.contains, orElse: () => null);
        int i = categories.indexOf(cate);
        categories.removeAt(i);
        while (i > 0) {
          list.add(categories.removeAt(0));
          i--;
        }
      }
    }

    return _categories = list;
  }

  List<C> _categories;

  @override
  num getValue(S series, C category) {
    return _data[series][category];
  }

  @override
  void setValue(S series, C category, num value) {
    Map<C, num> map = _data[series] ?? <C, num>{};
    map[category] = value;
    _data[series] = map;

    _categories = null;//clear cache
  }

  @override
  void clear() {
    super.clear();
    
    _seriesStyle.clear();

    _categories = null;//clear cache
  }
}