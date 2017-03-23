//Copyright (C) 2016 Potix Corporation. All Rights Reserved.
//History: Tue Feb 17 2:36 PM CST 2017
// Author: jimmy
library highcharts.src.chart_model;

import 'dart:collection' show LinkedHashMap;

abstract class ChartModel<S extends Comparable, C extends Comparable> {

  /**
   * Get all series as a collection.
   */
  List<S> get series;

  /**
   * Get categories of a specified series as a collection.
   */
  List<C> get categories;

  /**
   * Clear all data
   */
  void clear();
}

abstract class SingleValueCategoryModel extends ChartModel {

  /**
   * Get categories as a collection.
   */
  List<String> get categories;

  /**
   * Get value of the specified category.
   * [category] the pie category.
   */
  num getValue(String category);

  /**
   * add or update the value of a specified category.
   * [category] the pie category.
   * [value] the pie value.
   */
  void setValue(String category, num value);

  // Sets color of provided [series]
  void setValueColor(String category, String color);

}

abstract class PieModel extends SingleValueCategoryModel {

}

abstract class DonutModel extends ChartModel {

  void addSerie(String series, SingleValueCategoryModel model, {
    String size, String innerSize});

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

  // Returns color of provided [series]
  String getSeriesColor(S series);

  // Sets color of provided [series]
  void setSeriesColor(S series, String color);

}

class DefaultCategoryModel<S extends Comparable, C extends Comparable> implements CategoryModel<S, C> {

  var _data = new LinkedHashMap<S, Map<C, num>>();
  var _color = <S, String>{};

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
    Map<C, num> map = _data[series] ?? new LinkedHashMap<C, num>();
    map[category] = value;
    _data[series] = map;

    _categories = null;//clear cache
  }

  @override
  String getSeriesColor(S series)
    => _color[series];

  @override
  void setSeriesColor(S series, String color) {
    _color[series] = color;
  }

  @override
  void clear() {
    _data.clear();
    _color.clear();
    _categories = null;//clear cache
  }
}