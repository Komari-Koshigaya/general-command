# github相关操作

> 本文包括github的个性化配置

# 帅气的 github 主页

> 参考文章：[给自己弄一个酷酷的Github主页吧](https://blog.csdn.net/sinat_23133783/article/details/107643656)
>
> [2020年，一招教你打造个性化的Github主页！](https://blog.csdn.net/zwluoyuxi/article/details/107600491)

## 那些眼前一亮的主页

> 更多关于主页的模版项目：[Awesome-Profile-README-templates](https://github.com/kautukkundan/Awesome-Profile-README-templates) ，大家可以参考下别人的设计思路！

[AVS1508](https://github.com/avs1508)

![awesome github index](assets/awesome_github_index.png)



[amchuz](https://github.com/amchuz)

![awesome github index2](assets/awesome_github_index_2.png)



## 开启github主页

创建同名仓库, 同名是一个特殊的仓库，可以通过添加一个 `README.md`显示在你的Github个人主页。但必须保证仓库是public的并且有README文件。

![img](assets/create_github_main.png)

## 制作徽章Badge

[shields](https://shields.io/) 网站提供了很多徽章类型，要包括了：构建、代码覆盖率、分析
闲谈，聊天、依赖关系、大小、下载等等。

当在网站上设计好徽章之后，只需要将生成的URL放到README中，就可以在主页上看到啦，非常简单。

##  github-readme-stats

>  [github-readme-stats](https://github.com/anuraghazra/github-readme-stats)  包括展示github的stars、commits、prs、issues ，展示github中使用的语言统计和 仓库

### GitHub Stats Card 统计信息

> 展示github 统计信息

只需在 readme.md 插入 

~~~md
![xxx's github stats](https://github-readme-stats.vercel.app/api?username=xxx)  
~~~

即可得到类似以下效果

![Anurag's github stats](https://github-readme-stats.vercel.app/api?username=anuraghazra)

还可以 选择显示的主题模式，在后面调用?theme=THEME_NAME 参数就可以了，内置了很多。如下：*dark, radical, merko, gruvbox, tokyonight, onedark, cobalt, synthwave, highcontrast, dracula*  更多主题详见 [all available themes](https://github.com/anuraghazra/github-readme-stats/blob/master/themes/README.md)

~~~md
![xxx's github stats](https://github-readme-stats.vercel.app/api?username=xxx&theme=solarized-light)  
~~~

即可得到类似以下效果

![更改显示的主题](assets/github_stat_theme.png)

### github-extra-pins 贴出项目

```
![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=anuraghazra&repo=github-readme-stats)
```


![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=anuraghazra&repo=github-readme-stats)

更改主题  [all available themes](https://github.com/anuraghazra/github-readme-stats/blob/master/themes/README.md)

```
![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=xxx&repo=xxxrepo&theme=vue)
```


![ReadMe Card](https://github-readme-stats.vercel.app/api/pin/?username=Komari-Koshigaya&repo=apue-lab&theme=vue)

### Top Languages Card 语言使用比例

在README.md 插入以下超链接 即可展示个人仓库的常用语言

```
![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=anuraghazra)
```

效果


![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=Komari-Koshigaya)

#### Exclude individual repositories

You can use `?exclude_repo=repo1,repo2` parameter to exclude individual repositories.

```
[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=anuraghazra&exclude_repo=github-readme-stats,anuraghazra.github.io)](https://github.com/anuraghazra/github-readme-stats)
```

#### Hide individual languages

You can use `?hide=language1,language2` parameter to hide individual languages.

```
[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=anuraghazra&hide=javascript,html)](https://github.com/anuraghazra/github-readme-stats)
```

#### Show more languages

You can use the `&langs_count=` option to increase or decrease the number of languages shown on the card. Valid values are integers between 1 and 10 (inclusive), and the default is 5.

```
[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=anuraghazra&langs_count=8)](https://github.com/anuraghazra/github-readme-stats)
```

#### Compact Language Card Layout

You can use the `&layout=compact` option to change the card design.

```
[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=anuraghazra&layout=compact)](https://github.com/anuraghazra/github-readme-stats)
```

- default layout

![Top Langs](https://camo.githubusercontent.com/b442e64c40b022aa25f3c564250a06c14f3e43e6/68747470733a2f2f6769746875622d726561646d652d73746174732e76657263656c2e6170702f6170692f746f702d6c616e67732f3f757365726e616d653d616e7572616768617a7261)

- Compact layout

![Top Langs](https://camo.githubusercontent.com/42e0f9b0053d3c43579fb524e5b0b13a71f439dd/68747470733a2f2f6769746875622d726561646d652d73746174732e76657263656c2e6170702f6170692f746f702d6c616e67732f3f757365726e616d653d616e7572616768617a7261266c61796f75743d636f6d70616374)




### Quick Tip (Align The Repo Cards)

> 若直接使用超链接无法对齐，可使用类似下面的html来实现

```
<a href="https://github.com/anuraghazra/github-readme-stats">
  <img align="center" src="https://github-readme-stats.vercel.app/api/pin/?username=anuraghazra&repo=github-readme-stats" />
</a>
<a href="https://github.com/anuraghazra/convoychat">
  <img align="center" src="https://github-readme-stats.vercel.app/api/pin/?username=anuraghazra&repo=convoychat" />
</a>
```

效果如下

<a href="https://github.com/anuraghazra/github-readme-stats">
  <img align="center" src="https://github-readme-stats.vercel.app/api/pin/?username=anuraghazra&repo=github-readme-stats" />
</a>

<a href="https://github.com/anuraghazra/convoychat">
  <img align="center" src="https://github-readme-stats.vercel.app/api/pin/?username=anuraghazra&repo=convoychat" />
</a>

## 统计代码时长

 这个功能非常有趣，这里我们要利用WakaTime对事情的统计功能，并绑定到Github来实现展示。官网：[WakaTime](https://wakatime.com/)

下面详细讲一下如何部署到Github：

### 1.登录WakaTime官网，注册 一个WakaTime 账号

这里我是直接绑定的Github账号登录，非常方便，推荐！

### 2.在自己常用的 IDE 上下载 WakaTime 插件，配置上自己的 API Key

当注册好账号后，你会得到属于自己专属的API Key。然后在需要监控工作的IDE里安装WakaTime的插件，并配上自己的Key。官方上有非常详细的配置步骤，如下以WebStorm为例：

![img](assets/2020072820135918.png)

到此为止，其实本地的开发环境就已经被WakaTime所监控啦，数据会被传输到WakaTime然后在dashboard中展示。

![img](assets/20200728201540732.png)

除WebStorm外，WakaTime还支持很多其他的开发环境，如下：

![img](assets/20200728201641905.png)

### 3.将自己的 API Key 存到自己 Github 仓库的 secrets中

从项目里点击Setting -> Secrets -> New secret 创建一个。其中name需要填写**WAKATIME_API_KEY**，value就把WakaTime官网生成的API Key粘贴进去就行。

![img](assets/20200728201817954.png)

![img](assets/20200728201843992.png)

![img](assets/20200728201906107.png)

 

### 4.配置 GitHub 仓库的 Actions

我们还需要在项目里配置Actions。点击 Actions -> New workflow 

![img](assets/20200728202244664.png)

![img](assets/20200728202316988.png)

把默认的内容全部删除，把下面的内容粘贴上：

```yml
name: Waka Readme
 
on:
  push:
    branches:
      - master
  workflow_dispatch:
  schedule:
    # Runs at 12am UTC
    - cron: '0 0 * * *'
 
jobs:
  update-readme:
    name: Update this repo's README 
    runs-on: ubuntu-latest
    steps:
      - uses: MartinYan623/waka-readme@master
        with:

```

这里需要改的是uses中的地方换成你自己的路径。

如果出现以下这个报错信息，则是因为uses中的路径错误。如下所示：

![img](assets/20200729161648564.jpg)

**注意：这里需要一个waka-readme的项目，请将https://github.com/athul/waka-readme中的项目fork到自己仓库里就行！ 之前没发现需要fork利用别人写好的东西，结果写的workflow action跑不起来，这里替你们踩坑了！**

### 5.点击 Waka Readme ，再点击run

![img](assets/20200728202811456.png)

 当你看到正常跑起来之后，就离胜利不远啦！

### 6. 在README文件中添加以下这段文字：

~~~
 <!--START_SECTION:waka-->
 <!--END_SECTION:waka-->
~~~

添加修改后，再次提交commit。然后，返回到主页，会看到以下这样，说明WakaTime其实已经关联上你的Github啦！需要等待一段时间（一天），就会同步到Github啦！

![img](assets/20200728203024584.png)

## 关闭个人首页

有一天自闭了，不想在首页向其他人介绍自己，有以下几种方式

- 删除README.me文件。
- 仓库设置为私有。
- 仓库名称不再与Github用户名匹配。

