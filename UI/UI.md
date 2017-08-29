01 交互
----------
IBOutlet和IBAction 前者是引用，后者是操作。IBAction 有一个参数sender，用来指向操作对象。
IBAction 中的一些事件类型。
1.Touch Down Inside：触碰，只要我们碰到不动就算触发了事件
2.Touch Up  Inside：抬离，和1不同的是，触碰后在原位置抬手，触发事件
3. Touch Up Outside： 抬离（范围外），和2不同的是，触碰后手指离开按钮的范围然后再抬手
4. 编辑/更改：编辑语言、背景，系统设置之类的

最常用的第二种事件。

交互还可以应用导航，导航的话就是多个页面间的切换。NavitationController

现在来说的是导航的一些特点，导航有导航栈，栈的特点是后进先出，所以对页面的安排也是这样，这也符合我们的使用习惯。

除了导航，我们还可以用storyboard中的Segue（过渡），从一个页面过渡到另一个页面，也可以叫穿越。过渡有三部分：显示、反向、模态弹出。
    显示：是指从第一个页面到第二个页面，使用push是追加，而使用replace是替换。 
    模态：是弹出，比如我们的程序需要输入账号和密码，如果不输入只能关闭。
    反向：后退到之前的场景。
    
    
02 本地化及自动布局
----------
点开Supporting Files中的Info.plist。
右侧第一栏选中China，这样如果遇到一些系统组件，那么会自动变成中文的。

文本框 textfield
注意这里的placeholder（占位符），代表在你没有输入内容的时候的显示信息：   
    
还有这个属性Clear Button，也要注意一下，选择Appear while editing，代表我输入的时候如果不想要输入了可以一次性把输入的内容全部删除，只有输入的时候才会出现。 
    
自动布局就是我的文本框根据设备尺寸自动调整，专业术语叫约束，如何对文本框进行约束？主要是约束它上下左右的距离，我们选中文本框然后按住control键把它的连线拖拽到顶部，选择 Top Space to Layout Guide，同样对左右拖拽选择，然后文本框周围会出现三条线

大家可以按键盘上的command键+左右方向键旋转屏幕来试试。那么自动约束就实现了。    
    
    
03 second scene 
------------
直接拖拽Table View Controller到storyboard中，会多出一个屏幕来

现在我们是有两个场景的，下面的View Controller是我们创建工程就有的，而上面的是我们刚才新建出的Table View Controller。

is Initial View Controller

另外，直接拖动箭头也是可以的。

现在我们在这个列表中添加一些数据。选中table view我们来看下属性编辑器的第一行，表格中的数据有两种类型，动态和静态.

静态只显示，而动态可以直接在表格中添加，如图，我们先选择静态，让表格有一些数据可以看。选择静态之后，会出现三行，然后点击层次中的tableviewcell，右侧style选择basic，三行都如此，会出现三个title，我们选择默认的title，可以编辑。之后按住键盘上的option键可以复制。    
    
04 场景过渡
--------

我们想要实现两个场景间的过渡。我们只需要增加一个导航条。选中我们上一话中创建的Table View Controller，点击工具栏上面的editor，选择Embed in（嵌入），选择Navigation Controller。

在tableviewcontroller最顶端会空出一个区域来，我们可以在里面命名，比如我命名为“餐馆排行”，在导航栏上左右各添加一个按钮，去控件中寻找Bar Button Item，这个是专门用到导航条或者工具栏上的。
把它拖到导航栏右侧，在属性编辑器里面编辑它,它有很多种类型，如果是添加按钮，选择add，按钮会变成一个加号。再添加一个edit按钮

同理，给新增餐馆列表中增加一个导航，导航栏中设置两个按钮，一个“完成”，一个“取消”。接下来要通过第一个场景中的加号，点击后跳转到第二个场景。和我们之前连线的方法一样，我们需要按住control键从加号中拖出一条线到第二个场景的navigationcontroller中，会出现下面这些选项，这代表了不同的转场方式，比如直接展示，弹窗等等，选择，show。这时候运行看看是不是可以通过点击“+”实现转场了。如果你把新增场景的确认和返回按钮删除的话，转场后会有个默认的返回按钮，点击可以回到第一个场景中。


这就是堆栈的表现。因为我们要保留新增餐馆的功能，还是把两个按钮加上，然后把模式改为第三个。

就变成了必须有输入才能返回的模式了，可以看到转场的时候场景是从屏幕的下方滑上来的。


05 定制视图控制器
-------------
我们之前一直在storyboard上做操作，现在来些一些代码。
在工程目录中右键选择new fie，在iOS的Source中选择Cocoa Touch Class

点击Next,可以看到xcode给我们创建了一个继承了UIViewController的类：

选中新增餐馆的viewcontroller，然后在右边选中类编辑器，custom class中选择我们自己的类，选中后现在变成我们自己的类来接管了。


现在同样自定义餐馆排行这个场景的控制器，不同的是这个控制器类型是UITableViewController。

06 反向过渡
-----------

我们第二个场景设置过渡的时候选择的是modal类型，不是push。所以用户输入后需要手工返回。导航条上有两个按钮，完成和取消。所以我们要对这两个按钮进行反向过渡，我们需要在事件源头添加@IBAction。

@IBAction func unwindToList(segue:UIStoryboardSegue){  
    
  }  

以上代码应该添加到RestaurantListViewController中，unwindToList代表反向过渡。然后回到storyboard中，选择新增餐馆的页面，按住control拖动两个按钮到顶部的EXIT中，会弹出我们刚才定义的那个方法，选中。

运行一下看看是不是可以返回了。现在表格的内容没有了，我们选中表格，把静态内容改成动态


07 数据添加
----------
我们使用了自己定义的控制器之后发现tableview上的餐馆没有了，这一话我们来添加数据，新添加一个餐馆类，这个类我们不需要继承系统的类，直接添加一个Swift文件就好

但是现在我们运行会发现表格中依然空空如也，这是为什么呢？原来是我们并没有使用委托，我们需要把更新的表格内容委托给控制器。由于我们是子代理，所以需要重载控制器的很多方法


打开storyboard，选择某一table view cell然后设定Identifier，命名为PCell。底下的Selection是选中样式，有以下几种：

None，Blue，Gray，Default。

这个方法的作用是重用我们刚才设置的默认格式。现在我们对cell格式和内容的操作都在上面这个方法中进行就好了。增加一行：

08 展示数据
-------

现在我想要点击表单中的条目，进行标记，再次点击以取消，那么该如何做呢？依然使用的是tableView的重载方法，在
Restaurant中新增一个isCollected的值表示是否收藏，然后回到RestaurantListViewController中，新增：

但是运行的时候是没有反应的，虽然状态已经改了，但是没有体现到页面上，现在应该在页面上增加一个标记，更改后的控制cell的tableView方法如下

再点一下就取消了，除了勾之外还有很多有趣的标识，大家可以试试。
导航上还有编辑按钮，现在我们来实现编辑功能。现在点击左边的编辑按钮是没反应的，我们需要在viewDidLoad中增加下面的语句：

self.navigationItem.leftBarButtonItem = self.editButtonItem()  
要让系统知道导航坐标的按钮是我们的编辑按钮，然后在控制器中加入一个新的方法setEditing，这个也是自动补全的，代码如下：

    override func setEditing(editing: Bool, animated: Bool) {  
        super.setEditing(editing, animated: true)//先实现父类的  
        tableView.setEditing(editing, animated: true)  
    }  

点击完成会返回。点击左边的红色图标右侧会滑出删除按钮，点击按钮会删除当前行，只需要在控制器中新增一个方法就好，代码如下：

     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {  
    if editingStyle == UITableViewCellEditingStyle.Delete{//如果是删除按钮  
    restaurantList.removeAtIndex(indexPath.row)//先删除数组中的元素  
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)//删除列表行，其他行向上推  
          
    }  
}  



09  添加数据
--------

我们来实现新增数据的功能。在新增餐馆的控制器中初始化一个类：

接着创建关联，按住control键选择done按钮拖拽到控制器代码中：


同理把文本框也拖过去。回到控制器中有一个方法已经为我们准备好了
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {  
       // Get the new view controller using segue.destinationViewController.  
       // Pass the selected object to the new view controller.  
         
       if sender as NSObject == doneButton {  
           if(!textField.text.isEmpty){  
           restaurant.name = textField.text  
           }  
       }  
   }  

判断是不是点击了完成按钮，如果是，把文本框中的内容保存到实例中。回想我们之前在另一个场景设置的反向过渡还没有使用，现在在其中增加代码如下：

@IBAction func unwindToList(segue:UIStoryboardSegue){  
   let source = segue.sourceViewController as AddRestaurantViewController  
      let r1 = source.restaurant  
       if r1.name != "" {  
       restaurantList.append(r1)  
       }  
   }  

 
10 视图共性
------
视图的内容：
1.视图的实现：视图的基类是UIView
2.视图的Mode：尺寸填充模式，就是当尺寸超过了我们设定的值的时候采取什么适合屏幕的填充方式。
3.Tag：标记序号
       
视图的行为：
   主要有互动和绘图，互动是指用户的一些操作，可以通过勾选选择是否采用互动和多点触控。
   
绘图包括：透明度、可见、清除图像内容、截断子视图边界、子视图自动尺寸。

试图外观：Alpha是透明度，取值是从0到1的：

修改视图外观的代理方法：修改所有使用appearance方法，如果需要修改某个固定的用appearanceWhenContaindeIn方法。
视图的色彩和图片：色彩是tintColor属性，也可以使用UIImage图片。       
    
    
    
    
    
    
    
    
    
    
    
    








