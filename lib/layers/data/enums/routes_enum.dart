enum Routes {
  discoverScreen(
    name: 'discoverScreen',
    path: '/',
  ),
  bookingScree(
    name: 'bookingScreen',
    path: '/bookingScreen',
  ),
  other(
    name: 'other',
    path: '/other',
  );

  const Routes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => name;
}
