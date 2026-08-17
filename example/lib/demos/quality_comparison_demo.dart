// 声明当前 Dart 库文件，支持作为独立测试 Demo 运行
library;

// 导入 Flutter 官方 Cupertino 风格 iOS 拟真交互控件库
import 'package:flutter/cupertino.dart';
// 导入 Flutter 核心 Material Design 基础组件库
import 'package:flutter/material.dart';

// 导入 liquid_glass_widgets 流体玻璃渲染核心组件库
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

// ── 预设主题色彩模型类（用于画质对比测试）────────────────────────────────────────
// 声明主题预设数据承载类
class _ThemePreset {
  // 主题预设名称字符串
  final String name;
  // 玻璃材质基础底色
  final Color glassColor;
  // 玻璃基础不透明度（Alpha 通道）
  final double baseOpacity;
  // 玻璃物理厚度（影响高光和折射边缘宽度）
  final double thickness;
  // 光照反射高光强度
  final double lightIntensity;
  // 背景模糊高斯模糊半径
  final double blur;
  // 环境漫反射光强
  final double ambient;
  // 玻璃色彩饱和度系数
  final double saturation;
  // 玻璃物理光学折射率 (IOR)
  final double refractiveIndex;

  // 常量构造函数，初始化所有物理渲染参数
  const _ThemePreset({
    // 必需的主题中文名称
    required this.name,
    // 必需的玻璃颜色
    required this.glassColor,
    // 必需的基础透明度
    required this.baseOpacity,
    // 必需的玻璃厚度
    required this.thickness,
    // 必需的光照强度
    required this.lightIntensity,
    // 必需的模糊半径
    required this.blur,
    // 必需的环境光强
    required this.ambient,
    // 必需的饱和度
    required this.saturation,
    // 必需的折射率
    required this.refractiveIndex,
  });
}

// 定义 8 套汉化后的高级光学主题色彩预设数组
const _kThemePresets = [
  // 预设 1：默认纯白（经典苹果透明玻璃风格）
  _ThemePreset(
    // 中文名称：默认纯白
    name: '默认纯白',
    // 纯白底色
    glassColor: CupertinoColors.white,
    // 基础不透明度 12%
    baseOpacity: 0.12,
    // 物理厚度 28 像素
    thickness: 28.0,
    // 光照反射强度 0.9
    lightIntensity: 0.9,
    // 模糊半径 3.0
    blur: 3.0,
    // 环境漫反射 0.22
    ambient: 0.22,
    // 饱和度 1.2
    saturation: 1.2,
    // 折射率 1.25
    refractiveIndex: 1.25,
  ),
  // 预设 2：翡翠薄荷（高饱和度清新青绿风格）
  _ThemePreset(
    // 中文名称：翡翠薄荷
    name: '翡翠薄荷',
    // 青绿色玻璃底色
    glassColor: Color(0xFF80CBC4),
    // 基础不透明度 35%
    baseOpacity: 0.35,
    // 物理厚度 30 像素
    thickness: 30.0,
    // 光照反射强度 1.1
    lightIntensity: 1.1,
    // 模糊半径 4.5
    blur: 4.5,
    // 环境漫反射 0.28
    ambient: 0.28,
    // 饱和度 1.5
    saturation: 1.5,
    // 折射率 1.30
    refractiveIndex: 1.30,
  ),
  // 预设 3：黑曜之夜（极深暗黑系流体玻璃）
  _ThemePreset(
    // 中文名称：黑曜之夜
    name: '黑曜之夜',
    // 黑曜石深色
    glassColor: Color(0xFF1E1E24),
    // 基础不透明度 48%
    baseOpacity: 0.48,
    // 物理厚度 18 像素
    thickness: 18.0,
    // 光照反射强度 0.65
    lightIntensity: 0.65,
    // 模糊半径 4.0
    blur: 4.0,
    // 环境漫反射 0.12
    ambient: 0.12,
    // 饱和度 0.95
    saturation: 0.95,
    // 折射率 1.18
    refractiveIndex: 1.18,
  ),
  // 预设 4：赛博霓虹（荧光洋红极客电竞风格）
  _ThemePreset(
    // 中文名称：赛博霓虹
    name: '赛博霓虹',
    // 荧光洋红色
    glassColor: Color(0xFFFF007F),
    // 基础不透明度 22%
    baseOpacity: 0.22,
    // 物理厚度 34 像素
    thickness: 34.0,
    // 光照反射强度 1.35
    lightIntensity: 1.35,
    // 模糊半径 5.5
    blur: 5.5,
    // 环境漫反射 0.32
    ambient: 0.32,
    // 饱和度 1.7
    saturation: 1.7,
    // 折射率 1.40
    refractiveIndex: 1.40,
  ),
  // 预设 5：磨砂古铜（奢华暖色调皮革质感）
  _ThemePreset(
    // 中文名称：磨砂古铜
    name: '磨砂古铜',
    // 古铜暖棕色
    glassColor: Color(0xFFD2B48C),
    // 基础不透明度 20%
    baseOpacity: 0.20,
    // 物理厚度 26 像素
    thickness: 26.0,
    // 光照反射强度 1.0
    lightIntensity: 1.0,
    // 模糊半径 6.0
    blur: 6.0,
    // 环境漫反射 0.24
    ambient: 0.24,
    // 饱和度 1.3
    saturation: 1.3,
    // 折射率 1.28
    refractiveIndex: 1.28,
  ),
  // 预设 6：极地冰川（清澈透明浅青冰晶风格）
  _ThemePreset(
    // 中文名称：极地冰川
    name: '极地冰川',
    // 冰晶浅青色
    glassColor: Color(0xFFE0F7FA),
    // 基础不透明度 10%
    baseOpacity: 0.10,
    // 物理厚度 32 像素
    thickness: 32.0,
    // 光照反射强度 1.2
    lightIntensity: 1.2,
    // 模糊半径 2.0
    blur: 2.0,
    // 环境漫反射 0.18
    ambient: 0.18,
    // 饱和度 1.25
    saturation: 1.25,
    // 折射率 1.35
    refractiveIndex: 1.35,
  ),
  // 预设 7：皇家紫晶（典雅高贵淡紫晶石）
  _ThemePreset(
    // 中文名称：皇家紫晶
    name: '皇家紫晶',
    // 淡紫色
    glassColor: Color(0xFFE1BEE7),
    // 基础不透明度 16%
    baseOpacity: 0.16,
    // 物理厚度 28 像素
    thickness: 28.0,
    // 光照反射强度 0.95
    lightIntensity: 0.95,
    // 模糊半径 5.0
    blur: 5.0,
    // 环境漫反射 0.26
    ambient: 0.26,
    // 饱和度 1.4
    saturation: 1.4,
    // 折射率 1.26
    refractiveIndex: 1.26,
  ),
  // 预设 8：极光幻彩（北极光青绿流动光效）
  _ThemePreset(
    // 中文名称：极光幻彩
    name: '极光幻彩',
    // 极光青绿色
    glassColor: Color(0xFFB2DFDB),
    // 基础不透明度 14%
    baseOpacity: 0.14,
    // 物理厚度 29 像素
    thickness: 29.0,
    // 光照反射强度 1.05
    lightIntensity: 1.05,
    // 模糊半径 4.0
    blur: 4.0,
    // 环境漫反射 0.20
    ambient: 0.20,
    // 饱和度 1.45
    saturation: 1.45,
    // 折射率 1.27
    refractiveIndex: 1.27,
  ),
];

// ── Standard 轻量级着色器各组件默认参数 ──────────────────────────────────────
// 胶囊指示器的轻量拟合默认参数
const _kPillDefault = _Preset(
  thickness: 1.0, ambient: 0.28, glow: 0.50, light: 1.0,
  blur: 3.0,
  stdOpacityMultiplier: 1.0,
);
// 按钮组件的轻量拟合默认参数
const _kBtnDefault = _Preset(
  thickness: 17, ambient: 0.28, glow: 0.65, light: 0.88,
  blur: 3.0,
  stdOpacityMultiplier: 1.0,
);
// 卡片与表面组件的轻量拟合默认参数
const _kCardDefault = _Preset(
  thickness: 19, ambient: 0.26, glow: 0.0, light: 0.90,
  blur: 3.0,
  stdOpacityMultiplier: 1.0,
);

// 异步主函数入口点
void main() async {
  // 确保 Flutter 绑定初始化
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化流体玻璃着色器
  await LiquidGlassWidgets.initialize();
  // 启动 Demo 应用
  runApp(LiquidGlassWidgets.wrap(
    // 开启自适应画质降级模式
    adaptiveQuality: true,
    child: const _App(),
  ));
}

// 示例应用入口无状态组件
class _App extends StatelessWidget {
  // 构造函数
  const _App();

  // 构建根应用组件
  @override
  Widget build(BuildContext context) {
    // 返回 CupertinoApp 容器
    return CupertinoApp(
      // 设置标题
      title: '画质分级对比测试',
      // 禁用 Debug 标识
      debugShowCheckedModeBanner: false,
      // 默认暗黑主题
      theme: const CupertinoThemeData(brightness: Brightness.dark),
      // 包装 Material 主题
      builder: (context, child) => Theme(
        data: ThemeData.dark(useMaterial3: true),
        child: child!,
      ),
      // 首页组件为画质对比展示页
      home: const GlassQualityComparisonDemo(),
    );
  }
}

// 画质分级对比演示 StatefulWidget
class GlassQualityComparisonDemo extends StatefulWidget {
  // 构造函数
  const GlassQualityComparisonDemo({super.key});

  // 创建 State
  @override
  State<GlassQualityComparisonDemo> createState() =>
      GlassQualityComparisonDemoState();
}

// 画质对比 State 状态管理类
class GlassQualityComparisonDemoState
    extends State<GlassQualityComparisonDemo> {
  // 分段控件当前选中索引
  int _segIndex = 0;
  // 标签栏当前选中索引
  int _tabIndex = 0;
  // 开关控件状态
  bool _switchValue = false;
  // 滑块当前数值
  double _sliderValue = 0.4;

  // 是否展开高级调优面板的状态标志
  bool _showTuning = false;

  // 当前应用的各轻量组件调优参数
  _Preset _pill = _kPillDefault;
  _Preset _btn = _kBtnDefault;
  _Preset _card = _kCardDefault;

  // 当前选中的主题预设索引
  int _selectedPresetIndex = 0;
  // 响应式玻璃颜色
  Color _glassColor = _kThemePresets[0].glassColor;
  // 响应式基础透明度
  double _baseOpacity = _kThemePresets[0].baseOpacity;
  // 响应式厚度
  double _thickness = _kThemePresets[0].thickness;
  // 响应式光强
  double _lightIntensity = _kThemePresets[0].lightIntensity;
  // 响应式模糊
  double _blur = _kThemePresets[0].blur;
  // 响应式环境光
  double _ambient = _kThemePresets[0].ambient;
  // 响应式饱和度
  double _saturation = _kThemePresets[0].saturation;
  // 响应式折射率
  double _refractiveIndex = _kThemePresets[0].refractiveIndex;

  // 计算旗舰 (Premium) 动态渲染设置
  LiquidGlassSettings get _kGlass => LiquidGlassSettings(
        glassColor: _glassColor.withValues(alpha: _baseOpacity),
        blur: _blur,
        thickness: _thickness,
        lightIntensity: _lightIntensity,
        ambientStrength: _ambient,
        chromaticAberration: 0.02,
        refractiveIndex: _refractiveIndex,
        saturation: _saturation,
      );

  // 计算标准 (Standard) 胶囊设置
  LiquidGlassSettings get _kGlassPill => _pill.toSettings(_kGlass.glassColor);
  // 计算标准 (Standard) 按钮设置
  LiquidGlassSettings get _kGlassBtn => _btn.toSettings(_kGlass.glassColor);
  // 计算标准 (Standard) 卡片设置
  LiquidGlassSettings get _kGlassCard => _card.toSettings(_kGlass.glassColor);

  // 构建整个页面布局
  @override
  Widget build(BuildContext context) {
    // 使用层叠 Stack 布局背景和流体玻璃页面
    return Stack(
      // 撑满整个屏幕尺寸
      fit: StackFit.expand,
      // 子组件列表
      children: [
        // 高清山脉风景壁纸背景
        Image.asset('assets/mountain_landscape.jpg', fit: BoxFit.cover),
        // 半透明暗色遮罩层以增强文字可读性
        Container(color: CupertinoColors.black.withValues(alpha: 0.28)),

        // 流体玻璃页面包裹容器
        GlassPage(
          // 内部脚手架
          child: GlassScaffold(
            // 设置脚手架背景为全透明
            backgroundColor: const Color(0x00000000),
            // 安全区域
            body: SafeArea(
              // 纵向排版
              child: Column(
                // 横向拉伸
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // 子项列表
                children: [
                  // 构建顶部标题与预设选择区
                  _buildHeader(),
                  // 如果展开了调参面板，则渲染高级控制台
                  if (_showTuning)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: SizedBox(
                        height: 280,
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                CupertinoColors.black.withValues(alpha: 0.45),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: CupertinoColors.white
                                    .withValues(alpha: 0.1)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SingleChildScrollView(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [\n                                  // 旗舰级 3D SDF 参数调优板块
                                  _buildPremiumTuningPanel(),
                                  SizedBox(height: 16),
                                  // 标准级 2D 着色器参数拟合板块
                                  _buildStandardTuningPanel(),
                                  SizedBox(height: 16),
                                  // 实时参数数学诊断信息
                                  _buildDiagnosticsPanel(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 8),
                  // 构建双列画质对比标签徽章（PREMIUM vs STANDARD）
                  _buildColumnLabels(),
                  SizedBox(height: 4),
                  // 构建滚动展示的具体对比组件列表
                  Expanded(child: _buildComparisonList()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── 构建页面顶部区域 ─────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 16, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // 汉化主标题：画质分级对比
                child: Text(
                  '画质分级对比 (Premium vs Standard)',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          // 汉化预设标题：主题预设
          Text(
            '主题材质预设 (THEME PRESETS)',
            style: TextStyle(
              color: CupertinoColors.white.withValues(alpha: 0.38),
              fontSize: 9,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 6),
          // 水平滚动的主题预设选择器
          SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _kThemePresets.length,
              itemBuilder: (context, index) {
                final preset = _kThemePresets[index];
                final isSelected = _selectedPresetIndex == index;
                final presetColor = preset.glassColor;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPresetIndex = index;
                      _glassColor = preset.glassColor;
                      _baseOpacity = preset.baseOpacity;
                      _thickness = preset.thickness;
                      _lightIntensity = preset.lightIntensity;
                      _blur = preset.blur;
                      _ambient = preset.ambient;
                      _saturation = preset.saturation;
                      _refractiveIndex = preset.refractiveIndex;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? presetColor.withValues(alpha: 0.2)
                          : CupertinoColors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? presetColor.withValues(alpha: 0.8)
                            : CupertinoColors.white.withValues(alpha: 0.08),
                        width: isSelected ? 1.5 : 1.0,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: presetColor.withValues(alpha: 0.25),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              )
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: presetColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: presetColor.withValues(alpha: 0.5),
                                blurRadius: 4,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          preset.name,
                          style: TextStyle(
                            color: isSelected
                                ? CupertinoColors.white
                                : CupertinoColors.white.withValues(alpha: 0.70),
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 12),

          // 汉化高级调参折叠开关按钮
          GestureDetector(
            onTap: () => setState(() => _showTuning = !_showTuning),
            child: Row(
              children: [
                Text(
                  _showTuning
                      ? '▲ 收起高级物理调优面板'
                      : '▼ 展开高级物理调优面板 (Premium & Standard)',
                  style: TextStyle(
                    color: CupertinoColors.white.withValues(alpha: 0.55),
                    fontSize: 11,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (!_showTuning) ...[
                  SizedBox(width: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB830).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    // 汉化徽章：旗舰参数覆盖
                    child: Text(
                      '旗舰覆盖',
                      style: TextStyle(
                        color: Color(0xFFFFB830),
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 汉化旗舰级参数调参面板
  Widget _buildPremiumTuningPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '全局旗舰画质配置 (3D SDF Impeller 光学模型)',
          style: TextStyle(
            color: Color(0xFFFFB830),
            fontSize: 9,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        SizedBox(height: 8),
        _Slider('不透明度', _baseOpacity, 0.01, 1.0,
            (v) => setState(() => _baseOpacity = v),
            color: CupertinoColors.white),
        _Slider('玻璃厚度', _thickness, 1.0, 60.0,
            (v) => setState(() => _thickness = v),
            color: CupertinoColors.white),
        _Slider('镜面反射', _lightIntensity, 0.0, 2.5,
            (v) => setState(() => _lightIntensity = v),
            color: CupertinoColors.white),
        _Slider('模糊半径', _blur, 0.0, 20.0, (v) => setState(() => _blur = v),
            color: CupertinoColors.white),
        _Slider(
            '环境光强', _ambient, 0.0, 0.6, (v) => setState(() => _ambient = v),
            color: CupertinoColors.white),
        _Slider('色彩饱和', _saturation, 0.0, 3.0,
            (v) => setState(() => _saturation = v),
            color: CupertinoColors.white),
        _Slider('光学折射', _refractiveIndex, 1.0, 2.0,
            (v) => setState(() => _refractiveIndex = v),
            color: CupertinoColors.white),
      ],
    );
  }

  // 汉化标准级参数调参面板
  Widget _buildStandardTuningPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '仅标准画质微调  ·  旗舰画质已锁定对比',
              style: TextStyle(
                  color: Color(0xFF5AC8FA),
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _pill = _kPillDefault;
                  _btn = _kBtnDefault;
                  _card = _kCardDefault;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF5AC8FA).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: const Color(0xFF5AC8FA).withValues(alpha: 0.3)),
                ),
                Text(
                  '恢复默认值',
                  style: TextStyle(
                    color: Color(0xFF5AC8FA),
                    fontSize: 7,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2, width: double.infinity),
        Text(
          '饱和度 → 背景增强  ·  环境光 → 亮度提升  ·  辉光 → 边缘高光',
          style: TextStyle(
              color: CupertinoColors.white.withValues(alpha: 0.24),
              fontSize: 8,
              fontFamily: 'monospace'),
        ),
        SizedBox(height: 8),
        _PresetSection(
            label: '● 胶囊 / 动态指示器',
            color: const Color(0xFF5AC8FA),
            preset: _pill,
            onChanged: (p) => setState(() => _pill = p),
            thicknessMin: 0.1,
            thicknessMax: 8.0,
            thicknessLabel: '边缘宽度'),
        SizedBox(height: 8),
        _PresetSection(
            label: '● 拟真玻璃按钮',
            color: const Color(0xFF4ADE80),
            preset: _btn,
            onChanged: (p) => setState(() => _btn = p),
            thicknessMin: 0.0,
            thicknessMax: 30.0,
            thicknessLabel: '厚度'),
        SizedBox(height: 8),
        _PresetSection(
            label: '● 磨砂卡片 / 表面底板',
            color: const Color(0xFFBB86FC),
            preset: _card,
            onChanged: (p) => setState(() => _card = p),
            thicknessMin: 0.0,
            thicknessMax: 30.0,
            thicknessLabel: '厚度'),
      ],
    );
  }

  // 汉化实时诊断数据面板
  Widget _buildDiagnosticsPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '标准画质实时拟合数学模型',
          style: TextStyle(
              color: CupertinoColors.white.withValues(alpha: 0.38),
              fontSize: 9,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8),
        ),
        SizedBox(height: 4),
        Text(
          '胶囊  th=${_pill.thickness.toStringAsFixed(1)} amb=${_pill.ambient.toStringAsFixed(3)}\\n'
          '      glow=${_pill.glow.toStringAsFixed(2)} li=${_pill.light.toStringAsFixed(2)} blur=${_pill.blur.toStringAsFixed(1)}',
          style: TextStyle(
            color: const Color(0xFF5AC8FA).withValues(alpha: 0.9),
            fontSize: 9,
            fontFamily: 'monospace',
          ),
        ),
        SizedBox(height: 4),
        Text(
          '按钮  th=${_btn.thickness.toStringAsFixed(0)} amb=${_btn.ambient.toStringAsFixed(3)}\\n'
          '      glow=${_btn.glow.toStringAsFixed(2)} li=${_btn.light.toStringAsFixed(2)} blur=${_btn.blur.toStringAsFixed(1)}',
          style: TextStyle(
            color: const Color(0xFF4ADE80).withValues(alpha: 0.9),
            fontSize: 9,
            fontFamily: 'monospace',
          ),
        ),
        SizedBox(height: 4),
        Text(
          '卡片  th=${_card.thickness.toStringAsFixed(0)} amb=${_card.ambient.toStringAsFixed(3)}\\n'
          '      glow=${_card.glow.toStringAsFixed(2)} li=${_card.light.toStringAsFixed(2)} blur=${_card.blur.toStringAsFixed(1)}',
          style: TextStyle(
            color: const Color(0xFFBB86FC).withValues(alpha: 0.9),
            fontSize: 9,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }

  // 汉化列标题徽章
  Widget _buildColumnLabels() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _QualityBadge(
              label: '旗舰画质 (PREMIUM)',
              subtitle: 'Impeller 引擎 · 3D SDF 光学',
              color: const Color(0xFFFFB830),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _QualityBadge(
              label: '标准画质 (STANDARD)',
              subtitle: 'Skia/Web · 2D 着色器拟合',
              color: const Color(0xFF5AC8FA),
            ),
          ),
        ],
      ),
    );
  }

  // 汉化对比组件清单
  Widget _buildComparisonList() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 40),
      child: Column(
        children: [
          // ── GlassButton ─────────────────────────────────────────────────
          _ComparisonRow(
            label: '流体玻璃按钮 (GlassButton)',
            premium: GlassButton(
              useOwnLayer: true,
              settings: _kGlass,
              quality: GlassQuality.premium,
              onTap: () {},
              icon: Icon(CupertinoIcons.play_fill),
              label: '点击体验',
            ),
            standard: GlassButton(
              useOwnLayer: true,
              settings: _kGlassBtn,
              quality: GlassQuality.standard,
              onTap: () {},
              icon: Icon(CupertinoIcons.play_fill),
              label: '点击体验',
            ),
          ),

          SizedBox(height: 20),

          // ── GlassSegmentedControl ────────────────────────────────────────
          _ComparisonRow(
            label: '分段控制器 (GlassSegmentedControl)',
            premium: GlassSegmentedControl(
              useOwnLayer: true,
              settings: _kGlass,
              indicatorSettings: _kGlass,
              quality: GlassQuality.premium,
              segments: const [
                GlassSegment(label: '按日'),
                GlassSegment(label: '按周'),
                GlassSegment(label: '按月')
              ],
              selectedIndex: _segIndex,
              onSegmentSelected: (i) => setState(() => _segIndex = i),
            ),
            standard: GlassSegmentedControl(
              useOwnLayer: true,
              settings: _kGlassCard,
              indicatorSettings: _kGlassPill,
              quality: GlassQuality.standard,
              segments: const [
                GlassSegment(label: '按日'),
                GlassSegment(label: '按周'),
                GlassSegment(label: '按月')
              ],
              selectedIndex: _segIndex,
              onSegmentSelected: (i) => setState(() => _segIndex = i),
            ),
          ),

          SizedBox(height: 20),

          // ── GlassCard ───────────────────────────────────────────────────
          _ComparisonRow(
            label: '磨砂卡片 (GlassCard)',
            premium: GlassCard(
              useOwnLayer: true,
              settings: _kGlass,
              quality: GlassQuality.premium,
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '旗舰 3D 渲染',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '3D 倒角 · 镜面光学反射',
                      style: TextStyle(
                        color: CupertinoColors.white.withValues(alpha: 0.70),
                        fontSize: 11,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            standard: GlassCard(
              useOwnLayer: true,
              settings: _kGlassCard,
              quality: GlassQuality.standard,
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '标准 2D 渲染',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2D 轮廓 · 归一化厚度与光照',
                      style: TextStyle(
                        color: CupertinoColors.white.withValues(alpha: 0.70),
                        fontSize: 11,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // ── GlassTabBar ──────────────────────────────────────────────────
          _FullWidthRow(
            label: '流体标签栏 (GlassTabBar)',
            premiumWidget: GlassSegmentedControl(
              useOwnLayer: true,
              settings: _kGlass,
              quality: GlassQuality.premium,
              segments: const [
                GlassSegment(icon: Icon(CupertinoIcons.home)),
                GlassSegment(icon: Icon(CupertinoIcons.search)),
                GlassSegment(icon: Icon(CupertinoIcons.person)),
              ],
              selectedIndex: _tabIndex,
              onSegmentSelected: (i) => setState(() => _tabIndex = i),
            ),
            standardWidget: GlassSegmentedControl(
              useOwnLayer: true,
              settings: _kGlassCard,
              indicatorSettings: _kGlassPill,
              quality: GlassQuality.standard,
              segments: const [
                GlassSegment(icon: Icon(CupertinoIcons.home)),
                GlassSegment(icon: Icon(CupertinoIcons.search)),
                GlassSegment(icon: Icon(CupertinoIcons.person)),
              ],
              selectedIndex: _tabIndex,
              onSegmentSelected: (i) => setState(() => _tabIndex = i),
            ),
          ),

          SizedBox(height: 20),

          // ── GlassSwitch ───────────────────────────────────────────────────
          _ComparisonRow(
            label: '拟真玻璃开关 (GlassSwitch)',
            premium: GlassSwitch(
              value: _switchValue,
              quality: GlassQuality.premium,
              onChanged: (v) => setState(() => _switchValue = v),
            ),
            standard: GlassSwitch(
              value: _switchValue,
              quality: GlassQuality.standard,
              onChanged: (v) => setState(() => _switchValue = v),
            ),
          ),

          SizedBox(height: 20),

          // ── GlassSlider ───────────────────────────────────────────────────
          _FullWidthRow(
            label: '拟真玻璃滑块 (GlassSlider)',
            premiumWidget: GlassSlider(
              value: _sliderValue,
              quality: GlassQuality.premium,
              activeColor: const Color(0xFF007AFF),
              inactiveColor: const Color(0x20FFFFFF),
              trackHeight: 5,
              onChanged: (v) => setState(() => _sliderValue = v),
            ),
            standardWidget: GlassSlider(
              value: _sliderValue,
              quality: GlassQuality.standard,
              activeColor: const Color(0xFF007AFF),
              inactiveColor: const Color(0x20FFFFFF),
              trackHeight: 5,
              onChanged: (v) => setState(() => _sliderValue = v),
            ),
          ),
        ],
      ),
    );
  }
}

// 辅助组件：画质徽章
class _QualityBadge extends StatelessWidget {
  const _QualityBadge({
    required this.label,
    required this.subtitle,
    required this.color,
  });

  final String label;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: color.withValues(alpha: 0.7),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}

// 辅助组件：双列对比行
class _ComparisonRow extends StatelessWidget {
  const _ComparisonRow({
    required this.label,
    required this.premium,
    required this.standard,
  });

  final String label;
  final Widget premium;
  final Widget standard;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            label,
            style: TextStyle(
              color: CupertinoColors.white.withValues(alpha: 0.70),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(child: premium),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Center(child: standard),
            ),
          ],
        ),
      ],
    );
  }
}

// 辅助组件：通栏对比行
class _FullWidthRow extends StatelessWidget {
  const _FullWidthRow({
    required this.label,
    required this.premiumWidget,
    required this.standardWidget,
  });

  final String label;
  final Widget premiumWidget;
  final Widget standardWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            label,
            style: TextStyle(
              color: CupertinoColors.white.withValues(alpha: 0.70),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
        Row(
          children: [
            _QualityPill('旗舰', const Color(0xFFFFB830)),
            SizedBox(width: 10),
            Expanded(child: premiumWidget),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            _QualityPill('标准', const Color(0xFF5AC8FA)),
            SizedBox(width: 10),
            Expanded(child: standardWidget),
          ],
        ),
      ],
    );
  }
}

// 辅助组件：侧边垂直胶囊
class _QualityPill extends StatelessWidget {
  const _QualityPill(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withValues(alpha: 0.5)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}

// 辅助组件：预设折叠段
class _PresetSection extends StatefulWidget {
  const _PresetSection({
    required this.label,
    required this.color,
    required this.preset,
    required this.onChanged,
    this.thicknessMin = 0.0,
    this.thicknessMax = 30.0,
    this.thicknessLabel = '厚度',
  });

  final String label;
  final Color color;
  final _Preset preset;
  final ValueChanged<_Preset> onChanged;
  final double thicknessMin;
  final double thicknessMax;
  final String thicknessLabel;

  @override
  State<_PresetSection> createState() => _PresetSectionState();
}

class _PresetSectionState extends State<_PresetSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.preset;
    final c = widget.color;
    return Container(
      padding: EdgeInsets.fromLTRB(8, 6, 8, 4),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Row(
              children: [
                Text(widget.label,
                    style: TextStyle(
                        color: c,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1)),
                SizedBox(width: 4),
                Flexible(
                  child: Text(
                    'th=${p.thickness.toStringAsFixed(0)} '
                    'amb=${p.ambient.toStringAsFixed(3)} '
                    'glow=${p.glow.toStringAsFixed(2)} '
                    'li=${p.light.toStringAsFixed(2)} '
                    'blur=${p.blur.toStringAsFixed(1)} '
                    'stdOp=${p.stdOpacityMultiplier.toStringAsFixed(2)}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: c.withValues(alpha: 0.6),
                        fontSize: 8,
                        fontFamily: 'monospace'),
                  ),
                ),
                SizedBox(width: 4),
                Text(_expanded ? '▲' : '▼',
                    style: TextStyle(
                        color: c.withValues(alpha: 0.5), fontSize: 8)),
              ],
            ),
          ),
          if (_expanded) ...[
            SizedBox(height: 4),
            _Slider(
                widget.thicknessLabel,
                p.thickness,
                widget.thicknessMin,
                widget.thicknessMax,
                (v) => widget.onChanged(p.copyWith(thickness: v)),
                color: c),
            _Slider('环境光强', p.ambient, 0.0, 0.35,
                (v) => widget.onChanged(p.copyWith(ambient: v)),
                color: c),
            _Slider('辉光强度', p.glow, 0.0, 2.0,
                (v) => widget.onChanged(p.copyWith(glow: v)),
                color: c),
            _Slider('边缘高光', p.light, 0.0, 1.5,
                (v) => widget.onChanged(p.copyWith(light: v)),
                color: c),
            _Slider('模糊半径', p.blur, 0.0, 12.0,
                (v) => widget.onChanged(p.copyWith(blur: v)),
                color: c),
            _Slider('标准透明乘子', p.stdOpacityMultiplier, 0.0, 2.0,
                (v) => widget.onChanged(p.copyWith(stdOpacityMultiplier: v)),
                color: c),
          ],
        ],
      ),
    );
  }
}

// 通用滑块行组件
class _Slider extends StatelessWidget {
  const _Slider(this.label, this.value, this.min, this.max, this.onChanged,
      {this.color = const Color(0xB2FFFFFF)});

  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 84,
          child: Text(
            '$label: ${value.toStringAsFixed(2)}',
            style: TextStyle(
              color: color.withValues(alpha: 0.8),
              fontSize: 9,
              fontFamily: 'monospace',
            ),
          ),
        ),
        Expanded(
          child: CupertinoSlider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            activeColor: color,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

// 预设数据不可变类
class _Preset {
  const _Preset({
    required this.thickness,
    required this.ambient,
    required this.glow,
    required this.light,
    required this.blur,
    required this.stdOpacityMultiplier,
  });

  final double thickness;
  final double ambient;
  final double glow;
  final double light;
  final double blur;
  final double stdOpacityMultiplier;

  LiquidGlassSettings toSettings(Color baseColor) => LiquidGlassSettings(
        glassColor: baseColor,
        thickness: thickness,
        saturation: 1.08,
        ambientStrength: ambient,
        glowIntensity: glow,
        lightIntensity: light,
        blur: blur,
        chromaticAberration: 0.02,
        refractiveIndex: 1.25,
        standardOpacityMultiplier: stdOpacityMultiplier,
      );

  _Preset copyWith({
    double? thickness,
    double? ambient,
    double? glow,
    double? light,
    double? blur,
    double? stdOpacityMultiplier,
  }) =>
      _Preset(
        thickness: thickness ?? this.thickness,
        ambient: ambient ?? this.ambient,
        glow: glow ?? this.glow,
        light: light ?? this.light,
        blur: blur ?? this.blur,
        stdOpacityMultiplier: stdOpacityMultiplier ?? this.stdOpacityMultiplier,
      );
}
