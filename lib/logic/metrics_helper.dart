class CurrencyHelper {
  double convertTo(double amount, String? fromMetric, String? toMetric) {
    if (fromMetric == "cm") {
      double converted;
      if (toMetric == 'm') {
        converted = amount * 0.01;
      } else if (toMetric == 'km') {
        converted = amount * 0.00001;
      } else {
        converted = amount;
      }
      return converted;
    }

    if (fromMetric == "m") {
      double converted;
      if (toMetric == 'cm') {
        converted = amount * 100;
      } else if (toMetric == 'km') {
        converted = amount * 0.001;
      } else {
        converted = amount;
      }
      return converted;
    }

    if (fromMetric == "km") {
      double converted;
      if (toMetric == 'cm') {
        converted = amount * 100000;
      } else if (toMetric == 'm') {
        converted = amount * 1000;
      } else {
        converted = amount;
      }
      return converted;
    }

    return amount;
  }
}
