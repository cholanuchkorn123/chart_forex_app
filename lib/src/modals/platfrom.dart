import 'enum.dart';

class Platform {
    Platform({
        required this.id,
        required this.name,
        required this.symbol,
        required this.slug,
        required this.tokenAddress,
    });

    final int id;
    final Name name;
    final Symbol symbol;
    final Slug slug;
    final String tokenAddress;

    factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        symbol: symbolValues.map[json["symbol"]]!,
        slug: slugValues.map[json["slug"]]!,
        tokenAddress: json["token_address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "symbol": symbolValues.reverse[symbol],
        "slug": slugValues.reverse[slug],
        "token_address": tokenAddress,
    };
}

enum Name { ETHEREUM, BNB, APTOS, TRON, OPTIMISM, ARBITRUM }

final nameValues = EnumValues({
    "Aptos": Name.APTOS,
    "Arbitrum": Name.ARBITRUM,
    "BNB": Name.BNB,
    "Ethereum": Name.ETHEREUM,
    "Optimism": Name.OPTIMISM,
    "TRON": Name.TRON
});

enum Slug { ETHEREUM, BNB, APTOS, TRON, OPTIMISM_ETHEREUM, ARBITRUM_ETHEREUM }

final slugValues = EnumValues({
    "aptos": Slug.APTOS,
    "arbitrum-ethereum": Slug.ARBITRUM_ETHEREUM,
    "bnb": Slug.BNB,
    "ethereum": Slug.ETHEREUM,
    "optimism-ethereum": Slug.OPTIMISM_ETHEREUM,
    "tron": Slug.TRON
});

enum Symbol { ETH, BNB, APT, TRX, OP, ARBITRUM }

final symbolValues = EnumValues({
    "APT": Symbol.APT,
    "ARBITRUM": Symbol.ARBITRUM,
    "BNB": Symbol.BNB,
    "ETH": Symbol.ETH,
    "OP": Symbol.OP,
    "TRX": Symbol.TRX
});
