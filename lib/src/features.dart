/// See https://unleash.github.io/docs/api/client/features
class Features {
  Features({this.version, this.features, this.variants});

  factory Features.fromJson(Map<String, dynamic> json) {
    var features = <FeatureToggle>[];
    if (json['toggles'] != null) {
      features = <FeatureToggle>[];
      json['toggles'].forEach((dynamic v) {
        features.add(FeatureToggle.fromJson(v as Map));
      });
    }

    return Features(
      version: json['version'] as int?,
      features: features,
    );
  }

  final int? version;
  final List<FeatureToggle>? features;
  final List<Variant>? variants;
}

class FeatureToggle {
  FeatureToggle({
    this.name,
    this.description,
    this.enabled,
    this.strategies,
    this.strategy,
    this.variant,
  });

  factory FeatureToggle.fromJson(Map json) {
    var strategies = <Strategy>[];
    if (json['strategies'] != null) {
      strategies = <Strategy>[];
      json['strategies'].forEach((dynamic v) {
        strategies.add(Strategy.fromJson(v as Map));
      });
    }

    Variant? variant;
    if (json['variant'] != null) {
      variant = Variant.fromJson(json['variant'] as Map);
    }

    return FeatureToggle(
      name: json['name'] as String?,
      description: json['description'] as String?,
      enabled: json['enabled'] as bool?,
      strategies: strategies,
      strategy: json['strategy'] as String?,
      variant: variant,
    );
  }

  final String? name;
  final String? description;
  final bool? enabled;
  final List<Strategy>? strategies;
  final String? strategy;
  final Variant? variant;
}

class Strategy {
  Strategy({this.name, this.parameters});

  factory Strategy.fromJson(Map json) {
    return Strategy(
      name: json['name'] as String?,
      parameters: json['parameters'] != null
          ? json['parameters'] as Map<String, dynamic>?
          : null,
    );
  }

  final String? name;
  final Map<String, dynamic>? parameters;
}

class Variant {
  Variant({
    this.name,
    this.description,
    this.enabled,
  });

  factory Variant.fromJson(Map json) {
    return Variant(
      name: json['name'] as String?,
      description: json['description'] as String?,
      enabled: json['enabled'] as bool?,
    );
  }

  final String? name;
  final String? description;
  final bool? enabled;
}
