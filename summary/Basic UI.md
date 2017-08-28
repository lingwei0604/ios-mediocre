
UIButton
UIAlertController 弹出式的提示框 （可以实现UITableView点击某一行cell）
(iOS8 之前叫 UIAlertView)

UISegmentedControl 分段控件，一栏按钮集成在一排里。

UISwitch 按钮控件，

UISlider 进度条形的选择控件，对应数值，可以设置音量

UIPageControl 好东西 可以搭配 UIScrollView

UITextField 简单控件

UIDatePicker 日期选择控件

UIScrollView 图片放大

UITextView 可编辑文本框，可以显示多行，对编辑进行监控。
通过代理方法，获取文本框中的内容。


UIToolbar  UIBarButtonItem，Fixed Space Bar   Button Item
在Bar 上的按钮和间距，都被对象化了。

UIPickerView
类似时间选择器，只不过这个你可以自己设置内容。

UITableView

异常强大。

UICollectionView
总结一下步骤：
.h文件声明代理和数据源
.m文件具体实现
	.声明UICollectionView
	.实例化，包括设置大小，位置，颜色等等。
	.加载代理和数据源实例化的view
	.注册cell（这里需要）
	.将实例化的UICollectionView加入到View中
	.实现数据源方法（包括必须实现和选择实现）
	.实现代理方法（包括必须实现和选择实现）
	

关于数据源方法和代理方法，在这里需要特别说明一下，我们还是会出现不知道这个数据源或者代理中到底有什么的困惑，我们要command进去这些代理或者数据源去发现和寻找，文档还是我们学习的最终归宿。

UIViewController 视图控制器 MVC模式中扮演着重要的角色，作为显示和数据的调度者。

UINavigationController

导航视图控制器，存放视图的栈，原则上先进后出，一层一层的来管理在它里面的视图。在学习它的过程中还要掌握UINavigationBar、UINavigationitem等控件，还要熟悉几个pop、push方法。

UITabbarController

区别于UINavigationController的顶部导航，UITabbarController是底部导航，功能上差不多，可以直接切换多个视图，典型的应用非常多，微信，QQ都是，实现起来也是类似于上面的UINavigationController。























