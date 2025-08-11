import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain_layer/entities/health_article.dart';
import '../../../domain_layer/entities/health_category.dart';
import 'article_detail_page.dart';
import 'category_articles_page.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedAgeGroup = 'Todas as idades';
  List<HealthArticle> _filteredArticles = [];
  List<HealthArticle> _allArticles = [];
  List<HealthCategory> _categories = [];

  final List<String> _ageGroups = [
    'Todas as idades',
    '0-6 meses',
    '6-12 meses',
    '1-2 anos',
    '2-3 anos',
    '3-5 anos',
  ];

  @override
  void initState() {
    super.initState();
    _loadMockData();
    _filteredArticles = _allArticles;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadMockData() {
    // Mock categories
    _categories = [
      HealthCategory(
        id: '1',
        name: 'Desenvolvimento Motor',
        description: 'Marcos motores e atividades físicas',
        iconName: 'directions_run',
        color: '#FF6B6B',
        articleCount: 12,
      ),
      HealthCategory(
        id: '2',
        name: 'Alimentação',
        description: 'Nutrição e introdução alimentar',
        iconName: 'restaurant',
        color: '#4ECDC4',
        articleCount: 8,
      ),
      HealthCategory(
        id: '3',
        name: 'Sono',
        description: 'Rotinas e qualidade do sono',
        iconName: 'bedtime',
        color: '#45B7D1',
        articleCount: 6,
      ),
      HealthCategory(
        id: '4',
        name: 'Desenvolvimento Cognitivo',
        description: 'Aprendizado e estímulos cognitivos',
        iconName: 'psychology',
        color: '#96CEB4',
        articleCount: 15,
      ),
      HealthCategory(
        id: '5',
        name: 'Saúde e Prevenção',
        description: 'Cuidados médicos e prevenção',
        iconName: 'health_and_safety',
        color: '#FECA57',
        articleCount: 10,
      ),
      HealthCategory(
        id: '6',
        name: 'Desenvolvimento Social',
        description: 'Interação social e emocional',
        iconName: 'groups',
        color: '#FF9F43',
        articleCount: 9,
      ),
    ];

    // Mock articles
    _allArticles = [
      HealthArticle(
        id: '1',
        title: 'Primeiros Passos: Como Estimular o Desenvolvimento Motor',
        summary:
            'Dicas práticas para estimular o desenvolvimento motor do seu bebê de forma segura e divertida.',
        content: 'Conteúdo completo do artigo sobre desenvolvimento motor...',
        category: 'Desenvolvimento Motor',
        ageGroup: '6-12 meses',
        imageUrl: 'assets/images/motor_development.jpg',
        publishDate: DateTime.now().subtract(const Duration(days: 5)),
        readTime: 5,
        tags: ['motor', 'bebê', 'estímulo'],
        author: 'Dra. Marina Santos',
      ),
      HealthArticle(
        id: '2',
        title: 'Introdução Alimentar: Guia Completo para Pais',
        summary:
            'Tudo o que você precisa saber sobre introdução alimentar dos 6 meses aos 2 anos.',
        content: 'Conteúdo completo sobre introdução alimentar...',
        category: 'Alimentação',
        ageGroup: '6-12 meses',
        imageUrl: 'assets/images/baby_food.jpg',
        publishDate: DateTime.now().subtract(const Duration(days: 3)),
        readTime: 8,
        tags: ['alimentação', 'nutrição', 'papinha'],
        author: 'Nutri. Ana Paula',
      ),
      HealthArticle(
        id: '3',
        title: 'Estabelecendo Rotinas de Sono Saudáveis',
        summary:
            'Como criar rotinas de sono que funcionam para toda a família.',
        content: 'Conteúdo completo sobre rotinas de sono...',
        category: 'Sono',
        ageGroup: '0-6 meses',
        imageUrl: 'assets/images/baby_sleep.jpg',
        publishDate: DateTime.now().subtract(const Duration(days: 7)),
        readTime: 6,
        tags: ['sono', 'rotina', 'bebê'],
        author: 'Dr. Carlos Lima',
      ),
      HealthArticle(
        id: '4',
        title: 'Brincadeiras que Estimulam o Desenvolvimento Cognitivo',
        summary:
            'Atividades simples para estimular o cérebro do seu filho em casa.',
        content: 'Conteúdo completo sobre desenvolvimento cognitivo...',
        category: 'Desenvolvimento Cognitivo',
        ageGroup: '1-2 anos',
        imageUrl: 'assets/images/cognitive_games.jpg',
        publishDate: DateTime.now().subtract(const Duration(days: 2)),
        readTime: 7,
        tags: ['cognitivo', 'brincadeiras', 'estímulo'],
        author: 'Psic. Laura Mendes',
      ),
      HealthArticle(
        id: '5',
        title: 'Vacinação Infantil: Calendário e Importância',
        summary:
            'Guia completo sobre o calendário de vacinação e sua importância.',
        content: 'Conteúdo completo sobre vacinação...',
        category: 'Saúde e Prevenção',
        ageGroup: 'Todas as idades',
        imageUrl: 'assets/images/vaccination.jpg',
        publishDate: DateTime.now().subtract(const Duration(days: 10)),
        readTime: 10,
        tags: ['vacina', 'prevenção', 'saúde'],
        author: 'Dr. Pedro Oliveira',
      ),
      HealthArticle(
        id: '6',
        title: 'Desenvolvendo Habilidades Sociais na Primeira Infância',
        summary:
            'Como ajudar seu filho a desenvolver habilidades sociais importantes.',
        content: 'Conteúdo completo sobre desenvolvimento social...',
        category: 'Desenvolvimento Social',
        ageGroup: '2-3 anos',
        imageUrl: 'assets/images/social_skills.jpg',
        publishDate: DateTime.now().subtract(const Duration(days: 1)),
        readTime: 6,
        tags: ['social', 'emocional', 'criança'],
        author: 'Psic. Roberta Silva',
      ),
    ];

    _filteredArticles = _allArticles;
  }

  void _filterArticles() {
    setState(() {
      _filteredArticles = _allArticles.where((article) {
        final matchesSearch = _searchController.text.isEmpty ||
            article.title
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            article.summary
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            article.tags.any((tag) => tag
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()));

        final matchesAge = _selectedAgeGroup == 'Todas as idades' ||
            article.ageGroup == _selectedAgeGroup;

        return matchesSearch && matchesAge;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchAndFilters(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategoriesSection(),
                    const SizedBox(height: 24),
                    _buildRecentArticlesSection(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: 20,
      ),
      child: Row(
        children: [
          Icon(
            Icons.library_books,
            size: MediaQuery.of(context).size.width * 0.07,
            color: const Color(0xFF4ECDC4),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Expanded(
            child: Text(
              'Biblioteca de Saúde',
              style: GoogleFonts.nunito(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF2C3E50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilters() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: 16,
      ),
      child: Column(
        children: [
          // Search bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => _filterArticles(),
              style: GoogleFonts.poppins(fontSize: screenWidth * 0.04),
              decoration: InputDecoration(
                hintText: 'Buscar artigos, dicas ou temas...',
                hintStyle: GoogleFonts.poppins(
                  color: const Color(0xFF7F8C8D),
                  fontSize: screenWidth * 0.035,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: const Color(0xFF4ECDC4),
                  size: screenWidth * 0.06,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: screenWidth * 0.04,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Age filter
          SizedBox(
            height: screenWidth * 0.12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _ageGroups.length,
              itemBuilder: (context, index) {
                final ageGroup = _ageGroups[index];
                final isSelected = _selectedAgeGroup == ageGroup;

                return Container(
                  margin: EdgeInsets.only(right: screenWidth * 0.03),
                  child: FilterChip(
                    label: Text(
                      ageGroup,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color:
                            isSelected ? Colors.white : const Color(0xFF2C3E50),
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedAgeGroup = ageGroup;
                      });
                      _filterArticles();
                    },
                    backgroundColor: Colors.white,
                    selectedColor: const Color(0xFF4ECDC4),
                    checkmarkColor: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.black.withOpacity(0.1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 3 : 2;
    final aspectRatio = screenWidth > 600 ? 1.2 : 1.1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categorias',
          style: GoogleFonts.nunito(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: screenWidth * 0.03,
            mainAxisSpacing: screenWidth * 0.03,
            childAspectRatio: aspectRatio,
          ),
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            return _buildCategoryCard(category);
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard(HealthCategory category) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.08;
    final cardPadding = screenWidth * 0.04;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryArticlesPage(
              category: category,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(cardPadding),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                color: _getColorFromHex(category.color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getIconFromName(category.iconName),
                color: _getColorFromHex(category.color),
                size: iconSize * 0.6,
              ),
            ),
            SizedBox(height: screenWidth * 0.03),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2C3E50),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: screenWidth * 0.01),
            Text(
              '${category.articleCount} artigos',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.03,
                color: const Color(0xFF7F8C8D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentArticlesSection() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _searchController.text.isNotEmpty ||
                  _selectedAgeGroup != 'Todas as idades'
              ? 'Resultados da busca (${_filteredArticles.length})'
              : 'Artigos Recentes',
          style: GoogleFonts.nunito(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 16),
        if (_filteredArticles.isEmpty)
          _buildEmptyState()
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _filteredArticles.length,
            itemBuilder: (context, index) {
              final article = _filteredArticles[index];
              return _buildArticleCard(article);
            },
          ),
      ],
    );
  }

  Widget _buildEmptyState() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE9ECEF),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            size: screenWidth * 0.16,
            color: const Color(0xFFBDC3C7),
          ),
          SizedBox(height: screenWidth * 0.04),
          Text(
            'Nenhum artigo encontrado',
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF7F8C8D),
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            'Tente ajustar os filtros ou usar outros termos de busca',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.035,
              color: const Color(0xFFBDC3C7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(HealthArticle article) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Container(
      margin: EdgeInsets.only(bottom: screenWidth * 0.04),
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
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(article: article),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          style: GoogleFonts.nunito(
                            fontSize: isLargeScreen
                                ? screenWidth * 0.045
                                : screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2C3E50),
                          ),
                          maxLines: isLargeScreen ? 3 : 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        Text(
                          article.summary,
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.035,
                            color: const Color(0xFF7F8C8D),
                            height: 1.4,
                          ),
                          maxLines: isLargeScreen ? 3 : 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4ECDC4).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.article_outlined,
                      color: const Color(0xFF4ECDC4),
                      size: screenWidth * 0.08,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.03),
              Wrap(
                spacing: screenWidth * 0.02,
                runSpacing: screenWidth * 0.02,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenWidth * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4ECDC4).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      article.category,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4ECDC4),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenWidth * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF9500).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      article.ageGroup,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFF9500),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: screenWidth * 0.04,
                        color: const Color(0xFF7F8C8D),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        '${article.readTime} min',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.03,
                          color: const Color(0xFF7F8C8D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorFromHex(String hexColor) {
    return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
  }

  IconData _getIconFromName(String iconName) {
    switch (iconName) {
      case 'directions_run':
        return Icons.directions_run;
      case 'restaurant':
        return Icons.restaurant;
      case 'bedtime':
        return Icons.bedtime;
      case 'psychology':
        return Icons.psychology;
      case 'health_and_safety':
        return Icons.health_and_safety;
      case 'groups':
        return Icons.groups;
      default:
        return Icons.article;
    }
  }
}
