import 'package:chart_projects/src/modals/usd.dart';

class Quote {
    Quote({
        required this.usd,
    });

    final Usd usd;

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
    );

    Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
    };
}