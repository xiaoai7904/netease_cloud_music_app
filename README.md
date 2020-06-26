# 基于 flutter 开发网易云音乐 app 实战项目

- 项目为入门`flutter`学习产出

- 项目使用的数据 api: [Binaryify 写的 NeteaseCloudMusicApi](https://github.com/Binaryify/NeteaseCloudMusicApi)

- 项目是在工作空闲时间开发,开发周期较长,持续更新中...

#### 已开发完成页面

<div style="display:flex; flex-wrap:wrap;">
<img src="tempDir/homePage.gif" width=256 height=550 />

<img src="tempDir/songList.gif" width=256 height=550 />
</div>

#### 开发总结

- 歌单页面`TabBar`如何自定义(Stack + Padding)
- 图片加载优化使用`cached_network_image`
- `Sliver`系列组件里面写普通组件需要用 SliverToBoxAdapter 包裹，才能作为 CustomScrollView 的子组件
