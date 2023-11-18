enum Routes {
  discoverPage(
    name: 'discoverPage',
    path: '/',
  ),
  bookingPage(
    name: 'bookingPage',
    path: '/bookingPage',
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
