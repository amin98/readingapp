class Story {
  final String id;
  final String title;
  final String imageAsset; // Cover image or relevant story image
  final List<String> contentPages; // Each string is a page/segment of content
  final List<double> boltLevels; // Bolt percentage for each page
  final List<int> coinsPerPage; // Coins awarded for each page

  Story({
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.contentPages,
    required this.boltLevels,
    required this.coinsPerPage,
  }) : assert(
         contentPages.length == boltLevels.length &&
             contentPages.length == coinsPerPage.length,
         'contentPages, boltLevels, and coinsPerPage must have the same length.',
       );

  int get totalPages => contentPages.length;
}
