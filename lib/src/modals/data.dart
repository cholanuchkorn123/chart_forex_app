import 'package:chart_projects/src/modals/platfrom.dart';
import 'package:chart_projects/src/modals/quote.dart';

class Data {
  Data({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    this.platform,
    required this.cmcRank,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.tvlRatio,
    required this.lastUpdated,
    required this.quote,
  });

  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int numMarketPairs;
  final DateTime dateAdded;
  final List<String> tags;
  final int? maxSupply;
  final double circulatingSupply;
  final double totalSupply;
  final Platform? platform;
  final int cmcRank;
  final double? selfReportedCirculatingSupply;
  final double? selfReportedMarketCap;
  final double? tvlRatio;
  final DateTime lastUpdated;
  final Quote quote;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      name: json["name"],
      symbol: json["symbol"],
      slug: json["slug"],
      numMarketPairs: json["num_market_pairs"],
      dateAdded: DateTime.parse(json["date_added"]),
      tags: List<String>.from(json["tags"].map((x) => x)),
      maxSupply: json["max_supply"],
      circulatingSupply: json["circulating_supply"]?.toDouble(),
      totalSupply: json["total_supply"]?.toDouble(),
      platform:
          json["platform"] == null ? null : Platform.fromJson(json["platform"]),
      cmcRank: json["cmc_rank"],
      selfReportedCirculatingSupply:
          json["self_reported_circulating_supply"]?.toDouble(),
      selfReportedMarketCap: json["self_reported_market_cap"]?.toDouble(),
      tvlRatio: json["tvl_ratio"]?.toDouble(),
      lastUpdated: DateTime.parse(json["last_updated"]),
      quote: Quote.fromJson(json["quote"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "num_market_pairs": numMarketPairs,
        "date_added": dateAdded.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "platform": platform?.toJson(),
        "cmc_rank": cmcRank,
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_market_cap": selfReportedMarketCap,
        "tvl_ratio": tvlRatio,
        "last_updated": lastUpdated.toIso8601String(),
        "quote": quote.toJson(),
      };
}
