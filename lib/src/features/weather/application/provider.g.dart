// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherByCityHash() => r'd6ecbec8e881f658f5f1ccb33ae01071efc4f7e3';

/// See also [weatherByCity].
@ProviderFor(weatherByCity)
final weatherByCityProvider = AutoDisposeFutureProvider<Weather>.internal(
  weatherByCity,
  name: r'weatherByCityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherByCityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeatherByCityRef = AutoDisposeFutureProviderRef<Weather>;
String _$weatherByLatLonHash() => r'baba5b8ea741541338d85dc205a235a0b9603f0b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef WeatherByLatLonRef = AutoDisposeFutureProviderRef<Weather>;

/// See also [weatherByLatLon].
@ProviderFor(weatherByLatLon)
const weatherByLatLonProvider = WeatherByLatLonFamily();

/// See also [weatherByLatLon].
class WeatherByLatLonFamily extends Family<AsyncValue<Weather>> {
  /// See also [weatherByLatLon].
  const WeatherByLatLonFamily();

  /// See also [weatherByLatLon].
  WeatherByLatLonProvider call(
    Location location,
  ) {
    return WeatherByLatLonProvider(
      location,
    );
  }

  @override
  WeatherByLatLonProvider getProviderOverride(
    covariant WeatherByLatLonProvider provider,
  ) {
    return call(
      provider.location,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weatherByLatLonProvider';
}

/// See also [weatherByLatLon].
class WeatherByLatLonProvider extends AutoDisposeFutureProvider<Weather> {
  /// See also [weatherByLatLon].
  WeatherByLatLonProvider(
    this.location,
  ) : super.internal(
          (ref) => weatherByLatLon(
            ref,
            location,
          ),
          from: weatherByLatLonProvider,
          name: r'weatherByLatLonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$weatherByLatLonHash,
          dependencies: WeatherByLatLonFamily._dependencies,
          allTransitiveDependencies:
              WeatherByLatLonFamily._allTransitiveDependencies,
        );

  final Location location;

  @override
  bool operator ==(Object other) {
    return other is WeatherByLatLonProvider && other.location == location;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$userLocationAndCityHash() =>
    r'4791cd62c2fb60de2664402bd594a1f8011d1639';

/// See also [userLocationAndCity].
@ProviderFor(userLocationAndCity)
final userLocationAndCityProvider = AutoDisposeFutureProvider<Weather>.internal(
  userLocationAndCity,
  name: r'userLocationAndCityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userLocationAndCityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserLocationAndCityRef = AutoDisposeFutureProviderRef<Weather>;
String _$cityHash() => r'85b6d538bd43d52c08a09f2051b45731cdf95911';

/// See also [City].
@ProviderFor(City)
final cityProvider = AutoDisposeNotifierProvider<City, String>.internal(
  City.new,
  name: r'cityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$City = AutoDisposeNotifier<String>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
