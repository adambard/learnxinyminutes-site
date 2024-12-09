<!--这意味着我们可以在 Markdown 里使用任何 HTML 元素，比如注释元素，
且不会被 Markdown 解析器所影响。不过如果你在 Markdown 文件内创建了 HTML 元素，
你将无法在 HTML 元素的内容中使用 Markdown 语法。-->
# 这是一个 <h1>
## 这是一个 <h2>
### 这是一个 <h3>
#### 这是一个 <h4>
##### 这是一个 <h5>
###### 这是一个 <h6>
这是一个 h1
=============

这是一个 h2
-------------
*此文本为斜体。*
_此文本也是。_

**此文本为粗体。**
__此文本也是__

***此文本是斜体加粗体。***
**_或者这样。_**
*__这个也是！__*
~~此文本为删除线效果。~~
这是第一段落. 这句话在同一个段落里，好玩么？

现在我是第二段落。
这句话也在第二段落！


这句话在第三段落！
此段落结尾有两个空格（选中以显示）。  

上文有一个 <br /> ！
> 这是一个段落引用。 你可以
> 手动断开你的句子，然后在每句句子前面添加 `>` 字符。或者让你的句子变得很长，以至于他们自动得换行。
> 只要你的文字以 `>` 字符开头，两种方式无异。

> 你也可以对文本进行
>> 多层引用
> 这多机智啊！
* 项目
* 项目
* 另一个项目

或者

+ 项目
+ 项目
+ 另一个项目

或者

- 项目
- 项目
- 最后一个项目
1. 项目一
2. 项目二
3. 项目三
1. 项目一
1. 项目二
1. 项目三
1. 项目一
2. 项目二
3. 项目三
    * 子项目
    * 子项目
4. 项目四
下面方框里包含 'x' 的列表，将会生成选中效果的选择框。
- [ ] 任务一需要完成
- [ ] 任务二需要完成
下面这个选择框将会是选中状态
- [x] 这个任务已经完成
    This is code
    So is this
    my_array.each do |item|
      puts item
    end
John 甚至不知道 `go_to()` 函数是干嘛的!
***
---
- - -
****************

下面这个就是示例
[点我点我!](http://test.com/)
[点我点我!](http://test.com/ "连接到Test.com")
[去 music](/music/).
[点此链接][link1] 以获取更多信息！
[看一看这个链接][foobar] 如果你愿意的话。
[link1]: http://test.com/
[foobar]: http://foobar.biz/
[This][] is a link.
[This]: http://thisisalink.com/
- [Heading](#heading)
- [Another heading](#another-heading)
- [Chapter](#chapter)
  - [Subchapter <h3 />](#subchapter-h3-)
![这是alt,请把鼠标放在图片上](http://imgur.com/myimage.jpg "这是title")
![这是alt][myimage]
[myimage]: relative/urls/cool/image.jpg
<http://testwebsite.com/> 与
[http://testwebsite.com/](http://testwebsite.com/) 等同
<foo@bar.com>
我希望 *将这段文字置于星号之间* 但是我不希望它被
斜体化, 这么做: \*这段置文字于星号之间\*。
你的电脑死机了？试试
<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd>
| 第一列        | 第二列    | 第三列       |
| :----------- | :-------: | ----------: |
| 我是左对齐    | 居个中    | 右对齐       |
| 注意          | 冒       | 号           |
我是超级超级长的第一列 | 第二列 | 第三列
:-- | :-: | --:
这真的太丑了 | 药不能 | 停！！！！