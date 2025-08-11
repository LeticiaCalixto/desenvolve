import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain_layer/entities/health_article.dart';

class ArticleDetailPage extends StatefulWidget {
  final HealthArticle article;

  const ArticleDetailPage({
    super.key,
    required this.article,
  });

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late HealthArticle _article;

  @override
  void initState() {
    super.initState();
    _article = widget.article;
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
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              _article.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _article.isFavorite
                  ? const Color(0xFFFF6B6B)
                  : const Color(0xFF7F8C8D),
            ),
          ),
          IconButton(
            onPressed: _shareArticle,
            icon: const Icon(
              Icons.share,
              color: Color(0xFF7F8C8D),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tags
          Wrap(
            spacing: screenWidth * 0.02,
            runSpacing: screenWidth * 0.02,
            children: [
              _buildTag(_article.category, const Color(0xFF4ECDC4)),
              _buildTag(_article.ageGroup, const Color(0xFFFF9500)),
            ],
          ),

          SizedBox(height: screenWidth * 0.04),

          // Title
          Text(
            _article.title,
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF2C3E50),
              height: 1.3,
            ),
          ),

          SizedBox(height: screenWidth * 0.03),

          // Summary
          Text(
            _article.summary,
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.04,
              color: const Color(0xFF7F8C8D),
              height: 1.5,
            ),
          ),

          SizedBox(height: screenWidth * 0.04),

          // Meta info
          Row(
            children: [
              CircleAvatar(
                radius: screenWidth * 0.04,
                backgroundColor: const Color(0xFF4ECDC4),
                child: Text(
                  _article.author.substring(0, 1),
                  style: GoogleFonts.nunito(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _article.author,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                    Text(
                      '${_formatDate(_article.publishDate)} • ${_article.readTime} min de leitura',
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.03,
                        color: const Color(0xFF7F8C8D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
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
          // Placeholder for article image
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF4ECDC4).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.image,
              size: 60,
              color: const Color(0xFF4ECDC4).withOpacity(0.5),
            ),
          ),

          const SizedBox(height: 24),

          // Article content
          Text(
            'Conteúdo do Artigo',
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2C3E50),
            ),
          ),

          const SizedBox(height: 16),

          Text(
            _getMockContent(),
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF2C3E50),
              height: 1.6,
            ),
          ),

          const SizedBox(height: 24),

          // Key points
          _buildKeyPoints(),

          const SizedBox(height: 24),

          // Related tags
          _buildRelatedTags(),
        ],
      ),
    );
  }

  Widget _buildTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }

  Widget _buildKeyPoints() {
    final keyPoints = [
      'Respeite o ritmo natural de desenvolvimento da criança',
      'Crie um ambiente seguro para exploração',
      'Estimule através de brincadeiras adequadas para a idade',
      'Observe os sinais de progresso e celebre conquistas',
      'Consulte profissionais quando tiver dúvidas',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pontos Importantes',
          style: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 12),
        ...keyPoints.map((point) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4ECDC4),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      point,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xFF2C3E50),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildRelatedTags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags Relacionadas',
          style: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _article.tags
              .map((tag) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9ECEF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '#$tag',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7F8C8D),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  String _getMockContent() {
    return '''O desenvolvimento infantil é um processo fascinante e complexo que acontece nos primeiros anos de vida. Cada criança é única e se desenvolve em seu próprio ritmo, mas existem marcos importantes que podemos observar e estimular.

Durante os primeiros meses, é fundamental criar um ambiente rico em estímulos adequados para a idade. Isso não significa sobrecarregar a criança, mas oferecer oportunidades de exploração segura e interação amorosa.

A família tem um papel fundamental nesse processo. Através de brincadeiras simples, conversas carinhosas e cuidados atenciosos, os pais e cuidadores contribuem significativamente para o desenvolvimento saudável da criança.

É importante lembrar que cada criança tem seu próprio tempo e que comparações podem ser prejudiciais. O fundamental é observar, estimular adequadamente e buscar orientação profissional quando necessário.

Celebre cada pequena conquista e lembre-se: o amor e a atenção são os melhores estímulos para o desenvolvimento infantil.''';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Hoje';
    } else if (difference == 1) {
      return 'Ontem';
    } else if (difference < 7) {
      return '$difference dias atrás';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  void _toggleFavorite() {
    setState(() {
      _article = _article.copyWith(isFavorite: !_article.isFavorite);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _article.isFavorite
              ? 'Artigo adicionado aos favoritos'
              : 'Artigo removido dos favoritos',
        ),
        backgroundColor: const Color(0xFF4ECDC4),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _shareArticle() {
    // TODO: Implementar compartilhamento
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Funcionalidade de compartilhamento em desenvolvimento'),
        backgroundColor: Color(0xFF4ECDC4),
      ),
    );
  }
}
