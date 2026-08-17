// 导入 liquid_glass_widgets 核心流体玻璃库暴露的所有组件与参数
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
// 导入示例应用预设的玻璃渲染配置常量参数
import 'package:liquid_glass_widgets_example/constants/glass_settings.dart';
// 导入 Flutter 官方 Cupertino 风格 iOS 拟真设计规范组件库
import 'package:flutter/cupertino.dart';
// 导入 Flutter 核心 Material Design 基础组件库
import 'package:flutter/material.dart';
// 导入 Flutter 官方多语言本地化委托组件库
import 'package:flutter_localizations/flutter_localizations.dart';

// 导入拟真 Apple Messages 信息应用全功能演示模块
import 'package:liquid_glass_widgets_example/apple_messages/apple_messages_demo.dart';
// 导入拟真 Apple Music 音乐播放器全功能演示模块
import 'package:liquid_glass_widgets_example/apple_music/apple_music_demo.dart';
// 导入拟真 Apple News 新闻资讯全功能演示模块
import 'package:liquid_glass_widgets_example/apple_news/apple_news_demo.dart';
// 导入拟真 Apple Podcasts 播客播放全功能演示模块
import 'package:liquid_glass_widgets_example/apple_podcasts/apple_podcasts_demo.dart';
// 导入拟真 iOS 数字键盘密码锁屏全功能演示模块
import 'package:liquid_glass_widgets_example/apple_lockscreen/keypad_lock_screen_demo.dart';
// 导入流体玻璃导航栏多样化布局模式演示模块
import 'package:liquid_glass_widgets_example/demos/nav_bar_patterns_demo.dart';
// 导入流体玻璃液态上下文展开菜单演示模块
import 'package:liquid_glass_widgets_example/demos/glass_menu_demo.dart';
// 导入流体玻璃底部模态抽屉与半屏弹窗演示模块
import 'package:liquid_glass_widgets_example/demos/glass_modal_sheet_demo.dart';
// 导入流体玻璃悬浮控制器视频播放器演示模块
import 'package:liquid_glass_widgets_example/demos/video_player_demo.dart';
// 导入流体玻璃透光折射文本输入框演示模块
import 'package:liquid_glass_widgets_example/demos/text_field_demo.dart';
// 导入流体玻璃底部动态标签宽度与物理拉伸演示模块
import 'package:liquid_glass_widgets_example/demos/bottom_bar_tab_width_demo.dart';
// 导入手势驱动液态折叠应用栏演示模块
import 'package:liquid_glass_widgets_example/demos/collapse_bar_demo.dart';
// 导入流体玻璃多层标高与 GPU 硬件级阴影演示模块
import 'package:liquid_glass_widgets_example/demos/buttons_and_shadows_demo.dart';
// 导入滚动时内容感知智能亮度自适应演示模块
import 'package:liquid_glass_widgets_example/demos/content_aware_brightness_demo.dart';
// 导入五种胶囊指示器实时物理捏合与色差调节器演示模块
import 'package:liquid_glass_widgets_example/demos/indicator_parity_demo.dart';
// 导入从右到左 (RTL) 多语言排版与物理仿真镜像演示模块
import 'package:liquid_glass_widgets_example/demos/rtl_layout_demo.dart';
// 导入光学半月板边缘暗化与 24 采样点模糊实验室演示模块
import 'package:liquid_glass_widgets_example/demos/meniscus_and_blur_demo.dart';

// 导入原生地图混合视图穿透折射演示组件
import 'package:liquid_glass_widgets_example/demos/google_maps_demo.dart'
    show PlatformViewDemo;
// 导入不同渲染层级与性能质量对比测试演示组件
import 'package:liquid_glass_widgets_example/demos/quality_comparison_demo.dart'
    show GlassQualityComparisonDemo;
// 导入容器与面板组件全景展示页面
import 'package:liquid_glass_widgets_example/pages/containers_page.dart';
// 导入反馈指示器与吐司弹窗展示页面
import 'package:liquid_glass_widgets_example/pages/feedback_page.dart';
// 导入输入框与搜索栏组件展示页面
import 'package:liquid_glass_widgets_example/pages/input_page.dart';
// 导入可交互按钮、开关与滑块组件展示页面
import 'package:liquid_glass_widgets_example/pages/interactive_page.dart';
// 导入浮层、菜单与气泡弹窗组件展示页面
import 'package:liquid_glass_widgets_example/pages/overlays_page.dart';
// 导入应用栏、底栏与标签栏基础表面展示页面
import 'package:liquid_glass_widgets_example/pages/surfaces_page.dart';

// 应用程序主函数异步入口点
void main() async {
  // 确保 Flutter 引擎底层微任务与渲染绑定通道初始化完成
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化 LiquidGlassWidgets 底层着色器资源与光学物理运算管线
  await LiquidGlassWidgets.initialize();
  // 启动应用程序，并使用 LiquidGlassWidgets.wrap 全局包裹以注入玻璃渲染着色器环境
  runApp(LiquidGlassWidgets.wrap(child: const AppleLiquidGlassShowcaseApp()));
}

// 应用程序全局根 StatefulWidget 组件类
class AppleLiquidGlassShowcaseApp extends StatefulWidget {
  // 构造函数，支持传递 Key 标识符
  const AppleLiquidGlassShowcaseApp({super.key});

  // 创建对应的状态维护 State 实例
  @override
  State<AppleLiquidGlassShowcaseApp> createState() =>
      _AppleLiquidGlassShowcaseAppState();
}

// 应用程序全局根状态类
class _AppleLiquidGlassShowcaseAppState
    extends State<AppleLiquidGlassShowcaseApp> {
  // 定义应用当前全局的深浅色明暗主题状态，默认设置为深色模式
  Brightness _brightness = Brightness.dark;

  // 切换深浅色明暗主题的无参回调函数
  void _toggleBrightness() {
    // 触发组件状态重绘
    setState(() {
      // 在深色与浅色状态之间进行三元取反切换
      _brightness =
          _brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    });
  }

  // 构建全局 UI 树的主方法
  @override
  Widget build(BuildContext context) {
    // 计算当前是否处于深色暗黑模式布尔值
    final isDark = _brightness == Brightness.dark;

    // 返回由 InheritedWidget 封装的主题共享作用域
    return _BrightnessScope(
      // 传递当前明暗模式状态
      brightness: _brightness,
      // 传递主题切换逻辑方法
      toggleBrightness: _toggleBrightness,
      // 子组件构建 iOS 拟真 CupertinoApp
      child: CupertinoApp(
        // 设置在任务管理器中展示的应用中文标题名称
        title: '流体玻璃组件库 (Liquid Glass)',
        // 配置 Cupertino 统一主题数据
        theme: CupertinoThemeData(
          // 设置当前应用亮度模式
          brightness: _brightness,
        ),
        // 配置多语言本地化支持（添加中文与国际化委托，彻底杜绝系统级控件英文残留）
        localizationsDelegates: const [
          // 基础组件本地化委托
          GlobalWidgetsLocalizations.delegate,
          // Material 规范组件本地化委托
          GlobalMaterialLocalizations.delegate,
          // Cupertino 规范组件本地化委托
          GlobalCupertinoLocalizations.delegate,
          // 默认 Material 本地化后备委托
          DefaultMaterialLocalizations.delegate,
          // 默认 Widgets 本地化后备委托
          DefaultWidgetsLocalizations.delegate,
        ],
        // 配置应用程序支持的语言区域列表
        supportedLocales: const [
          // 优先支持简体中文语言环境
          Locale('zh', 'CN'),
          // 备用支持英语语言环境
          Locale('en', 'US'),
        ],
        // 设置应用默认使用的语言区域为简体中文
        locale: const Locale('zh', 'CN'),
        // 为 Demo 页面中使用的 Material 规范 Scaffold 和底部弹窗提供匹配的 Material 主题包裹
        builder: (context, child) => Theme(
          // 根据深浅状态动态构建 Material 3 主题数据
          data: isDark
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
          // 返回渲染子组件
          child: child!,
        ),
        // 设置应用程序的首页入口组件
        home: const ShowcaseHomePage(),
        // 关闭右上角的 Debug 调试水印横幅
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// 跨组件共享明暗模式状态的 InheritedWidget 作用域类
class _BrightnessScope extends InheritedWidget {
  // 构造函数，接收必需的状态参数与子组件
  const _BrightnessScope({
    // 必需的明暗模式值
    required this.brightness,
    // 必需的切换回调函数
    required this.toggleBrightness,
    // 必需的子级渲染组件
    required super.child,
  });

  // 存储当前明暗模式的常量属性
  final Brightness brightness;
  // 存储切换操作回调的常量属性
  final VoidCallback toggleBrightness;

  // 提供静态方法供子树节点快速获取 _BrightnessScope 实例
  static _BrightnessScope of(BuildContext context) {
    // 从上下文查找匹配类型的 InheritedWidget 实例
    return context.dependOnInheritedWidgetOfExactType<_BrightnessScope>()!;
  }

  // 决定当数据变更时是否通知依赖的子组件重新构建
  @override
  bool updateShouldNotify(_BrightnessScope oldWidget) =>
      brightness != oldWidget.brightness;
}

// =============================================================================
// 主页展示组件 — 采用 GlassTabBar 底部流体导航栏驱动核心内容切换
// =============================================================================

// 主页 StatefulWidget 类
class ShowcaseHomePage extends StatefulWidget {
  // 构造函数，支持传递 Key
  const ShowcaseHomePage({super.key});

  // 创建对应的状态维护 State 实例
  @override
  State<ShowcaseHomePage> createState() => _ShowcaseHomePageState();
}

// 主页 State 状态维护类
class _ShowcaseHomePageState extends State<ShowcaseHomePage> {
  // 记录当前选中的底部导航 Tab 索引值，默认为 0
  int _selectedTab = 0;

  // 定义底部流体玻璃导航栏的 4 大核心中文标签项配置
  static const _tabs = [
    // 标签 1：探索全景
    GlassTab(
      // 汉化标签标题：探索
      label: '探索',
      // 未选中状态下的指南针线框图标
      icon: Icon(CupertinoIcons.compass),
      // 选中激活状态下的指南针填充图标
      activeIcon: Icon(CupertinoIcons.compass_fill),
    ),
    // 标签 2：组件目录
    GlassTab(
      // 汉化标签标题：组件库
      label: '组件库',
      // 未选中状态下的四宫格线框图标
      icon: Icon(CupertinoIcons.square_grid_2x2),
      // 选中激活状态下的四宫格填充图标
      activeIcon: Icon(CupertinoIcons.square_grid_2x2_fill),
    ),
    // 标签 3：仿应用演示
    GlassTab(
      // 汉化标签标题：演示
      label: '演示',
      // 未选中状态下的苹果线框图标
      icon: Icon(Icons.apple_outlined, size: 30),
      // 选中激活状态下的苹果填充图标
      activeIcon: Icon(Icons.apple, size: 30),
    ),
    // 标签 4：特性与样例
    GlassTab(
      // 汉化标签标题：案例
      label: '案例',
      // 未选中状态下的立方体线框图标
      icon: Icon(CupertinoIcons.cube),
      // 选中激活状态下的立方体填充图标
      activeIcon: Icon(CupertinoIcons.cube_fill),
    ),
  ];

  // 构建主页 UI 布局
  @override
  Widget build(BuildContext context) {
    // 从上下文获取全局共享的明暗主题作用域
    final scope = _BrightnessScope.of(context);
    // 判断当前是否处于暗黑模式
    final isDark = scope.brightness == Brightness.dark;

    // 返回由流体玻璃脚手架组件构成的页面
    return GlassScaffold(
      // 设置背景为官方动态渐变展示背景
      background: const ShowcaseBackground(),
      // 状态栏字体颜色随明暗模式自适应反色
      statusBarStyle:
          isDark ? GlassStatusBarStyle.light : GlassStatusBarStyle.dark,
      // 使用标准拟真玻璃参数预设
      settings: RecommendedGlassSettings.standard,
      // 开启顶部边缘流体渐隐过渡效果
      topEdgeFade: true,
      // 配置底部流体毛玻璃导航栏
      bottomBar: GlassTabBar.bottom(
        // 绑定当前选中的标签序号
        selectedIndex: _selectedTab,
        // 标签被点击切换时的回调处理函数
        onTabSelected: (i) => setState(() => _selectedTab = i),
        // 启用全交互弹性物理拖拽与拉伸响应模式
        interactionBehavior: GlassInteractionBehavior.full,
        // 激活状态下图标的高亮色彩（紫色）
        selectedIconColor: const Color(0xFFA855F7),
        // 图标显示物理尺寸
        iconSize: 28,
        // 标签文字显示字号
        labelFontSize: 10,
        // 图标与文字之间的垂直间距
        iconLabelSpacing: 0,
        // 定制底部导航专属流体玻璃渲染参数
        settings: const LiquidGlassSettings(
          // 玻璃底色透明度设定
          glassColor: Color.fromRGBO(255, 255, 255, 0.08),
          // 物理玻璃厚度
          thickness: 30,
          // 背景多重高斯模糊半径
          blur: 3,
          // 光学色散与色差系数
          chromaticAberration: .01,
          // 光源入射角度（默认 135 度）
          lightAngle: GlassDefaults.lightAngle,
          // 光照反射强度
          lightIntensity: .5,
          // 环境光强弱系数
          ambientStrength: 0,
          // 物理折射率
          refractiveIndex: 1.2,
          // 饱和度增强系数
          saturation: 1.2,
          // 镜面高光锐利度模式
          specularSharpness: GlassSpecularSharpness.medium,
        ),
        // 底部栏附加的快速深浅色切换功能按钮
        extraButton: GlassTabBarExtraButton(
          // 动态显示太阳或月亮图标
          icon: Icon(isDark ? CupertinoIcons.sun_max : CupertinoIcons.moon),
          // 汉化深浅模式切换按钮的文案提示
          label: isDark ? '浅色模式' : '深色模式',
          // 点击触发全局主题切换逻辑
          onTap: scope.toggleBrightness,
        ),
        // 传入汉化后的标签项数组
        tabs: _tabs,
      ),
      // 主体内容区域采用平滑淡入淡出动画进行切换
      body: AnimatedSwitcher(
        // 切换动画过渡时长设定为 250 毫秒
        duration: const Duration(milliseconds: 250),
        // 根据选中序号模式匹配渲染对应的中文子页面
        child: switch (_selectedTab) {
          // 0 号索引渲染探索全景页
          0 => const _ExploreTab(key: ValueKey('explore')),
          // 1 号索引渲染组件库分类页
          1 => const _WidgetsTab(key: ValueKey('widgets')),
          // 2 号索引渲染仿应用演示页
          2 => const _DemosTab(key: ValueKey('demos')),
          // 默认或其他索引渲染案例与特性页
          _ => const _ExamplesTab(key: ValueKey('examples')),
        },
      ),
    );
  }
}

// =============================================================================
// 探索 Tab 页面 — 包含英雄主打卡片、推荐 Demo 与精选组件网格（已全中文汉化）
// =============================================================================

// 探索页无状态组件
class _ExploreTab extends StatelessWidget {
  // 构造函数，支持传递 Key
  const _ExploreTab({super.key});

  // 构建探索页面的 Sliver 滚动视口结构
  @override
  Widget build(BuildContext context) {
    // 返回自定义弹性滚动组件
    return CustomScrollView(
      // 配置滚动视口中的 Sliver 块列表
      slivers: [
        // 包装常规盒模型的 Sliver 适配器
        SliverToBoxAdapter(
          // 包装安全区域以避开刘海屏
          child: SafeArea(
            // 底部由于已有毛玻璃导航栏，因此不占用底部安全区高度
            bottom: false,
            // 设定页面四周内边距
            child: Padding(
              // 内边距具体数值：左 24、上 12、右 24、下 0
              padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
              // 垂直线性排版容器
              child: Column(
                // 内部子项左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                // 子组件列表
                children: [
                  // 汉化主标题文字
                  Text(
                    '流体玻璃',
                    // 样式定义
                    style: TextStyle(
                      // 字号设为超大标题 34
                      fontSize: 34,
                      // 加粗粗细
                      fontWeight: FontWeight.w700,
                      // 文字颜色适配深浅模式动态变化
                      color: CupertinoColors.label.resolveFrom(context),
                      // 字符间距微调
                      letterSpacing: -0.5,
                    ),
                  ),
                  // 间距占位盒：高度 4 逻辑像素
                  SizedBox(height: 4),
                  // 汉化副标题文字
                  Text(
                    'iOS 26 拟真质感组件工具箱 (Liquid Glass)',
                    // 样式定义
                    style: TextStyle(
                      // 字号设为副文本 17
                      fontSize: 17,
                      // 采用次要文本标签色
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                      // 字符间距微调
                      letterSpacing: -0.2,
                    ),
                  ),
                  // 间距占位盒：高度 32 逻辑像素
                  SizedBox(height: 32),

                  // ── 主打演示卡片 — Apple Music 红色流体卡片 ────────────
                  GestureDetector(
                    // 点击卡片跳转至 Apple Music 中文复刻演示页
                    onTap: () =>
                        _openDemo(context, const AppleMusicHomeScreen()),
                    // 卡片主容器
                    child: Container(
                      // 固定卡片高度为 200 逻辑像素
                      height: 200,
                      // 装饰背景与边框圆角
                      decoration: BoxDecoration(
                        // 线性渐变色填充
                        gradient: const LinearGradient(
                          // 渐变起点：左上角
                          begin: Alignment.topLeft,
                          // 渐变终点：右下角
                          end: Alignment.bottomRight,
                          // 渐变色彩过渡数组
                          colors: [
                            Color(0xFF8B0000), // 深酒红色
                            Color(0xFFFA2D48), // 亮苹果红
                          ],
                        ),
                        // 20 像素平滑圆角
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // 卡片四周内边距 24 像素
                      padding: EdgeInsets.all(24),
                      // 卡片内部纵向排版
                      child: Column(
                        // 左对齐
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // 子项
                        children: [
                          // 顶部图标与标题水平排版行
                          Row(
                            // 子项
                            children: [
                              // 苹果官方 Logo 图标
                              Icon(Icons.apple_outlined,
                                  color: CupertinoColors.white, size: 30),
                              // 间距 6 像素
                              SizedBox(width: 6),
                              // 汉化标题：音乐
                              Text(
                                '音乐 (Apple Music)',
                                // 样式定义
                                style: TextStyle(
                                  // 字号 22
                                  fontSize: 22,
                                  // 粗体
                                  fontWeight: FontWeight.w700,
                                  // 纯白色
                                  color: CupertinoColors.white,
                                ),
                              ),
                            ],
                          ),
                          // 弹性撑开中间空白区域
                          const Spacer(),
                          // 汉化副标题描述
                          Text(
                            '基于 Liquid Glass 深度复刻\n拟真 Apple Music 完整交互体验',
                            // 样式定义
                            style: TextStyle(
                              // 字号 17
                              fontSize: 17,
                              // 半粗体
                              fontWeight: FontWeight.w600,
                              // 纯白色
                              color: CupertinoColors.white,
                              // 行高倍数
                              height: 1.3,
                            ),
                          ),
                          // 间距 4 像素
                          SizedBox(height: 4),
                          // 汉化特性标签
                          Text(
                            '搜索微光底栏 · 浮动播放胶囊 · 流体标签导航',
                            // 样式定义
                            style: TextStyle(
                              // 字号 13
                              fontSize: 13,
                              // 白色 70% 透明度
                              color: CupertinoColors.white.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 间距占位盒：高度 16 逻辑像素
                  SizedBox(height: 16),

                  // ── 双列小卡片演示入口：信息 与 播客 ─────────────────────
                  Row(
                    // 子项
                    children: [
                      // 左侧信息演示卡片（平分剩余宽度）
                      Expanded(
                        // 渲染小演示卡片组件
                        child: _SmallDemoCard(
                          // 汉化标题：信息
                          title: '信息 (Messages)',
                          // 聊天气泡填充图标
                          icon: CupertinoIcons.chat_bubble_2_fill,
                          // 绿色主题色
                          color: const Color(0xFF34C759),
                          // 跳转目标页：信息演示页
                          destination: const MessagesScreen(),
                        ),
                      ),
                      // 卡片之间间距 14 逻辑像素
                      SizedBox(width: 14),
                      // 右侧播客演示卡片（平分剩余宽度）
                      Expanded(
                        // 渲染小演示卡片组件
                        child: _SmallDemoCard(
                          // 汉化标题：播客
                          title: '播客 (Podcasts)',
                          // 麦克风填充图标
                          icon: CupertinoIcons.mic_fill,
                          // 紫色主题色
                          color: const Color(0xFFA855F7),
                          // 跳转目标页：播客演示页
                          destination: const ApplePodcastsHomeScreen(),
                        ),
                      ),
                    ],
                  ),

                  // 间距占位盒：高度 32 逻辑像素
                  SizedBox(height: 32),

                  // ── 组件全景目录板块标题 ──────────────────────────
                  Text(
                    '组件全景目录',
                    // 样式定义
                    style: TextStyle(
                      // 字号 22
                      fontSize: 22,
                      // 粗体
                      fontWeight: FontWeight.w700,
                      // 适配深浅模式的主文本色
                      color: CupertinoColors.label.resolveFrom(context),
                      // 字符间距
                      letterSpacing: -0.3,
                    ),
                  ),
                  // 间距 16 像素
                  SizedBox(height: 16),

                  // ── 错落有致的流体玻璃卡片网格布局 ────────────────────
                  IntrinsicHeight(
                    // 水平排版行
                    child: Row(
                      // 垂直方向拉伸对齐
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // 子项
                      children: [
                        // 左侧超高大卡片：表面底板组件
                        Expanded(
                          // 占用 1 份比例
                          flex: 1,
                          // 渲染错落玻璃卡片
                          child: _StaggeredCatalogCard(
                            // 矩形图层图标
                            icon: CupertinoIcons.rectangle_3_offgrid_fill,
                            // 汉化标题：表面与底板
                            title: '表面与底板',
                            // 汉化副标题包含的控件清单
                            subtitle: '应用栏 · 底部栏 · 搜索栏 · 标签栏',
                            // 跳转至 Surfaces 详情页
                            destination: const SurfacesPage(),
                          ),
                        ),
                        // 间距 14 像素
                        SizedBox(width: 14),
                        // 右侧上下堆叠的两个卡片
                        Expanded(
                          // 占用 1 份比例
                          flex: 1,
                          // 纵向排版列
                          child: Column(
                            // 水平拉伸
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // 子项
                            children: [
                              // 交互组件卡片
                              _StaggeredCatalogCard(
                                // 手指点击图标
                                icon: CupertinoIcons.hand_point_right_fill,
                                // 汉化标题：交互控件
                                title: '交互控件',
                                // 汉化副标题：流体按钮 · 玻璃开关 · 滑块
                                subtitle: '流体按钮 · 玻璃开关 · 滑块',
                                // 固定高度 120 像素
                                height: 120,
                                // 跳转至交互组件页
                                destination: const InteractivePage(),
                              ),
                              // 间距 14 像素
                              SizedBox(height: 14),
                              // 反馈组件卡片
                              _StaggeredCatalogCard(
                                // 沙漏指示图标
                                icon: CupertinoIcons.hourglass,
                                // 汉化标题：状态反馈
                                title: '状态反馈',
                                // 汉化副标题：进度指示条 · 磨砂吐司提示
                                subtitle: '进度指示条 · 磨砂吐司提示',
                                // 固定高度 120 像素
                                height: 120,
                                // 跳转至反馈组件页
                                destination: const FeedbackPage(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 间距 14 像素
                  SizedBox(height: 14),

                  // ── 第二行并排卡片：输入控件 与 浮层弹窗 ────────────────
                  Row(
                    // 子项
                    children: [
                      // 左侧：输入控件
                      Expanded(
                        child: _StaggeredCatalogCard(
                          // 键盘图标
                          icon: CupertinoIcons.keyboard,
                          // 汉化标题：输入控件
                          title: '输入控件',
                          // 汉化副标题：玻璃输入框 · 磨砂搜索框
                          subtitle: '玻璃输入框 · 磨砂搜索框',
                          // 高度 120
                          height: 120,
                          // 跳转至输入组件页
                          destination: const InputPage(),
                        ),
                      ),
                      // 间距 14 像素
                      SizedBox(width: 14),
                      // 右侧：浮层弹窗
                      Expanded(
                        child: _StaggeredCatalogCard(
                          // 图层堆叠图标
                          icon: CupertinoIcons.square_stack_fill,
                          // 汉化标题：浮层与弹窗
                          title: '浮层与弹窗',
                          // 汉化副标题：抽屉 · 对话框 · 菜单 · 气泡
                          subtitle: '抽屉 · 对话框 · 菜单 · 气泡',
                          // 高度 120
                          height: 120,
                          // 跳转至浮层组件页
                          destination: const OverlaysPage(),
                        ),
                      ),
                    ],
                  ),
                  // 间距 14 像素
                  SizedBox(height: 14),

                  // ── 第三行通栏卡片：容器与面板 ────────────────────────
                  Row(
                    // 子项
                    children: [
                      // 通栏扩展
                      Expanded(
                        child: _StaggeredCatalogCard(
                          // 三维堆叠卡片图标
                          icon: CupertinoIcons.square_stack_3d_up_fill,
                          // 汉化标题：容器与面板
                          title: '容器与面板',
                          // 汉化副标题：磨砂卡片 · 毛玻璃面板 · 基础容器
                          subtitle: '磨砂卡片 · 毛玻璃面板 · 基础容器',
                          // 高度 100
                          height: 100,
                          // 跳转至容器组件页
                          destination: const ContainersPage(),
                        ),
                      ),
                    ],
                  ),

                  // 底部安全避让间距：留出 120 像素高度以防被毛玻璃底部栏遮挡
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// 组件库 Tab 页面 — 完整组件目录列表（已全中文汉化）
// =============================================================================

// 组件库 Tab 无状态组件类
class _WidgetsTab extends StatelessWidget {
  // 构造函数
  const _WidgetsTab({super.key});

  // 构建组件库目录 UI
  @override
  Widget build(BuildContext context) {
    // 返回滚动视口
    return CustomScrollView(
      // 配置 Slivers
      slivers: [
        // 包装盒模型
        SliverToBoxAdapter(
          // 安全区包裹
          child: SafeArea(
            // 底部不占位
            bottom: false,
            // 四周内边距
            child: Padding(
              // 边距：左 24、上 12、右 24、下 0
              padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
              // 纵向排版
              child: Column(
                // 左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                // 子项列表
                children: [
                  // 汉化大标题：组件库
                  Text(
                    '组件库全集',
                    // 样式定义
                    style: TextStyle(
                      // 字号 34
                      fontSize: 34,
                      // 粗体
                      fontWeight: FontWeight.w700,
                      // 动态文本颜色
                      color: CupertinoColors.label.resolveFrom(context),
                      // 字符间距
                      letterSpacing: -0.5,
                    ),
                  ),
                  // 间距 8 像素
                  SizedBox(height: 8),
                  // 汉化副标题
                  Text(
                    '浏览与测试 Liquid Glass 全部拟真玻璃控件。',
                    // 样式定义
                    style: TextStyle(
                      // 字号 15
                      fontSize: 15,
                      // 次级文本色
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                  ),
                  // 间距 24 像素
                  SizedBox(height: 24),

                  // 第一行：容器面板 + 交互控件
                  Row(
                    children: [
                      Expanded(
                        child: _SmallDemoCard(
                          title: '容器面板 (Containers)',
                          icon: CupertinoIcons.square_stack_3d_up_fill,
                          color: const Color(0xFF007AFF), // 蓝色
                          destination: const ContainersPage(),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: _SmallDemoCard(
                          title: '交互控件 (Interactive)',
                          icon: CupertinoIcons.hand_point_right_fill,
                          color: const Color(0xFFFF9500), // 橙色
                          destination: const InteractivePage(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),

                  // 第二行：状态反馈 + 浮层弹窗
                  Row(
                    children: [
                      Expanded(
                        child: _SmallDemoCard(
                          title: '状态反馈 (Feedback)',
                          icon: CupertinoIcons.hourglass,
                          color: const Color(0xFF34C759), // 绿色
                          destination: const FeedbackPage(),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: _SmallDemoCard(
                          title: '浮层弹窗 (Overlays)',
                          icon: CupertinoIcons.square_stack_fill,
                          color: const Color(0xFFAF52DE), // 紫色
                          destination: const OverlaysPage(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),

                  // 第三行：表面底板 + 文本输入
                  Row(
                    children: [
                      Expanded(
                        child: _SmallDemoCard(
                          title: '表面底板 (Surfaces)',
                          icon: CupertinoIcons.rectangle_3_offgrid_fill,
                          color: const Color(0xFF5AC8FA), // 天蓝色
                          destination: const SurfacesPage(),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: _SmallDemoCard(
                          title: '文本输入 (Input)',
                          icon: CupertinoIcons.keyboard,
                          color: const Color(0xFFFF2D55), // 桃红色
                          destination: const InputPage(),
                        ),
                      ),
                    ],
                  ),

                  // 底部避让间距
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// 仿应用演示 Tab 页面 — 深度复刻的官方 Apple 原生级应用体验（已全中文汉化）
// =============================================================================

// 仿应用演示 Tab 无状态组件类
class _DemosTab extends StatelessWidget {
  // 构造函数
  const _DemosTab({super.key});

  // 构建仿应用演示 UI 列表
  @override
  Widget build(BuildContext context) {
    // 返回可滚动视口
    return CustomScrollView(
      // Slivers 列表
      slivers: [
        // 盒模型适配器
        SliverToBoxAdapter(
          // 安全区域
          child: SafeArea(
            // 底部不占位
            bottom: false,
            // 内边距
            child: Padding(
              // 边距配置
              padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
              // 纵向排版列
              child: Column(
                // 左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                // 子组件列表
                children: [
                  // 汉化大标题：应用演示
                  Text(
                    '仿应用体验',
                    // 样式定义
                    style: TextStyle(
                      // 字号 34
                      fontSize: 34,
                      // 粗体
                      fontWeight: FontWeight.w700,
                      // 动态文字色
                      color: CupertinoColors.label.resolveFrom(context),
                      // 字符间距
                      letterSpacing: -0.5,
                    ),
                  ),
                  // 间距 8 像素
                  SizedBox(height: 8),
                  // 汉化副标题
                  Text(
                    '高度还原的 Apple 原生质感应用复刻案例。',
                    // 样式定义
                    style: TextStyle(
                      // 字号 15
                      fontSize: 15,
                      // 次级文本色
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                  ),
                  // 间距 24 像素
                  SizedBox(height: 24),

                  // 演示大卡片 1：Apple Music
                  _LargeDemoCard(
                    title: '音乐 (Apple Music)',
                    subtitle: '可折叠搜索底栏 · 浮动播放胶囊 · 平滑标签导航',
                    icon: CupertinoIcons.music_note_2,
                    gradient: const [
                      Color(0xFF8B0000), // 深红
                      Color(0xFFFA2D48), // 亮红
                    ],
                    destination: const AppleMusicHomeScreen(),
                  ),
                  SizedBox(height: 14),

                  // 演示大卡片 2：Messages 信息
                  _LargeDemoCard(
                    title: '信息 (Messages)',
                    subtitle: '消息会话流 · 液态长按菜单 · 多维过滤控件',
                    icon: CupertinoIcons.chat_bubble_2_fill,
                    gradient: const [
                      Color(0xFF0A4D20), // 墨绿
                      Color(0xFF34C759), // 浅绿
                    ],
                    destination: const MessagesScreen(),
                  ),
                  SizedBox(height: 14),

                  // 演示大卡片 3：Podcasts 播客
                  _LargeDemoCard(
                    title: '播客 (Podcasts)',
                    subtitle: '迷你常驻播放条 · 展开式播放控制 · 滚动液态收缩',
                    icon: CupertinoIcons.mic_fill,
                    gradient: const [
                      Color(0xFF4A1A6B), // 深紫
                      Color(0xFFA855F7), // 亮紫
                    ],
                    destination: const ApplePodcastsHomeScreen(),
                  ),
                  SizedBox(height: 14),

                  // 双列小卡片：新闻 与 锁屏
                  Row(
                    children: [
                      Expanded(
                        child: _SmallDemoCard(
                          title: '新闻 (News)',
                          icon: CupertinoIcons.news,
                          color: const Color(0xFFFF3B30),
                          destination: const AppleNewsHomeScreen(),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: _SmallDemoCard(
                          title: '锁屏 (Lock Screen)',
                          icon: CupertinoIcons.lock_fill,
                          color: const Color(0xFF5856D6),
                          destination: const KeypadLockScreenDemo(),
                        ),
                      ),
                    ],
                  ),

                  // 底部留白
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// 案例特性 Tab 页面 — 控件模式与高级物理渲染参数测试案例（已全中文汉化）
// =============================================================================

// 案例特性 Tab 无状态组件类
class _ExamplesTab extends StatelessWidget {
  // 构造函数
  const _ExamplesTab({super.key});

  // 构建案例列表 UI
  @override
  Widget build(BuildContext context) {
    // 返回滚动视口
    return CustomScrollView(
      // Slivers 列表
      slivers: [
        // 盒模型适配器
        SliverToBoxAdapter(
          // 安全区
          child: SafeArea(
            // 底部不占位
            bottom: false,
            // 内边距
            child: Padding(
              // 边距数值
              padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
              // 纵向排版
              child: Column(
                // 左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                // 子项列表
                children: [
                  // 汉化大标题：特性与案例
                  Text(
                    '特性与技术样例',
                    // 样式定义
                    style: TextStyle(
                      // 字号 34
                      fontSize: 34,
                      // 粗体
                      fontWeight: FontWeight.w700,
                      // 动态文本色
                      color: CupertinoColors.label.resolveFrom(context),
                      // 字符间距
                      letterSpacing: -0.5,
                    ),
                  ),
                  // 间距 8 像素
                  SizedBox(height: 8),
                  // 汉化副标题
                  Text(
                    '组件工作模式与高级渲染参数调试参考。',
                    // 样式定义
                    style: TextStyle(
                      // 字号 15
                      fontSize: 15,
                      // 次级文本色
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                  ),
                  // 间距 24 像素
                  SizedBox(height: 24),

                  // 第一行：导航模式 + 弹出菜单
                  Row(
                    children: [
                      Expanded(
                        child: _SmallDemoCard(
                          title: '导航复合模式',
                          icon: CupertinoIcons.rectangle_split_3x1,
                          color: const Color(0xFF007AFF),
                          destination: const NavBarPatternsDemo(),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: _SmallDemoCard(
                          title: '液态弹出菜单',
                          icon: CupertinoIcons.ellipsis_circle_fill,
                          color: const Color(0xFFFF9500),
                          destination: const MenuDemoPage(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),

                  // 模态抽屉全景演示大卡片
                  _LargeDemoCard(
                    title: '模态抽屉 (Modal Sheets)',
                    subtitle: '标准吸附、半屏快速预览、地图模式与智能静默抽屉',
                    icon: CupertinoIcons.rectangle_on_rectangle,
                    gradient: const [
                      Color(0xFF0E4D92),
                      Color(0xFF5AC8FA),
                    ],
                    destination: const ShowcaseApp(),
                  ),
                  SizedBox(height: 14),

                  // 第二行：输入框测试 + 视频播放器
                  Row(
                    children: [
                      Expanded(
                        child: _SmallDemoCard(
                          title: '透光输入框',
                          icon: CupertinoIcons.textbox,
                          color: const Color(0xFF34C759),
                          destination: const TextFieldDemo(),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: _SmallDemoCard(
                          title: '流体视频播放器',
                          icon: CupertinoIcons.play_circle_fill,
                          color: const Color(0xFFFF2D55),
                          destination: const VideoGlassDemoPage(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),

                  // 第三行：动态标签宽度 + 原生地图混合穿透
                  Row(
                    children: [
                      Expanded(
                        child: _SmallDemoCard(
                          title: '动态标签宽度',
                          icon: CupertinoIcons.slider_horizontal_3,
                          color: const Color(0xFFAF52DE),
                          destination: const TabWidthDemoPage(),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: _SmallDemoCard(
                          title: '原生地图穿透',
                          icon: CupertinoIcons.map_fill,
                          color: const Color(0xFF5AC8FA),
                          destination: const PlatformViewDemo(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),

                  // 第四行：折叠应用栏 + 渲染画质分级对比
                  Row(
                    children: [
                      Expanded(
                        child: _SmallDemoCard(
                          title: '流体折叠应用栏',
                          icon: CupertinoIcons.arrow_down_right_circle_fill,
                          color: const Color(0xFF30D158),
                          destination: const CollapseBarDemoPage(),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: _SmallDemoCard(
                          title: '画质分级对比',
                          icon: CupertinoIcons.sparkles,
                          color: const Color(0xFFFFB340),
                          destination: const GlassQualityComparisonDemo(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),

                  // 演示大卡片：按钮与 GPU 硬件级阴影
                  _LargeDemoCard(
                    title: '按钮标高与 GPU 硬件阴影',
                    subtitle: '多层玻璃海拔高度模拟与着色器级 SDF 超柔和柔光阴影',
                    icon: CupertinoIcons.layers_fill,
                    gradient: const [
                      Color(0xFFFFB340), // 琥珀黄
                      Color(0xFFE58600), // 深橙色
                    ],
                    destination: const ShadowClippingDemoPage(),
                  ),
                  SizedBox(height: 14),

                  // 演示大卡片：内容感知自适应明暗
                  _LargeDemoCard(
                    title: '背景内容感知自适应明暗',
                    subtitle: '随着滚动内容自动计算明暗度并无缝切换流体玻璃反光模式',
                    icon: CupertinoIcons.sun_dust_fill,
                    gradient: const [
                      Color(0xFF1C1C2E),
                      Color(0xFF5AC8FA),
                    ],
                    destination: const ContentAwareBrightnessDemo(),
                  ),
                  SizedBox(height: 14),

                  // 演示大卡片：胶囊指示器实时调节器
                  _LargeDemoCard(
                    title: '胶囊指示器物理调优实验室',
                    subtitle: '5 大液态胶囊控件 — 实时手势捏合/拉伸/光学色散调节器',
                    icon: CupertinoIcons.dial_fill,
                    gradient: const [
                      Color(0xFF5E3AFF),
                      Color(0xFF0A84FF),
                    ],
                    destination: const IndicatorParityDemoPage(),
                  ),
                  SizedBox(height: 14),

                  // 演示大卡片：RTL 镜像排版
                  _LargeDemoCard(
                    title: 'RTL 从右向左语言排版',
                    subtitle: '在阿拉伯语等 RTL 语系下自动镜像物理动效与流体布局',
                    icon: CupertinoIcons.arrow_right_arrow_left_square_fill,
                    gradient: const [
                      Color(0xFF8E2DE2),
                      Color(0xFF4A00E0),
                    ],
                    destination: const RtlLayoutDemo(),
                  ),
                  SizedBox(height: 14),

                  // 演示大卡片：光学半月板与模糊测试
                  _LargeDemoCard(
                    title: '光学边缘暗化与 24 抽样模糊实验室',
                    subtitle: '边缘吸光率 (edgeAbsorption) 与 24-tap 极限模糊压测',
                    icon: CupertinoIcons.circle_righthalf_fill,
                    gradient: const [
                      Color(0xFF00C6FF),
                      Color(0xFF0072FF),
                    ],
                    destination: const MeniscusAndBlurDemoPage(),
                  ),
                  SizedBox(height: 14),

                  // 底部安全避让间距
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// 公共通用页面跳转与卡片渲染基础组件（已全面注释）
// =============================================================================

// 统一定义页面跳转路由函数，包含防连点保护逻辑
void _openDemo(BuildContext context, Widget destination) {
  // 获取当前上下文对应的导航器
  final nav = Navigator.of(context);
  // 如果用户正在执行侧滑返回等手势操作，则阻止重复压栈跳转
  if (nav.userGestureInProgress) return;
  // 执行 Cupertino 风格平滑页面跳转动画
  nav.push(CupertinoPageRoute<void>(builder: (_) => destination));
}

// 错落有致的流体玻璃目录卡片组件类
class _StaggeredCatalogCard extends StatelessWidget {
  // 构造函数
  const _StaggeredCatalogCard({
    // 必需的展示图标
    required this.icon,
    // 必需的主标题文字
    required this.title,
    // 必需的副标题描述
    required this.subtitle,
    // 可选的指定高度值
    this.height,
    // 必需的点击跳转目标页面组件
    required this.destination,
  });

  // 图标数据属性
  final IconData icon;
  // 主标题字符串属性
  final String title;
  // 副标题字符串属性
  final String subtitle;
  // 卡片高度属性
  final double? height;
  // 目标页面 Widget 属性
  final Widget destination;

  // 构建卡片组件结构
  @override
  Widget build(BuildContext context) {
    // 获取当前上下文是否处于暗黑深色模式
    final isDark = CupertinoTheme.brightnessOf(context) == Brightness.dark;

    // 构建自定义流体玻璃按钮作为卡片实体
    Widget button = GlassButton.custom(
      // 点击触发页面跳转
      onTap: () => _openDemo(context, destination),
      // 宽度撑满父容器
      width: double.infinity,
      // 高度优先取自定义值，未指定则取 254 默认高卡片尺寸
      height: height ?? 254,
      // 设置平滑超椭圆圆角（20 像素半径）
      shape: const LiquidRoundedSuperellipse(borderRadius: 20),
      // 按压时微缩放比例
      interactionScale: 0.98,
      // 手势拉伸阻尼弹性
      stretch: 0.06,
      // 子内容左上角对齐
      alignment: Alignment.topLeft,
      // 定制卡片专属流体玻璃渲染参数
      settings: LiquidGlassSettings(
        // 玻璃物理厚度
        thickness: 18,
        // 背景模糊度
        blur: 16,
        // 菲涅尔光泽强度
        fresnelStrength: 0.40,
        // 边缘吸光率
        edgeAbsorption: 0.10,
        // 高光光照强度
        lightIntensity: 0.45,
        // 环境漫反射光强
        ambientStrength: 0.07,
        // 根据明暗主题适配透明度
        glassColor: isDark
            ? const Color.fromARGB(28, 255, 255, 255)
            : const Color.fromARGB(40, 255, 255, 255),
      ),
      // 内部子组件添加 16 像素内边距
      child: Padding(
        padding: const EdgeInsets.all(16),
        // 纵向排版
        child: Column(
          // 左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          // 子组件列表
          children: [
            // 顶部小图标
            Icon(
              icon,
              // 次级文本色
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              // 尺寸 24
              size: 24,
            ),
            // 中间空白区域弹性撑满
            const Spacer(),
            // 中文主标题文本
            Text(
              title,
              // 样式定义
              style: TextStyle(
                // 字号 17
                fontSize: 17,
                // 半粗体
                fontWeight: FontWeight.w600,
                // 适配主题的主色
                color: CupertinoColors.label.resolveFrom(context),
                // 字符间距
                letterSpacing: -0.2,
              ),
            ),
            // 垂直间距 3 像素
            const SizedBox(height: 3),
            // 中文副标题文本
            Text(
              subtitle,
              // 样式定义
              style: TextStyle(
                // 字号 12
                fontSize: 12,
                // 次级文本色
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
                // 字符间距
                letterSpacing: -0.1,
              ),
            ),
          ],
        ),
      ),
    );

    // 返回构建好的玻璃卡片
    return button;
  }
}

// 紧凑型彩色演示小卡片组件类
class _SmallDemoCard extends StatelessWidget {
  // 构造函数
  const _SmallDemoCard({
    // 必需的主标题
    required this.title,
    // 必需的图标
    required this.icon,
    // 必需的主题色
    required this.color,
    // 必需的目标页面
    required this.destination,
  });

  // 标题属性
  final String title;
  // 图标属性
  final IconData icon;
  // 强调色彩属性
  final Color color;
  // 目标页面组件属性
  final Widget destination;

  // 构建小卡片 UI
  @override
  Widget build(BuildContext context) {
    // 包装手势检测器
    return GestureDetector(
      // 点击触发跳转
      onTap: () => _openDemo(context, destination),
      // 卡片容器
      child: Container(
        // 固定高度 100 像素
        height: 100,
        // 装饰样式
        decoration: BoxDecoration(
          // 渐变填充
          gradient: LinearGradient(
            // 起点：左上
            begin: Alignment.topLeft,
            // 终点：右下
            end: Alignment.bottomRight,
            // 色彩数组：由 70% 透明度过渡至 100% 实色
            colors: [
              color.withValues(alpha: 0.7),
              color,
            ],
          ),
          // 16 像素圆角
          borderRadius: BorderRadius.circular(16),
        ),
        // 内边距 16 像素
        padding: EdgeInsets.all(16),
        // 纵向排版
        child: Column(
          // 左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          // 子组件
          children: [
            // 白色图标，尺寸 22
            Icon(icon, color: CupertinoColors.white, size: 22),
            // 撑开空白
            const Spacer(),
            // 中文标题文字
            Text(
              title,
              // 样式定义
              style: TextStyle(
                // 字号 16
                fontSize: 16,
                // 粗体
                fontWeight: FontWeight.w700,
                // 白色文字
                color: CupertinoColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 横幅型彩色演示大卡片组件类
class _LargeDemoCard extends StatelessWidget {
  // 构造函数
  const _LargeDemoCard({
    // 必需的主标题
    required this.title,
    // 必需的副标题
    required this.subtitle,
    // 必需的图标
    required this.icon,
    // 必需的渐变色列表
    required this.gradient,
    // 必需的目标页面
    required this.destination,
  });

  // 标题属性
  final String title;
  // 副标题属性
  final String subtitle;
  // 图标属性
  final IconData icon;
  // 渐变色彩数组属性
  final List<Color> gradient;
  // 目标页面组件属性
  final Widget destination;

  // 构建大卡片 UI
  @override
  Widget build(BuildContext context) {
    // 包装手势检测器
    return GestureDetector(
      // 点击触发页面跳转
      onTap: () => _openDemo(context, destination),
      // 卡片容器
      child: Container(
        // 固定高度 120 像素
        height: 120,
        // 装饰样式
        decoration: BoxDecoration(
          // 线性渐变
          gradient: LinearGradient(
            // 起点：左上
            begin: Alignment.topLeft,
            // 终点：右下
            end: Alignment.bottomRight,
            // 传入的渐变色集合
            colors: gradient,
          ),
          // 20 像素平滑圆角
          borderRadius: BorderRadius.circular(20),
        ),
        // 四周内边距 20 像素
        padding: EdgeInsets.all(20),
        // 水平横向排版
        child: Row(
          // 子组件列表
          children: [
            // 左侧文字区域自适应撑满剩余宽度
            Expanded(
              // 垂直纵向排版
              child: Column(
                // 左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                // 垂直居中
                mainAxisAlignment: MainAxisAlignment.center,
                // 子项
                children: [
                  // 中文主标题文本
                  Text(
                    title,
                    // 样式定义
                    style: TextStyle(
                      // 字号 20
                      fontSize: 20,
                      // 粗体
                      fontWeight: FontWeight.w700,
                      // 纯白色
                      color: CupertinoColors.white,
                    ),
                  ),
                  // 间距 4 像素
                  SizedBox(height: 4),
                  // 中文副标题文本
                  Text(
                    subtitle,
                    // 样式定义
                    style: TextStyle(
                      // 字号 13
                      fontSize: 13,
                      // 白色 70% 透明度
                      color: CupertinoColors.white.withValues(alpha: 0.7),
                      // 1.3 倍行高
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            // 间距 16 像素
            SizedBox(width: 16),
            // 右侧半透明毛玻璃圆形/圆角图标徽章
            Container(
              // 宽度 52
              width: 52,
              // 高度 52
              height: 52,
              // 装饰
              decoration: BoxDecoration(
                // 20% 透明度白色背景
                color: CupertinoColors.white.withValues(alpha: 0.2),
                // 14 像素圆角
                borderRadius: BorderRadius.circular(14),
              ),
              // 白色图标，尺寸 26
              child: Icon(icon, color: CupertinoColors.white, size: 26),
            ),
          ],
        ),
      ),
    );
  }
}
