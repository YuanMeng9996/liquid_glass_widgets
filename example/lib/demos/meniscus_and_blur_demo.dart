// 声明当前 Dart 库文件
library;

// 导入 Flutter 官方 Cupertino 风格 iOS 拟真组件库
import 'package:flutter/cupertino.dart';
// 导入 liquid_glass_widgets 流体玻璃渲染核心组件库
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

// 异步主函数入口点
void main() async {
  // 初始化 Flutter 底层绑定
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化流体玻璃着色器
  await LiquidGlassWidgets.initialize();
  // 启动 Demo 应用
  runApp(LiquidGlassWidgets.wrap(child: const MeniscusAndBlurDemoApp()));
}

// 演示应用根 StatelessWidget
class MeniscusAndBlurDemoApp extends StatelessWidget {
  const MeniscusAndBlurDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      // 汉化应用标题
      title: '光学边缘暗化与 24 抽样模糊实验室',
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: MeniscusAndBlurDemoPage(),
    );
  }
}

// 边缘暗化与模糊实验室 StatefulWidget
class MeniscusAndBlurDemoPage extends StatefulWidget {
  const MeniscusAndBlurDemoPage({super.key});

  @override
  State<MeniscusAndBlurDemoPage> createState() =>
      _MeniscusAndBlurDemoPageState();
}

// 边缘暗化与模糊实验室 State 类
class _MeniscusAndBlurDemoPageState extends State<MeniscusAndBlurDemoPage> {
  // 比尔-朗伯定律边缘吸光率 (edgeAbsorption)
  double _edgeAbsorption = 0.0;
  // 菲涅尔发丝高光边缘强度 (fresnelStrength)
  double _fresnelStrength = 1.0;
  // 玻璃物理厚度
  double _thickness = 25.0;
  // 24-Tap 渐进模糊半径 (blur)
  double _blur = 12.0;

  // 各组件交互状态
  int _segmentIndex = 0;
  int _tabBarPillIndex = 0;
  int _tabBarNavIndex = 1;
  double _sliderValue = 0.55;
  bool _switchValue = true;
  bool _switch2Value = false;
  int _backgroundIndex = 1;
  bool _isDarkMode = true;

  // 汉化折射渐变背景预设
  static const List<(String, List<Color>)> _backgrounds = [
    (
      '日落余晖',
      [
        Color(0xFFFF5E3A),
        Color(0xFFFF2A68),
        Color(0xFF8E2DE2),
        Color(0xFF4A00E0)
      ]
    ),
    (
      '深邃太平洋',
      [
        Color(0xFF00C6FF),
        Color(0xFF0072FF),
        Color(0xFF0A1128),
        Color(0xFF001F3F)
      ]
    ),
    (
      '翡翠森林',
      [
        Color(0xFF11998E),
        Color(0xFF38EF7D),
        Color(0xFF0575E6),
        Color(0xFF021B79)
      ]
    ),
    (
      '极简黑白',
      [
        Color(0xFFE0E0E0),
        Color(0xFF9E9E9E),
        Color(0xFF424242),
        Color(0xFF121212)
      ]
    ),
  ];

  // 动态构建表面玻璃设置
  LiquidGlassSettings get _liveSettings => LiquidGlassSettings(
        thickness: _thickness,
        blur: _blur,
        edgeAbsorption: _edgeAbsorption,
        fresnelStrength: _fresnelStrength,
        lightIntensity: 0.8,
        glassColor: _isDarkMode
            ? const Color.fromARGB(25, 255, 255, 255)
            : const Color.fromARGB(40, 255, 255, 255),
      );

  // 动态构建指示器光学设置
  LiquidGlassSettings get _indicatorLiveSettings =>
      AnimatedGlassIndicator.baseIndicatorSettings.copyWith(
        edgeAbsorption: _edgeAbsorption,
        fresnelStrength: _fresnelStrength,
      );

  @override
  Widget build(BuildContext context) {
    final currentBg = _backgrounds[_backgroundIndex];
    final labelColor =
        _isDarkMode ? CupertinoColors.white : CupertinoColors.black;

    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      child: GlassScaffold(
        topEdgeFade: true,
        // 汉化应用栏标题
        appBar: GlassAppBar(
          title: const Text('光学边缘暗化与 24 抽样模糊实验室'),
          actions: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
              child: Icon(
                _isDarkMode
                    ? CupertinoIcons.sun_max_fill
                    : CupertinoIcons.moon_fill,
                color: _isDarkMode
                    ? CupertinoColors.systemYellow
                    : CupertinoColors.systemPurple,
              ),
            ),
          ],
        ),
        background: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: currentBg.$2,
            ),
          ),
          child: CustomPaint(
            painter: _GridPatternPainter(isDark: _isDarkMode),
            child: const SizedBox.expand(),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
            children: [
              // ── 1. 汉化背景选择区 ──────────────────────────────────────────
              _sectionHeader('1. 动态折射背景切换'),
              const SizedBox(height: 8),
              _backgroundPicker(),
              const SizedBox(height: 28),

              // ── 2. 汉化物理参数调参器 ──────────────────────────────────────
              _sectionHeader('2. 实时物理着色器调参器'),
              const SizedBox(height: 8),
              GlassCard(
                useOwnLayer: true,
                padding: const EdgeInsets.all(20),
                shape: const LiquidRoundedSuperellipse(borderRadius: 22),
                settings: _liveSettings,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: CupertinoColors.activeBlue
                                .withValues(alpha: 0.18),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.sparkles,
                            color: CupertinoColors.activeBlue,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 汉化比尔-朗伯定律标题
                              Text(
                                '比尔-朗伯定律边缘吸光 (Beer-Lambert)',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: labelColor,
                                ),
                              ),
                              const SizedBox(height: 2),
                              // 汉化说明
                              Text(
                                '下方所有流体玻璃控件均实时响应此参数',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: labelColor.withValues(alpha: 0.55),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // 汉化快捷预设按钮
                    Row(
                      children: [
                        _presetChip('纯平 (0.0)', 0.0),
                        const SizedBox(width: 8),
                        _presetChip('iOS 26 标准 (0.15)', 0.15),
                        const SizedBox(width: 8),
                        _presetChip('晶莹水晶 (0.35)', 0.35),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // 汉化四大物理滑块
                    _slider(
                      label: '边缘吸光率 (Edge Absorption)',
                      value: _edgeAbsorption,
                      min: 0.0,
                      max: 0.60,
                      onChanged: (v) => setState(() => _edgeAbsorption = v),
                    ),
                    _slider(
                      label: '菲涅尔高光边缘强度 (Fresnel)',
                      value: _fresnelStrength,
                      min: 0.0,
                      max: 2.0,
                      onChanged: (v) => setState(() => _fresnelStrength = v),
                    ),
                    _slider(
                      label: '玻璃物理厚度 (Thickness)',
                      value: _thickness,
                      min: 5.0,
                      max: 60.0,
                      onChanged: (v) => setState(() => _thickness = v),
                    ),
                    _slider(
                      label: '模糊半径 (24-Tap Progressive)',
                      value: _blur,
                      min: 0.0,
                      max: 30.0,
                      onChanged: (v) => setState(() => _blur = v),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // ── 3. 汉化边缘暗化卡片对比 ────────────────────────────────────
              _sectionHeader('3. 边缘暗化光学对比 — 玻璃卡片'),
              const SizedBox(height: 4),
              Text(
                '拖动上方的边缘吸光率滑块观察边缘暗化对比。',
                style: TextStyle(
                    fontSize: 12, color: labelColor.withValues(alpha: 0.5)),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _comparisonCard(
                      label: '无暗化  0.0',
                      absorption: 0.0,
                      icon: CupertinoIcons.circle,
                      accent: CupertinoColors.systemGrey,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _comparisonCard(
                      label: '实时调谐  ${_edgeAbsorption.toStringAsFixed(2)}',
                      absorption: _edgeAbsorption,
                      icon: CupertinoIcons.sparkles,
                      accent: CupertinoColors.activeBlue,
                      active: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // ── 4. 汉化分段控制器胶囊 ──────────────────────────────────────
              _sectionHeader('4. 动态胶囊指示器 — 分段控制器'),
              const SizedBox(height: 4),
              Text(
                '在分段间拖拽滑动 — 观察运动胶囊上的半月板边缘折射深度。',
                style: TextStyle(
                    fontSize: 12, color: labelColor.withValues(alpha: 0.5)),
              ),
              const SizedBox(height: 10),
              GlassSegmentedControl(
                selectedIndex: _segmentIndex,
                onSegmentSelected: (i) => setState(() => _segmentIndex = i),
                indicatorSettings: _indicatorLiveSettings,
                segments: const [
                  GlassSegment(label: '平面模式'),
                  GlassSegment(label: 'iOS 26 模式'),
                  GlassSegment(label: '水晶模式'),
                ],
              ),
              const SizedBox(height: 28),

              // ── 5. 汉化玻璃滑块 ────────────────────────────────────────────
              _sectionHeader('5. 动态胶囊指示器 — 玻璃滑块'),
              const SizedBox(height: 4),
              Text(
                '滑块圆钮同样基于动态玻璃指示器渲染 — 继承相同的光学暗化。',
                style: TextStyle(
                    fontSize: 12, color: labelColor.withValues(alpha: 0.5)),
              ),
              const SizedBox(height: 10),
              GlassSlider(
                value: _sliderValue,
                onChanged: (v) => setState(() => _sliderValue = v),
                settings: _indicatorLiveSettings,
              ),
              const SizedBox(height: 28),

              // ── 6. 汉化玻璃开关 ────────────────────────────────────────────
              _sectionHeader('6. 动态胶囊指示器 — 拟真玻璃开关'),
              const SizedBox(height: 4),
              Text(
                '圆形开关旋钮采用相同的光学折射渲染管线。',
                style: TextStyle(
                    fontSize: 12, color: labelColor.withValues(alpha: 0.5)),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _switchRow(
                      label: '启用流体特性',
                      value: _switchValue,
                      onChanged: (v) => setState(() => _switchValue = v),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _switchRow(
                      label: '深色高对比度',
                      value: _switch2Value,
                      onChanged: (v) => setState(() => _switch2Value = v),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // ── 7. 汉化旗舰级标签栏 ────────────────────────────────────────
              _sectionHeader('7. 旗舰级流体玻璃标签栏 (2 种变体)'),
              const SizedBox(height: 4),
              Text(
                '全套 GlassQuality.premium 管线 — 菲涅尔发丝级高光边缘与果冻弹性物理追踪。',
                style: TextStyle(
                    fontSize: 12, color: labelColor.withValues(alpha: 0.5)),
              ),
              const SizedBox(height: 12),

              // 变体 1
              Text(
                '变体 1：胶囊内嵌纯文本切换器',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: labelColor.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 8),
              GlassTabBar.inline(
                quality: GlassQuality.premium,
                selectedIndex: _tabBarPillIndex,
                onTabSelected: (i) => setState(() => _tabBarPillIndex = i),
                settings: _liveSettings,
                indicatorSettings: _indicatorLiveSettings,
                tabs: const [
                  GlassTab(label: '概览'),
                  GlassTab(label: '光学折射'),
                  GlassTab(label: '半月板暗化'),
                  GlassTab(label: '物理动效'),
                ],
              ),
              const SizedBox(height: 18),

              // 变体 2
              Text(
                '变体 2：图标+文字发光导航栏',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: labelColor.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 8),
              GlassTabBar.inline(
                quality: GlassQuality.premium,
                barHeight: 56,
                iconSize: 20,
                labelFontSize: 11,
                iconLabelSpacing: 3,
                tabPadding: const EdgeInsets.symmetric(horizontal: 6),
                selectedIndex: _tabBarNavIndex,
                onTabSelected: (i) => setState(() => _tabBarNavIndex = i),
                settings: _liveSettings,
                indicatorSettings: _indicatorLiveSettings,
                tabs: const [
                  GlassTab(
                    icon: Icon(CupertinoIcons.sparkles),
                    label: '半月板',
                    glowColor: CupertinoColors.activeBlue,
                  ),
                  GlassTab(
                    icon: Icon(CupertinoIcons.waveform_path),
                    label: '光学',
                    glowColor: CupertinoColors.systemIndigo,
                  ),
                  GlassTab(
                    icon: Icon(CupertinoIcons.slider_horizontal_3),
                    label: '调谐器',
                    glowColor: CupertinoColors.systemTeal,
                  ),
                  GlassTab(
                    icon: Icon(CupertinoIcons.cube_box),
                    label: '倒角',
                    glowColor: CupertinoColors.systemPurple,
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // ── 8. 汉化 24 采样渐进模糊 ────────────────────────────────────
              _sectionHeader('8. 24 采样渐进式模糊 (IIR 优化算法)'),
              const SizedBox(height: 4),
              Text(
                '带宽降低 50% · 零阶梯伪影 · 循环内部无超越函数 exp() 性能开销',
                style: TextStyle(
                    fontSize: 12, color: labelColor.withValues(alpha: 0.5)),
              ),
              const SizedBox(height: 10),
              _progressiveBlurShowcase(labelColor),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // 背景选择器
  Widget _backgroundPicker() {
    return Row(
      children: List.generate(_backgrounds.length, (idx) {
        final isSelected = _backgroundIndex == idx;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _backgroundIndex = idx),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin:
                  EdgeInsets.only(right: idx < _backgrounds.length - 1 ? 8 : 0),
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _backgrounds[idx].$2,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected
                      ? CupertinoColors.white
                      : CupertinoColors.transparent,
                  width: 2.5,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: CupertinoColors.black.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ]
                    : null,
              ),
              alignment: Alignment.center,
              child: isSelected
                  ? const Icon(CupertinoIcons.checkmark_alt,
                      color: CupertinoColors.white, size: 18)
                  : null,
            ),
          ),
        );
      }),
    );
  }

  // 对比卡片
  Widget _comparisonCard({
    required String label,
    required double absorption,
    required IconData icon,
    required Color accent,
    bool active = false,
  }) {
    return GlassCard(
      useOwnLayer: true,
      padding: const EdgeInsets.all(16),
      shape: const LiquidRoundedSuperellipse(borderRadius: 18),
      settings: LiquidGlassSettings(
        thickness: _thickness,
        blur: _blur,
        edgeAbsorption: absorption,
        fresnelStrength: _fresnelStrength,
        lightIntensity: 0.8,
        glassColor: _isDarkMode
            ? const Color.fromARGB(25, 255, 255, 255)
            : const Color.fromARGB(40, 255, 255, 255),
      ),
      child: Column(
        children: [
          Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: active ? 0.14 : 0.05),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: accent.withValues(alpha: active ? 0.35 : 0.1)),
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: accent, size: 24),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color:
                  _isDarkMode ? CupertinoColors.white : CupertinoColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            active ? '比尔-朗伯定律边缘暗化' : '无边缘吸光暗化',
            style: const TextStyle(
                fontSize: 11, color: CupertinoColors.systemGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // 开关行
  Widget _switchRow({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color:
                  _isDarkMode ? CupertinoColors.white : CupertinoColors.black,
            ),
          ),
        ),
        GlassSwitch(
          quality: GlassQuality.premium,
          value: value,
          onChanged: onChanged,
          settings: _liveSettings,
        ),
      ],
    );
  }

  // 渐进式模糊展示
  Widget _progressiveBlurShowcase(Color labelColor) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CupertinoColors.white.withValues(alpha: 0.15),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.speedometer,
                  size: 36,
                  color: labelColor,
                ),
                const SizedBox(height: 8),
                Text(
                  '半核 48 优化至 24 · IIR 乘法递推算法',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: labelColor),
                ),
                const SizedBox(height: 4),
                Text(
                  '模糊核心循环中 0 超越指数函数 exp() 开销',
                  style: TextStyle(
                      fontSize: 11, color: labelColor.withValues(alpha: 0.55)),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: ProgressiveBlur(
              maxSigma: _blur.clamp(4, 30),
              direction: ProgressiveBlurDirection.topToBottom,
            ),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: CupertinoColors.black.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'σ = ${_blur.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: CupertinoColors.white,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 章节标题
  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
        color: CupertinoColors.systemGrey,
      ),
    );
  }

  // 预设芯片
  Widget _presetChip(String label, double value) {
    final isSelected = (_edgeAbsorption - value).abs() < 0.01;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _edgeAbsorption = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? CupertinoColors.activeBlue
                : CupertinoColors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected
                  ? CupertinoColors.white
                  : (_isDarkMode
                      ? CupertinoColors.white
                      : CupertinoColors.black),
            ),
          ),
        ),
      ),
    );
  }

  // 物理滑块通用行
  Widget _slider({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _isDarkMode
                      ? CupertinoColors.white
                      : CupertinoColors.black,
                ),
              ),
              Text(
                value.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: CupertinoColors.activeBlue,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          CupertinoSlider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

// 动态网格背景绘制器
class _GridPatternPainter extends CustomPainter {
  const _GridPatternPainter({required this.isDark});

  final bool isDark;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = (isDark ? CupertinoColors.white : CupertinoColors.black)
          .withValues(alpha: 0.07)
      ..strokeWidth = 1.0;

    const spacing = 24.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    final dotPaint = Paint()
      ..color = (isDark ? CupertinoColors.white : CupertinoColors.black)
          .withValues(alpha: 0.13);
    for (double x = spacing; x < size.width; x += spacing * 2) {
      for (double y = spacing; y < size.height; y += spacing * 2) {
        canvas.drawCircle(Offset(x, y), 2.5, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _GridPatternPainter old) => isDark != old.isDark;
}
