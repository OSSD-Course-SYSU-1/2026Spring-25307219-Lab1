# HarmonyOS工程文件描述

## 工程概述

这是一个仿华为商城的电商应用示例工程，基于HarmonyOS平台开发，采用Stage模型和ArkTS语言。

### 基本信息

| 配置项 | 值 |
|--------|-----|
| 应用名称 | harmonyHelloWorld |
| 包名 | com.example.harmonyhelloworld |
| 厂商 | example |
| 版本号 | 1000000 |
| 版本名 | 1.0.0 |
| 支持设备 | phone, tablet, 2in1 |
| 权限 | ohos.permission.INTERNET |

### SDK版本

- 兼容SDK版本: 5.0.0(12)
- 目标SDK版本: 6.0.2(22)
- 运行时: HarmonyOS

## 工程目录结构

```
harmonyProject-master/
├── AppScope/                    # 应用全局配置
│   ├── app.json5               # 应用级配置文件
│   └── resources/              # 应用级资源文件
│       └── base/
│           ├── element/        # 字符串资源
│           └── media/          # 应用图标
├── entry/                       # 主模块（HAP）
│   ├── src/
│   │   ├── main/               # 主源代码
│   │   │   ├── ets/            # ArkTS源码
│   │   │   ├── resources/      # 资源文件
│   │   │   └── module.json5    # 模块配置文件
│   │   ├── ohosTest/           # 测试代码
│   │   └── test/               # 单元测试
│   ├── build-profile.json5     # 模块构建配置
│   └── hvigorfile.ts           # 模块构建脚本
├── hvigor/                      # Hvigor构建工具配置
├── oh_modules/                  # 依赖模块
├── build-profile.json5          # 工程构建配置
├── hvigorfile.ts                # 工程构建脚本
├── oh-package.json5             # 工程依赖配置
├── oh-package-lock.json5        # 依赖锁定文件
└── README.md                    # 项目说明文档
```

## 主要配置文件

### 1. build-profile.json5（工程级）

```json5
{
  "app": {
    "signingConfigs": [],
    "products": [
      {
        "name": "default",
        "compatibleSdkVersion": "5.0.0(12)",
        "runtimeOS": "HarmonyOS",
        "targetSdkVersion": "6.0.2(22)"
      }
    ],
    "buildModeSet": [
      { "name": "debug" },
      { "name": "release" }
    ]
  },
  "modules": [
    {
      "name": "entry",
      "srcPath": "./entry"
    }
  ]
}
```

### 2. AppScope/app.json5（应用配置）

```json5
{
  "app": {
    "bundleName": "com.example.harmonyhelloworld",
    "vendor": "example",
    "versionCode": 1000000,
    "versionName": "1.0.0",
    "icon": "$media:app_icon",
    "label": "$string:app_name"
  }
}
```

### 3. entry/src/main/module.json5（模块配置）

```json5
{
  "module": {
    "requestPermissions": [
      { "name": "ohos.permission.INTERNET" }
    ],
    "name": "entry",
    "type": "entry",
    "description": "$string:module_desc",
    "mainElement": "EntryAbility",
    "deviceTypes": ["phone", "tablet", "2in1"],
    "pages": "$profile:main_pages",
    "abilities": [
      {
        "name": "EntryAbility",
        "srcEntry": "./ets/entryability/EntryAbility.ets",
        "icon": "$media:layered_image",
        "label": "$string:EntryAbility_label",
        "startWindowIcon": "$media:startIcon",
        "exported": true
      }
    ],
    "extensionAbilities": [
      {
        "name": "EntryBackupAbility",
        "type": "backup",
        "exported": false
      }
    ]
  }
}
```

### 4. oh-package.json5（依赖配置）

```json5
{
  "dependencies": {
    "@ohos/axios": "^2.2.2"
  },
  "devDependencies": {
    "@ohos/hypium": "1.0.18",
    "@ohos/hamock": "1.0.0"
  }
}
```

## 源代码组织结构

### 页面模块（entry/src/main/ets/pages/）

```
pages/
├── Index.ets                    # 主入口页面（底部导航）
├── activity/                    # 活动/发现模块
│   ├── Activity.ets
│   └── product/
│       └── NewProduct.ets
├── category/                    # 分类模块
│   ├── Classify.ets
│   └── classify/
│       └── ClassifyList.ets
├── home/                        # 首页模块
│   ├── Home.ets
│   └── main/
│       ├── HomeBanner.ets       # 轮播图
│       ├── HomeClassify.ets     # 分类导航
│       ├── HomeHeader.ets       # 首页头部
│       ├── HomeRecommend.ets    # 推荐商品
│       ├── HomeSubarea.ets      # 子区域
│       ├── HomeTab.ets          # Tab切换
│       └── HomeWelfare.ets      # 福利专区
├── login/                       # 登录模块
│   ├── Login.ets
│   └── CountryRegion.ets        # 国家地区选择
├── product/                     # 商品详情模块
│   ├── ProductDetail.ets
│   ├── PageBottomNavBox.ets
│   └── PageTopNavBox.ets
├── search/                      # 搜索模块
│   ├── SearchPage.ets
│   ├── SearchShowPage.ets
│   ├── filter/
│   │   └── SearchFilter.ets
│   └── tip/
│       └── SearchTop.ets
├── shoppingCart/                # 购物车模块
│   └── ShoppingCart.ets
└── userCenter/                  # 用户中心模块
    └── UserCenter.ets
```

### 组件模块（entry/src/main/ets/components/）

```
components/
├── common/                      # 通用组件
│   ├── Drawer.ets              # 抽屉组件
│   ├── GoodPick.ets            # 商品精选
│   ├── Navigate.ets            # 导航组件
│   └── VideoModule.ets         # 视频模块
└── image/
    └── ImageSwiperPreview.ets  # 图片轮播预览
```

### API层（entry/src/main/ets/api/）

```
api/
├── home/
│   └── index.ets               # 首页API
├── search/
│   ├── index.ets               # 搜索API
│   └── type.ets                # 类型定义
└── httpRequest.ets             # HTTP请求封装
```

### 工具类（entry/src/main/ets/utils/）

```
utils/
├── constant.ets                # 常量定义
└── font/                       # 字体资源
    ├── iconfont.ttf
    ├── iconfont.css
    └── ...
```

### 视图模型（entry/src/main/ets/viewModal/）

```
viewModal/
├── classifyData.ets            # 分类数据
└── orderByLetterData.ets       # 字母排序数据
```

### Ability类

```
entryability/
└── EntryAbility.ets            # 主入口Ability
entrybackupability/
└── EntryBackupAbility.ets      # 备份Ability
```

## 功能模块说明

### 1. 首页模块

- 轮播图展示
- 横向滚动菜单
- 分类导航
- 推荐商品
- 福利专区

### 2. 分类模块

- 分类列表展示
- 字母索引导航

### 3. 发现/活动模块

- 活动页面
- 新品展示

### 4. 购物车模块

- 商品列表
- 数量管理

### 5. 用户中心模块

- 用户信息展示

### 6. 登录/注册模块

- 登录页面
- 国家地区选择（带导航）

### 7. 搜索模块

- 搜索页面
- 搜索结果展示
- 搜索筛选
- 数据持久化（历史记录）

### 8. 商品详情模块

- 商品图片轮播预览
- 商品信息展示
- 顶部/底部导航栏

### 9. 视频模块

- 视频播放功能

### 10. 网络请求

- 基于axios的HTTP请求封装
- 首页数据接口
- 搜索接口

## 注册页面路由

```json5
{
  "src": [
    "pages/Index",
    "pages/login/CountryRegion",
    "pages/login/Login",
    "pages/search/SearchPage",
    "pages/search/SearchShowPage",
    "pages/product/ProductDetail"
  ]
}
```

## 资源文件结构

```
resources/
├── base/                       # 基础资源
│   ├── element/
│   │   ├── string.json         # 字符串资源
│   │   └── color.json          # 颜色资源
│   ├── media/                  # 媒体资源（图片、图标）
│   └── profile/
│       ├── main_pages.json     # 页面路由配置
│       └── backup_config.json  # 备份配置
├── zh_CN/                      # 中文资源
│   └── element/
│       └── string.json
├── en_US/                      # 英文资源
│   └── element/
│       └── string.json
└── rawfile/                    # 原始文件
    └── video1.mp4              # 视频文件
```

## 工程依赖

### 运行时依赖

- @ohos/axios (v2.2.2): HTTP网络请求库

### 开发依赖

- @ohos/hypium (v1.0.18): 测试框架
- @ohos/hamock (v1.0.0): Mock测试工具

## 构建配置

- SDK版本: 兼容SDK 5.0.0(12)，目标SDK 6.0.2(22)
- 运行时: HarmonyOS
- 构建模式: debug和release
- API类型: stageMode（Stage模型）
- 混淆: release模式下启用代码混淆

## 关键技术特点

1. ArkTS语言: 使用ArkTS进行UI开发
2. Stage模型: 采用Stage模型（非FA模型）
3. 组件化开发: 页面和组件分离，复用性强
4. 网络请求: 集成axios进行HTTP请求
5. 数据持久化: 搜索历史记录持久化
6. 国际化: 支持中英文双语
7. 自定义字体: 集成iconfont图标字体
8. 代码混淆: Release版本启用代码混淆
9. 备份扩展: 支持应用数据备份功能

## 总结

这是一个结构完整的HarmonyOS电商应用示例工程，采用Stage模型，使用ArkTS开发。工程组织清晰，模块划分合理，涵盖了电商应用的核心功能模块，适合作为HarmonyOS应用开发的参考案例。
