// 声明当前 Dart 库文件
library;

// 导入 Flutter 官方 Cupertino 风格 iOS 拟真交互控件库
import 'package:flutter/cupertino.dart';
// 导入 Flutter 核心 Material Design 基础组件库
import 'package:flutter/material.dart';

// 导入 liquid_glass_widgets 流体玻璃渲染核心组件库
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

// 胶囊半圆哨兵常量
const _kCapsuleSentinel = GlassDefaults.capsuleRadius;
// 滑块最大阈值对应纯胶囊
const _kSliderCapsuleThreshold = 36.0;

// 异步主函数入口点
void main() async {
  // 初始化 Flutter 底层绑定通道
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化流体玻璃着色器
  await LiquidGlassWidgets.initialize();
  // 启动 Demo 应用
  runApp(LiquidGlassWidgets.wrap(child: const _DemoApp()));
}

// 根应用无状态组件
class _DemoApp extends StatelessWidget {
  const _DemoApp();
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // 汉化应用标题
      title: '胶囊指示器物理调优实验室',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(brightness: Brightness.dark),
      builder: (context, child) => Theme(
        data: ThemeData.dark(useMaterial3: true),
        child: child!,
      ),
      home: const IndicatorParityDemoPage(),
    );
  }
}

// 胶囊调优实验室页面 StatefulWidget
class IndicatorParityDemoPage extends StatefulWidget {
  const IndicatorParityDemoPage({super.key});

  @override
  State<IndicatorParityDemoPage> createState() =>
      _IndicatorParityDemoPageState();
}

// 胶囊调优实验室 State 类
class _IndicatorParityDemoPageState extends State<IndicatorParityDemoPage> {
  // 捏合收缩力度
  double _pinchStrength = 0.4;
  // 水平动态延展像素
  double _expansionH = 12.0;
  // 垂直动态延展像素
  double _expansionV = 8.0;
  // 光学色散与色差系数
  double _aberration = 0.15;
  // 玻璃底色透明度
  double _glassTint = 0.0;
  // 光学折射率
  double _refraction = 1.15;
  // 外底栏圆角大小
  double _barBorderRadius = _kCapsuleSentinel;
  // 内指示器圆角大小覆盖值
  double? _indicatorBorderRadiusOverride;

  // 各组件选中索引状态
  int _segSelected = 0;
  int _tabSelected = 0;
  int _inlineSelected = 0;
  int _inlineIconSelected = 0;
  int _barSelected = 0;
  int _searchBarSelected = 0;
  bool _isSearching = false;

  // 汉化分段选项数据
  static const _segments = <GlassSegment>[
    GlassSegment(label: '日志记录'),
    GlassSegment(label: '精选照片'),
    GlassSegment(label: '短片视频')
  ];

  // 汉化带图标分段选项数据
  static const _tabs = [
    GlassSegment(label: '精选', icon: Icon(CupertinoIcons.star_fill)),
    GlassSegment(label: '浏览', icon: Icon(CupertinoIcons.square_grid_2x2)),
    GlassSegment(label: '排行', icon: Icon(CupertinoIcons.chart_bar_fill)),
    GlassSegment(label: '电台', icon: Icon(CupertinoIcons.radiowaves_left)),
  ];

  // 汉化底部栏标签数据
  static const _barTabs = <GlassTab>[
    GlassTab(label: '首页', icon: Icon(CupertinoIcons.home)),
    GlassTab(label: '探索', icon: Icon(CupertinoIcons.compass_fill)),
    GlassTab(label: '资料库', icon: Icon(CupertinoIcons.book_fill)),
    GlassTab(label: '个人中心', icon: Icon(CupertinoIcons.person_fill)),
  ];

  // 汉化纯文本标签数据
  static const _inlineTabs = <GlassTab>[
    GlassTab(label: '为你推荐'),
    GlassTab(label: '正在关注'),
    GlassTab(label: '最新发布'),
  ];

  // 动态构建指示器设置
  LiquidGlassSettings get _indicatorSettings =>
      AnimatedGlassIndicator.baseIndicatorSettings.copyWith(
        chromaticAberration: _aberration,
        refractiveIndex: _refraction,
        glassColor: Color.from(
          alpha: _glassTint,
          red: 1,
          green: 1,
          blue: 1,
        ),
      );

  // 动态构建延展边距
  EdgeInsets get _expansion =>
      EdgeInsets.symmetric(horizontal: _expansionH, vertical: _expansionV);

  @override
  Widget build(BuildContext context) {
    return GlassScaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // 渐变折射背景
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0D0D1A),
                  Color(0xFF0F1E3E),
                  Color(0xFF12103A),
                  Color(0xFF1B0A3E),
                ],
              ),
            ),
          ),
          // 五彩光球装饰
          const Positioned(
            top: 120,
            left: -60,
            child: _GlowOrb(color: Color(0xFF5E3AFF), size: 220),
          ),
          const Positioned(
            top: 300,
            right: -40,
            child: _GlowOrb(color: Color(0xFF0A84FF), size: 180),
          ),
          const Positioned(
            top: 520,
            left: 60,
            child: _GlowOrb(color: Color(0xFFFF375F), size: 160),
          ),
          const Positioned(
            top: 720,
            right: 20,
            child: _GlowOrb(color: Color(0xFF30D158), size: 140),
          ),
          const Positioned(
            top: 920,
            left: -30,
            child: _GlowOrb(color: Color(0xFFFFD60A), size: 150),
          ),

          // 内容滚动列表
          SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 240),
              children: [
                // 汉化主标题
                const Text(
                  '胶囊指示器物理调优实验室',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 4),
                // 汉化副标题
                Text(
                  'iOS 26 拟真质感校准 — 6 种胶囊组件实时物理调优',
                  style: TextStyle(
                    color: CupertinoColors.white.withValues(alpha: 0.5),
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 20),

                // 调谐控制台组件
                _TunerPanel(
                  pinchStrength: _pinchStrength,
                  expansionH: _expansionH,
                  expansionV: _expansionV,
                  aberration: _aberration,
                  glassTint: _glassTint,
                  refraction: _refraction,
                  barBorderRadius: _barBorderRadius,
                  indicatorBorderRadius: _indicatorBorderRadiusOverride,
                  onPinchChanged: (v) => setState(() => _pinchStrength = v),
                  onExpansionHChanged: (v) => setState(() => _expansionH = v),
                  onExpansionVChanged: (v) => setState(() => _expansionV = v),
                  onAberrationChanged: (v) => setState(() => _aberration = v),
                  onGlassTintChanged: (v) => setState(() => _glassTint = v),
                  onRefractionChanged: (v) => setState(() => _refraction = v),
                  onBarBorderRadiusChanged: (v) =>
                      setState(() => _barBorderRadius = v),
                  onIndicatorBorderRadiusChanged: (v) =>
                      setState(() => _indicatorBorderRadiusOverride = v),
                  onResetIndicatorBorderRadius: () =>
                      setState(() => _indicatorBorderRadiusOverride = null),
                ),

                const SizedBox(height: 28),

                // 汉化控件 1：分段控制器（纯文本）
                _WidgetSection(
                  label: '分段控制器 (纯文本胶囊)',
                  color: const Color(0xFF5E3AFF),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: GlassSegmentedControl(
                      segments: _segments,
                      selectedIndex: _segSelected,
                      onSegmentSelected: (i) =>
                          setState(() => _segSelected = i),
                      quality: GlassQuality.premium,
                      borderRadius: _barBorderRadius,
                      indicatorBorderRadius: _indicatorBorderRadiusOverride,
                      indicatorPinchStrength: _pinchStrength,
                      indicatorExpansion: _expansion,
                      indicatorSettings: _indicatorSettings,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 汉化控件 2：分段控制器（图标+标签）
                _WidgetSection(
                  label: '分段控制器 (图标+标签复合胶囊)',
                  color: const Color(0xFF0A84FF),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GlassSegmentedControl(
                      segments: _tabs,
                      selectedIndex: _tabSelected,
                      onSegmentSelected: (i) =>
                          setState(() => _tabSelected = i),
                      quality: GlassQuality.premium,
                      height: 56,
                      iconSize: 20,
                      selectedTextStyle: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedTextStyle: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                      borderRadius: _barBorderRadius,
                      indicatorBorderRadius: _indicatorBorderRadiusOverride,
                      indicatorPinchStrength: _pinchStrength,
                      indicatorExpansion: _expansion,
                      indicatorSettings: _indicatorSettings,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 汉化控件 3：内联标签栏（纯文本）
                _WidgetSection(
                  label: '内联流体标签栏 (纯文本模式)',
                  color: const Color(0xFF30B0C7),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GlassTabBar.inline(
                          tabs: _inlineTabs,
                          selectedIndex: _inlineSelected,
                          onTabSelected: (i) =>
                              setState(() => _inlineSelected = i),
                          quality: GlassQuality.premium,
                          barBorderRadius: _barBorderRadius,
                          indicatorBorderRadius: _indicatorBorderRadiusOverride,
                          indicatorPinchStrength: _pinchStrength,
                          indicatorSettings: _indicatorSettings,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // 汉化控件 4：内联标签栏（图标+文字）
                _WidgetSection(
                  label: '内联流体标签栏 (图标+文字模式)',
                  color: const Color(0xFF5AC8FA),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      GlassTabBar.inline(
                        tabs: _barTabs,
                        selectedIndex: _inlineIconSelected,
                        onTabSelected: (i) =>
                            setState(() => _inlineIconSelected = i),
                        quality: GlassQuality.premium,
                        barHeight: 52,
                        barBorderRadius: _barBorderRadius,
                        indicatorBorderRadius: _indicatorBorderRadiusOverride,
                        indicatorPinchStrength: _pinchStrength,
                        indicatorSettings: _indicatorSettings,
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // 汉化控件 5：底部栏（旗舰画质）
                _WidgetSection(
                  label: '流体底部导航栏 — 旗舰画质 (Premium)',
                  color: const Color(0xFFFF375F),
                  child: GlassTabBar.bottom(
                    tabs: _barTabs,
                    selectedIndex: _barSelected,
                    onTabSelected: (i) => setState(() => _barSelected = i),
                    quality: GlassQuality.premium,
                    indicatorPinchStrength: _pinchStrength,
                    indicatorExpansion: _expansion,
                    indicatorSettings: _indicatorSettings,
                    barBorderRadius: _barBorderRadius,
                    indicatorBorderRadius: _indicatorBorderRadiusOverride,
                  ),
                ),

                const SizedBox(height: 16),

                // 汉化控件 6：底部栏（标准画质）
                _WidgetSection(
                  label: '流体底部导航栏 — 标准画质 (Standard)',
                  color: const Color(0xFFFF9F0A),
                  child: GlassTabBar.bottom(
                    tabs: _barTabs,
                    selectedIndex: _barSelected,
                    onTabSelected: (i) => setState(() => _barSelected = i),
                    quality: GlassQuality.standard,
                    indicatorPinchStrength: _pinchStrength,
                    indicatorExpansion: _expansion,
                    indicatorSettings: _indicatorSettings,
                    barBorderRadius: _barBorderRadius,
                    indicatorBorderRadius: _indicatorBorderRadiusOverride,
                  ),
                ),

                const SizedBox(height: 16),

                // 汉化控件 7：可搜索底部栏
                _WidgetSection(
                  label: '支持搜索展开的流体底部栏',
                  color: const Color(0xFF30D158),
                  child: GlassTabBar.searchable(
                    tabs: _barTabs,
                    selectedIndex: _searchBarSelected,
                    isSearchActive: _isSearching,
                    onTabSelected: (i) =>
                        setState(() => _searchBarSelected = i),
                    quality: GlassQuality.premium,
                    indicatorPinchStrength: _pinchStrength,
                    indicatorExpansion: _expansion,
                    indicatorSettings: _indicatorSettings,
                    barBorderRadius: _barBorderRadius,
                    indicatorBorderRadius: _indicatorBorderRadiusOverride,
                    searchConfig: GlassSearchBarConfig(
                      hintText: '搜索内容…',
                      showsCancelButton: true,
                      onSearchToggle: (v) => setState(() => _isSearching = v),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 实时代码片段徽章
                _LiveValuesBadge(
                  pinchStrength: _pinchStrength,
                  expansionH: _expansionH,
                  expansionV: _expansionV,
                  aberration: _aberration,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 调谐器面板组件
class _TunerPanel extends StatefulWidget {
  const _TunerPanel({
    required this.pinchStrength,
    required this.expansionH,
    required this.expansionV,
    required this.aberration,
    required this.glassTint,
    required this.refraction,
    required this.barBorderRadius,
    required this.indicatorBorderRadius,
    required this.onPinchChanged,
    required this.onExpansionHChanged,
    required this.onExpansionVChanged,
    required this.onAberrationChanged,
    required this.onGlassTintChanged,
    required this.onRefractionChanged,
    required this.onBarBorderRadiusChanged,
    required this.onIndicatorBorderRadiusChanged,
    required this.onResetIndicatorBorderRadius,
  });

  final double pinchStrength;
  final double expansionH;
  final double expansionV;
  final double aberration;
  final double glassTint;
  final double refraction;
  final double barBorderRadius;
  final double? indicatorBorderRadius;
  final ValueChanged<double> onPinchChanged;
  final ValueChanged<double> onExpansionHChanged;
  final ValueChanged<double> onExpansionVChanged;
  final ValueChanged<double> onAberrationChanged;
  final ValueChanged<double> onGlassTintChanged;
  final ValueChanged<double> onRefractionChanged;
  final ValueChanged<double> onBarBorderRadiusChanged;
  final ValueChanged<double> onIndicatorBorderRadiusChanged;
  final VoidCallback onResetIndicatorBorderRadius;

  @override
  State<_TunerPanel> createState() => _TunerPanelState();
}

class _TunerPanelState extends State<_TunerPanel> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !_isOpen ? () => setState(() => _isOpen = true) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _isOpen
              ? CupertinoColors.white.withValues(alpha: 0.09)
              : CupertinoColors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isOpen
                ? CupertinoColors.white.withValues(alpha: 0.18)
                : CupertinoColors.white.withValues(alpha: 0.10),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(19),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 汉化头部栏
              GestureDetector(
                onTap: () => setState(() => _isOpen = !_isOpen),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.tuningfork,
                          color: CupertinoColors.white.withValues(alpha: 0.70),
                          size: 14),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '实时调谐控制台 — 底栏、搜索栏与分段控件',
                          style: TextStyle(
                            color:
                                CupertinoColors.white.withValues(alpha: 0.55),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                      if (!_isOpen) ...[
                        _MiniValuePill(
                            label: '捏合',
                            value: widget.pinchStrength.toStringAsFixed(1),
                            color: const Color(0xFF5E3AFF)),
                        const SizedBox(width: 4),
                        _MiniValuePill(
                            label: '延展',
                            value:
                                '${widget.expansionH.round()}×${widget.expansionV.round()}',
                            color: const Color(0xFF0A84FF)),
                      ],
                      const SizedBox(width: 4),
                      AnimatedRotation(
                        turns: _isOpen ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 280),
                        curve: Curves.easeInOut,
                        child: Icon(
                          CupertinoIcons.chevron_down,
                          color: CupertinoColors.white.withValues(alpha: 0.4),
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 展开后的汉化滑块列表
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOut,
                child: _isOpen
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Divider(
                                height: 1,
                                thickness: 0.5,
                                color: Color(0x22FFFFFF)),
                            const SizedBox(height: 10),
                            _SliderRow(
                              label: '捏合收缩力度 (Pinch)',
                              value: widget.pinchStrength,
                              min: 0,
                              max: 1,
                              divisions: 20,
                              displayValue:
                                  widget.pinchStrength.toStringAsFixed(2),
                              accentColor: const Color(0xFF5E3AFF),
                              onChanged: widget.onPinchChanged,
                            ),
                            _SliderRow(
                              label: '水平动态延展 (Expansion H)',
                              value: widget.expansionH,
                              min: 0,
                              max: 28,
                              divisions: 28,
                              displayValue: '${widget.expansionH.round()} px',
                              accentColor: const Color(0xFF0A84FF),
                              onChanged: widget.onExpansionHChanged,
                            ),
                            _SliderRow(
                              label: '垂直动态延展 (Expansion V)',
                              value: widget.expansionV,
                              min: 0,
                              max: 20,
                              divisions: 20,
                              displayValue: '${widget.expansionV.round()} px',
                              accentColor: const Color(0xFF0A84FF),
                              onChanged: widget.onExpansionVChanged,
                            ),
                            _SliderRow(
                              label: '光学色散色差 (Aberration)',
                              value: widget.aberration,
                              min: 0,
                              max: 0.5,
                              divisions: 50,
                              displayValue:
                                  widget.aberration.toStringAsFixed(2),
                              accentColor: const Color(0xFFFF9F0A),
                              onChanged: widget.onAberrationChanged,
                            ),
                            _SliderRow(
                              label: '玻璃底色透明度 (Tint α)',
                              value: widget.glassTint,
                              min: 0,
                              max: 0.5,
                              divisions: 50,
                              displayValue: widget.glassTint.toStringAsFixed(2),
                              accentColor: const Color(0xFFBF5AF2),
                              onChanged: widget.onGlassTintChanged,
                            ),
                            _SliderRow(
                              label: '光学折射率 (Refraction n)',
                              value: widget.refraction,
                              min: 1.0,
                              max: 1.5,
                              divisions: 50,
                              displayValue:
                                  widget.refraction.toStringAsFixed(2),
                              accentColor: const Color(0xFF64D2FF),
                              onChanged: widget.onRefractionChanged,
                            ),
                            const SizedBox(height: 6),
                            const Divider(
                                height: 1,
                                thickness: 0.5,
                                color: Color(0x22FFFFFF)),
                            const SizedBox(height: 6),
                            _SliderRow(
                              label: '外底栏圆角 (Bar Radius)',
                              value: widget.barBorderRadius >= _kCapsuleSentinel
                                  ? _kSliderCapsuleThreshold
                                  : widget.barBorderRadius,
                              min: 4,
                              max: 36,
                              divisions: 32,
                              displayValue:
                                  widget.barBorderRadius >= _kCapsuleSentinel
                                      ? '纯胶囊 (默认)'
                                      : '${widget.barBorderRadius.round()} px',
                              accentColor: const Color(0xFFFF9F0A),
                              onChanged: (v) => widget.onBarBorderRadiusChanged(
                                v >= _kSliderCapsuleThreshold
                                    ? _kCapsuleSentinel
                                    : v,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '内指示器圆角 (Indicator Radius)',
                                        style: TextStyle(
                                          color: CupertinoColors.white
                                              .withValues(alpha: 0.7),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (widget.indicatorBorderRadius !=
                                              null)
                                            GestureDetector(
                                              onTap: widget
                                                  .onResetIndicatorBorderRadius,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(right: 6),
                                                child: Icon(
                                                  CupertinoIcons.refresh,
                                                  size: 14,
                                                  color: CupertinoColors.white
                                                      .withValues(alpha: 0.5),
                                                ),
                                              ),
                                            ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFF375F)
                                                  .withValues(
                                                alpha:
                                                    widget.indicatorBorderRadius ==
                                                            null
                                                        ? 0.1
                                                        : 0.2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              widget.indicatorBorderRadius ==
                                                      null
                                                  ? '自动计算'
                                                  : '${widget.indicatorBorderRadius!.round()} px',
                                              style: TextStyle(
                                                color: const Color(0xFFFF375F)
                                                    .withValues(
                                                  alpha:
                                                      widget.indicatorBorderRadius ==
                                                              null
                                                          ? 0.55
                                                          : 1.0,
                                                ),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                fontFeatures: const [
                                                  FontFeature.tabularFigures()
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: CupertinoSlider(
                                      value: (widget.indicatorBorderRadius ??
                                              (widget.barBorderRadius - 4)
                                                  .clamp(4.0, 30.0))
                                          .clamp(4.0, 30.0),
                                      min: 4,
                                      max: 30,
                                      divisions: 26,
                                      activeColor: const Color(0xFFFF375F),
                                      onChanged:
                                          widget.onIndicatorBorderRadiusChanged,
                                    ),
                                  ),
                                  if (widget.indicatorBorderRadius == null)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 2, bottom: 2),
                                      child: Text(
                                        widget.barBorderRadius >=
                                                _kCapsuleSentinel
                                            ? '自动: 纯胶囊 · 拖动可自定义覆盖'
                                            : '自动: 底栏 − 4 = ${(widget.barBorderRadius - 4).clamp(0, 999).round()} px · 拖动可自定义覆盖',
                                        style: TextStyle(
                                          color: CupertinoColors.white
                                              .withValues(alpha: 0.35),
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 辅助组件：迷你药丸标签
class _MiniValuePill extends StatelessWidget {
  const _MiniValuePill(
      {required this.label, required this.value, required this.color});
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '$label:$value',
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}

// 辅助组件：滑块行
class _SliderRow extends StatelessWidget {
  const _SliderRow({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.displayValue,
    required this.accentColor,
    required this.onChanged,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final String displayValue;
  final Color accentColor;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: CupertinoColors.white.withValues(alpha: 0.7),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  displayValue,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
            child: CupertinoSlider(
              value: value.clamp(min, max),
              min: min,
              max: max,
              divisions: divisions,
              activeColor: accentColor,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

// 辅助组件：板块容器
class _WidgetSection extends StatelessWidget {
  const _WidgetSection({
    required this.label,
    required this.color,
    required this.child,
  });

  final String label;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: CupertinoColors.white.withValues(alpha: 0.55),
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

// 辅助组件：实时代码片段
class _LiveValuesBadge extends StatelessWidget {
  const _LiveValuesBadge({
    required this.pinchStrength,
    required this.expansionH,
    required this.expansionV,
    required this.aberration,
  });

  final double pinchStrength;
  final double expansionH;
  final double expansionV;
  final double aberration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: CupertinoColors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 汉化代码片段标题
          Text(
            '当前物理调参实时代码片段',
            style: TextStyle(
              color: CupertinoColors.white.withValues(alpha: 0.4),
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _buildSnippet(),
            style: const TextStyle(
              color: Color(0xFF9EF8A8),
              fontSize: 11,
              fontFamily: 'Menlo',
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  String _buildSnippet() {
    final h = expansionH.round();
    final v = expansionV.round();
    final pinch = pinchStrength.toStringAsFixed(2);
    final aber = aberration.toStringAsFixed(2);
    return 'GlassTabBar.bottom(\n'
        '  indicatorPinchStrength: $pinch,\n'
        '  indicatorExpansion: EdgeInsets.symmetric(\n'
        '    horizontal: $h, vertical: $v,\n'
        '  ),\n'
        '  indicatorSettings:\n'
        '    AnimatedGlassIndicator.baseIndicatorSettings\n'
        '      .copyWith(chromaticAberration: $aber),\n'
        '  // 以上物理参数在 4 个流体组件上完全通用 ↑\n'
        ')';
  }
}

// 装饰光晕背景圆球
class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.color, required this.size});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: 0.45),
            color.withValues(alpha: 0.0),
          ],
        ),
      ),
    );
  }
}
