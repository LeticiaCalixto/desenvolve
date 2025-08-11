import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain_layer/entities/health_article.dart';
import '../../../domain_layer/entities/health_category.dart';
import 'article_detail_page.dart';

class CategoryArticlesPage extends StatefulWidget {
  final HealthCategory category;

  const CategoryArticlesPage({
    super.key,
    required this.category,
  });

  @override
  State<CategoryArticlesPage> createState() => _CategoryArticlesPageState();
}

class _CategoryArticlesPageState extends State<CategoryArticlesPage> {
  List<HealthArticle> _articles = [];
  List<HealthArticle> _filteredArticles = [];
  String _sortBy = 'recent'; // recent, popular, alphabetical
  String _ageFilter = 'all'; // all, 0-6, 6-12, 12-24, 2+
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadArticles();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadArticles() {
    // Mock articles for the category
    _articles = _getMockArticlesForCategory(widget.category.name);
    _filteredArticles = List.from(_articles);
    _applySorting();
  }

  void _onSearchChanged() {
    setState(() {
      _applyFilters();
    });
  }

  void _applyFilters() {
    _filteredArticles = _articles.where((article) {
      final matchesSearch = _searchController.text.isEmpty ||
          article.title
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()) ||
          article.summary
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());

      final matchesAge = _ageFilter == 'all' || article.ageGroup == _ageFilter;

      return matchesSearch && matchesAge;
    }).toList();

    _applySorting();
  }

  void _applySorting() {
    switch (_sortBy) {
      case 'recent':
        _filteredArticles
            .sort((a, b) => b.publishDate.compareTo(a.publishDate));
        break;
      case 'popular':
        // Simular popularidade baseada no número de tags
        _filteredArticles
            .sort((a, b) => b.tags.length.compareTo(a.tags.length));
        break;
      case 'alphabetical':
        _filteredArticles.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF2C3E50),
          ),
        ),
        title: Text(
          widget.category.name,
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _showSortOptions,
            icon: const Icon(
              Icons.sort,
              color: Color(0xFF7F8C8D),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildFilters(),
          Expanded(child: _buildArticlesList()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      color: Colors.white,
      child: Column(
        children: [
          // Category icon and description
          Row(
            children: [
              Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                decoration: BoxDecoration(
                  color: _getCategoryColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(screenWidth * 0.075),
                ),
                child: Icon(
                  _getCategoryIcon(),
                  size: screenWidth * 0.08,
                  color: _getCategoryColor(),
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.category.name,
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      widget.category.description,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        color: const Color(0xFF7F8C8D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: screenWidth * 0.05),

          // Search bar
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar artigos...',
              hintStyle: GoogleFonts.poppins(
                color: const Color(0xFF7F8C8D),
                fontSize: screenWidth * 0.035,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: const Color(0xFF7F8C8D),
                size: screenWidth * 0.06,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              fillColor: const Color(0xFFF8F9FA),
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: screenWidth * 0.03,
              ),
            ),
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.035,
              color: const Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          Text(
            'Filtrar por idade:',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildAgeFilter('all', 'Todas'),
                  _buildAgeFilter('0-6', '0-6 meses'),
                  _buildAgeFilter('6-12', '6-12 meses'),
                  _buildAgeFilter('12-24', '1-2 anos'),
                  _buildAgeFilter('2+', '2+ anos'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgeFilter(String value, String label) {
    final isSelected = _ageFilter == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _ageFilter = value;
          _applyFilters();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4ECDC4) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF4ECDC4) : const Color(0xFFE9ECEF),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF7F8C8D),
          ),
        ),
      ),
    );
  }

  Widget _buildArticlesList() {
    if (_filteredArticles.isEmpty) {
      return _buildEmptyState();
    }

    return Container(
      color: const Color(0xFFF8F9FA),
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: _filteredArticles.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final article = _filteredArticles[index];
          return _buildArticleCard(article);
        },
      ),
    );
  }

  Widget _buildArticleCard(HealthArticle article) {
    return GestureDetector(
      onTap: () => _openArticle(article),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with tags and favorite
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9500).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    article.ageGroup,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFF9500),
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  article.isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: article.isFavorite
                      ? const Color(0xFFFF6B6B)
                      : const Color(0xFF7F8C8D),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Title
            Text(
              article.title,
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2C3E50),
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 8),

            // Summary
            Text(
              article.summary,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF7F8C8D),
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 12),

            // Footer with author and meta
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: const Color(0xFF4ECDC4),
                  child: Text(
                    article.author.substring(0, 1),
                    style: GoogleFonts.nunito(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    article.author,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF2C3E50),
                    ),
                  ),
                ),
                Text(
                  '${article.readTime} min',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF7F8C8D),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 80,
              color: const Color(0xFF7F8C8D).withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'Nenhum artigo encontrado',
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF7F8C8D),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tente ajustar os filtros ou termos de busca',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF7F8C8D),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ordenar por',
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 20),
            _buildSortOption('recent', 'Mais recentes', Icons.schedule),
            _buildSortOption('popular', 'Mais populares', Icons.trending_up),
            _buildSortOption('alphabetical', 'Alfabética', Icons.sort_by_alpha),
          ],
        ),
      ),
    );
  }

  Widget _buildSortOption(String value, String label, IconData icon) {
    final isSelected = _sortBy == value;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? const Color(0xFF4ECDC4) : const Color(0xFF7F8C8D),
      ),
      title: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          color: isSelected ? const Color(0xFF4ECDC4) : const Color(0xFF2C3E50),
        ),
      ),
      trailing: isSelected
          ? const Icon(
              Icons.check,
              color: Color(0xFF4ECDC4),
            )
          : null,
      onTap: () {
        setState(() {
          _sortBy = value;
          _applyFilters();
        });
        Navigator.pop(context);
      },
    );
  }

  void _openArticle(HealthArticle article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailPage(article: article),
      ),
    );
  }

  List<HealthArticle> _getMockArticlesForCategory(String categoryName) {
    return [
      HealthArticle(
        id: '1',
        title: 'Primeiros passos do desenvolvimento motor',
        summary:
            'Como estimular o desenvolvimento motor do seu bebê nos primeiros meses de vida.',
        content: 'Conteúdo completo do artigo...',
        author: 'Dra. Maria Silva',
        publishDate: DateTime.now().subtract(const Duration(days: 2)),
        category: categoryName,
        ageGroup: '0-6',
        readTime: 5,
        tags: ['motor', 'bebê', 'desenvolvimento'],
        imageUrl: 'https://via.placeholder.com/300x200',
        isFavorite: false,
      ),
      HealthArticle(
        id: '2',
        title: 'Alimentação saudável para crianças',
        summary:
            'Dicas importantes para uma alimentação equilibrada e nutritiva.',
        content: 'Conteúdo completo do artigo...',
        author: 'Nut. João Santos',
        publishDate: DateTime.now().subtract(const Duration(days: 5)),
        category: categoryName,
        ageGroup: '6-12',
        readTime: 7,
        tags: ['alimentação', 'nutrição', 'saúde'],
        imageUrl: 'https://via.placeholder.com/300x200',
        isFavorite: true,
      ),
      HealthArticle(
        id: '3',
        title: 'Brincadeiras educativas por idade',
        summary: 'Atividades lúdicas que estimulam o aprendizado em cada fase.',
        content: 'Conteúdo completo do artigo...',
        author: 'Psic. Ana Costa',
        publishDate: DateTime.now().subtract(const Duration(days: 7)),
        category: categoryName,
        ageGroup: '12-24',
        readTime: 6,
        tags: ['brincadeiras', 'educação', 'desenvolvimento'],
        imageUrl: 'https://via.placeholder.com/300x200',
        isFavorite: false,
      ),
      HealthArticle(
        id: '4',
        title: 'Sono tranquilo: rotinas e dicas',
        summary: 'Como estabelecer uma rotina de sono saudável para a criança.',
        content: 'Conteúdo completo do artigo...',
        author: 'Dr. Carlos Lima',
        publishDate: DateTime.now().subtract(const Duration(days: 10)),
        category: categoryName,
        ageGroup: '2+',
        readTime: 8,
        tags: ['sono', 'rotina', 'bem-estar'],
        imageUrl: 'https://via.placeholder.com/300x200',
        isFavorite: false,
      ),
    ];
  }

  Color _getCategoryColor() {
    // Mapear cores baseado no nome da categoria
    switch (widget.category.name.toLowerCase()) {
      case 'desenvolvimento':
        return const Color(0xFF4ECDC4);
      case 'saúde':
        return const Color(0xFF45B7D1);
      case 'alimentação':
        return const Color(0xFF96CEB4);
      case 'sono':
        return const Color(0xFF9B59B6);
      case 'brincadeiras':
        return const Color(0xFFFF9500);
      default:
        return const Color(0xFF4ECDC4);
    }
  }

  IconData _getCategoryIcon() {
    // Mapear ícones baseado no nome da categoria
    switch (widget.category.name.toLowerCase()) {
      case 'desenvolvimento':
        return Icons.child_care;
      case 'saúde':
        return Icons.health_and_safety;
      case 'alimentação':
        return Icons.restaurant;
      case 'sono':
        return Icons.bedtime;
      case 'brincadeiras':
        return Icons.toys;
      default:
        return Icons.article;
    }
  }
}
