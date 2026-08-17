// 声明当前 Dart 库文件
library;

// 导入 Flutter 官方 Cupertino 规范 iOS 拟真组件库
import 'package:flutter/cupertino.dart';
// 导入 Flutter 核心 Material Design 基础组件库
import 'package:flutter/material.dart';

// 导入 liquid_glass_widgets 流体玻璃渲染核心组件库
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

// 异步主函数入口点
void main() async {
  // 确保 Flutter 绑定通道就绪
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化流体玻璃着色器
  await LiquidGlassWidgets.initialize();
  // 启动 Demo 应用
  runApp(LiquidGlassWidgets.wrap(child: const ShadowClippingDemoApp()));
}

// 演示应用根 StatelessWidget
class ShadowClippingDemoApp extends StatelessWidget {
  // 构造函数
  const ShadowClippingDemoApp({super.key});

  // 构建应用 UI
  @override
  Widget build(BuildContext context) {
    // 返回 CupertinoApp 容器
    return CupertinoApp(
      // 关闭 Debug 标识
      debugShowCheckedModeBanner: false,
      // 强制使用浅色模式（便于观察 GPU 物理投影）
      theme: const CupertinoThemeData(brightness: Brightness.light),
      // 包裹 Material 浅色主题
      builder: (context, child) => Theme(
        data: ThemeData.light(useMaterial3: true),
        child: child!,
      ),
      // 首页指向标高与阴影演示页面
      home: const ShadowClippingDemoPage(),
    );
  }
}

// 标高与阴影演示 StatefulWidget
class ShadowClippingDemoPage extends StatefulWidget {
  // 构造函数
  const ShadowClippingDemoPage({super.key});

  // 创建 State
  @override
  State<ShadowClippingDemoPage> createState() => _ShadowClippingDemoPageState();
}

// 标高与阴影演示 State 状态类
class _ShadowClippingDemoPageState extends State<ShadowClippingDemoPage> {
  // 底部导航当前选中的 Tab 索引
  int _tabIndex = 0;
  // 底部搜索框是否处于激活展开状态
  bool _searchActive = false;
  // 底部白化可读性遮罩强度（范围 0.0 - 1.0）
  double _whitenStrength = 0.30;
  // 滚动控制器，用于联动底部自动白化增强效果
  final ScrollController _scrollController = ScrollController();

  // 组件销毁生命周期
  @override
  void dispose() {
    // 释放滚动控制器
    _scrollController.dispose();
    // 调用父类销毁
    super.dispose();
  }

  // 构建页面 UI 布局
  @override
  Widget build(BuildContext context) {
    // 包装 CupertinoTheme 强制在浅色模式下展现硬件级柔和阴影
    return CupertinoTheme(
      data: CupertinoTheme.of(context).copyWith(
        brightness: Brightness.light,
      ),
      // 使用流体玻璃脚手架
      child: GlassScaffold(
        // 设置浅灰背景
        background: Container(
          color: const Color(0xFFF0F0F5),
        ),
        // 汉化应用栏标题
        appBar: const GlassAppBar(
          title: Text('按钮标高与 GPU 硬件阴影演示'),
        ),
        // 配置支持搜索与白化提亮增强的流体底部栏
        bottomBar: GlassTabBar.searchable(
          selectedIndex: _tabIndex,
          onTabSelected: (idx) => setState(() {
            _tabIndex = idx;
            _searchActive = false;
          }),
          isSearchActive: _searchActive,
          searchConfig: GlassSearchBarConfig(
            onSearchToggle: (active) => setState(() => _searchActive = active),
          ),
          // 动态响应白化强度滑块调节
          settings: LiquidGlassSettings(
            shadowElevation: 2.0,
            blur: 15,
            thickness: 20,
            whitenStrength: _whitenStrength,
          ),
          // 绑定滚动控制器以触发滑动触底自动提亮
          scrollController: _scrollController,
          whitenAtBottom: true,
          // 汉化底部栏标签
          tabs: const [
            GlassTab(
              icon: Icon(CupertinoIcons.house),
              label: '首页',
            ),
            GlassTab(
              icon: Icon(CupertinoIcons.compass),
              label: '发现',
            ),
          ],
        ),
        // 旗舰级流体玻璃层
        body: AdaptiveLiquidGlassLayer(
          settings: const LiquidGlassSettings(
            thickness: 20,
            blur: 8,
          ),
          quality: GlassQuality.premium,
          child: SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 汉化板块 1 标题
                  Text(
                    '旗舰级不同标高流体按钮',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black.withValues(alpha: 0.87),
                    ),
                  ),
                  SizedBox(height: 8),
                  // 汉化板块 1 描述
                  Text(
                    '着色器硬件阴影会在按钮周围平滑自然发散，边缘绝无硬截断。',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.black.withValues(alpha: 0.54),
                    ),
                  ),
                  SizedBox(height: 48),
                  // 标高 1.0、2.0、4.0 水平并排展示
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _ElevatedButton(elevation: 1.0),
                      _ElevatedButton(elevation: 2.0),
                      _ElevatedButton(elevation: 4.0),
                    ],
                  ),
                  SizedBox(height: 64),

                  // 汉化板块 2 标题
                  Text(
                    '流体上下文菜单 (GlassMenu)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black.withValues(alpha: 0.87),
                    ),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: GlassMenu(
                      settings: const LiquidGlassSettings(
                        thickness: 20,
                        blur: 12,
                        shadowElevation: 1.0,
                      ),
                      quality: GlassQuality.premium,
                      // 汉化菜单选项
                      items: [
                        GlassMenuItem(
                          title: '加入收藏 (选项 1)',
                          icon: Icon(CupertinoIcons.star),
                          onTap: () {},
                        ),
                        GlassMenuItem(
                          title: '标记喜欢 (选项 2)',
                          icon: Icon(CupertinoIcons.heart),
                          onTap: () {},
                        ),
                        GlassMenuItem(
                          title: '移至废纸篓 (选项 3)',
                          titleStyle:
                              TextStyle(color: CupertinoColors.destructiveRed),
                          icon: Icon(CupertinoIcons.trash,
                              color: CupertinoColors.destructiveRed),
                          onTap: () {},
                        ),
                      ],
                      triggerBuilder: (context, toggle) => GlassButton(
                        icon: Icon(CupertinoIcons.ellipsis),
                        width: 56,
                        height: 56,
                        iconSize: 24,
                        iconColor:
                            CupertinoColors.black.withValues(alpha: 0.87),
                        onTap: toggle,
                        useOwnLayer: true,
                        settings: const LiquidGlassSettings(
                          shadowElevation: 1.0,
                          glassColor: Color(0x99FFFFFF),
                        ),
                        quality: GlassQuality.premium,
                      ),
                    ),
                  ),
                  SizedBox(height: 64),

                  // 汉化板块 3 标题
                  Text(
                    '玻璃按钮组 (Button Groups)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black.withValues(alpha: 0.87),
                    ),
                  ),
                  SizedBox(height: 24),
                  GlassButtonGroup.icons(
                    direction: Axis.horizontal,
                    quality: GlassQuality.premium,
                    useOwnLayer: true,
                    settings: const LiquidGlassSettings(
                      shadowElevation: 2.0,
                    ),
                    items: [
                      GlassButtonGroupItem(
                        icon: Icon(CupertinoIcons.reply),
                        onTap: () {},
                      ),
                      GlassButtonGroupItem(
                        icon: Icon(CupertinoIcons.heart),
                        onTap: () {},
                      ),
                      GlassButtonGroupItem(
                        icon: Icon(CupertinoIcons.share),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 64),

                  // 汉化板块 4 标题
                  Text(
                    '宽幅通栏按钮 (Wide Button)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black.withValues(alpha: 0.87),
                    ),
                  ),
                  SizedBox(height: 24),
                  GlassButton.custom(
                    width: 300,
                    height: 64,
                    shape: const LiquidRoundedRectangle(borderRadius: 12),
                    onTap: () {},
                    useOwnLayer: true,
                    settings: const LiquidGlassSettings(
                      shadowElevation: 1.0,
                      thickness: 20,
                      blur: 10,
                      glassColor: Color(0x99FFFFFF),
                    ),
                    quality: GlassQuality.premium,
                    // 汉化按钮文本
                    child: Text(
                      '带 GPU 硬件阴影的宽幅按钮',
                      style: TextStyle(
                        color: CupertinoColors.black.withValues(alpha: 0.87),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 64),

                  // 汉化板块 5 标题
                  Text(
                    '白化增亮遮罩强度 (Legibility Veil)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black.withValues(alpha: 0.87),
                    ),
                  ),
                  SizedBox(height: 8),
                  // 汉化板块 5 说明
                  Text(
                    '拖动滑块提升底部导航栏向白色高亮过渡。滑动到底部可观察触底提亮增强效果。',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.black.withValues(alpha: 0.54),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '0.0',
                        style: TextStyle(
                            fontSize: 13,
                            color:
                                CupertinoColors.black.withValues(alpha: 0.54)),
                      ),
                      Expanded(
                        child: CupertinoSlider(
                          min: 0.0,
                          max: 1.0,
                          value: _whitenStrength,
                          onChanged: (v) => setState(() => _whitenStrength = v),
                        ),
                      ),
                      Text(
                        '1.0',
                        style: TextStyle(
                            fontSize: 13,
                            color:
                                CupertinoColors.black.withValues(alpha: 0.54)),
                      ),
                    ],
                  ),
                  Text(
                    '当前白化强度 (whitenStrength): ${_whitenStrength.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black.withValues(alpha: 0.87),
                    ),
                  ),
                  SizedBox(height: 24),
                  // 白化对比卡片展示
                  Row(
                    children: [
                      Expanded(
                        child: _WhitenCard(
                          label: '开启白化提亮',
                          whitenStrength: _whitenStrength,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _WhitenCard(
                          label: '无白化提亮',
                          whitenStrength: 0.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 200),
                  // 汉化触底提示
                  Center(
                    child: Text(
                      '↓ 继续向下滑动此处触发底部栏自动白化增强效果 ↓',
                      style: TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.black.withValues(alpha: 0.38),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 标高按钮子组件
class _ElevatedButton extends StatelessWidget {
  const _ElevatedButton({required this.elevation});

  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassButton(
          icon: Icon(CupertinoIcons.heart_fill),
          width: 64,
          height: 64,
          iconSize: 28,
          quality: GlassQuality.premium,
          useOwnLayer: true,
          iconColor: CupertinoColors.black.withValues(alpha: 0.87),
          onTap: () {},
          settings: LiquidGlassSettings(
            shadowElevation: elevation,
            thickness: 20,
            blur: 10,
            glassColor: const Color(0x99FFFFFF),
          ),
        ),
        SizedBox(height: 16),
        // 汉化标高标签
        Text(
          '标高 $elevation',
          style: TextStyle(
            color: CupertinoColors.black.withValues(alpha: 0.54),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

// 白化对比卡片子组件
class _WhitenCard extends StatelessWidget {
  const _WhitenCard({
    required this.label,
    required this.whitenStrength,
  });

  final String label;
  final double whitenStrength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFF6B6B),
                          Color(0xFF4ECDC4),
                          Color(0xFF45B7D1),
                        ],
                      ),
                    ),
                    child: Center(
                      // 汉化底层内容文字
                      child: Text(
                        '玻璃下方底层内容',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: AdaptiveGlass(
                  shape: const LiquidRoundedSuperellipse(borderRadius: 16),
                  quality: GlassQuality.premium,
                  settings: LiquidGlassSettings(
                    blur: 12,
                    thickness: 20,
                    whitenStrength: whitenStrength,
                  ),
                  child: const SizedBox.expand(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.black.withValues(alpha: 0.54),
          ),
        ),
        Text(
          whitenStrength.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 12,
            color: CupertinoColors.black.withValues(alpha: 0.38),
          ),
        ),
      ],
    );
  }
}
