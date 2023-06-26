require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
--import "layout"



activity.setTheme(android.R.style.Theme_DeviceDefault_Light)
activity.ActionBar.hide()
--activity.setContentView(loadlayout(layout))
--标题
activity.setTitle('ASD工具箱')
--文件夹的创建：
import "java.io.File"--导入文件类
--picsave="/sdcard/download/alitao/web_picture/" --注意后面有个/才是文件夹
picture="/sdcard/Asd box/picture/"
--websave="/sdcard/Asd Browser/web_archive/"
backup="/sdcard/Asd box/Chronicle export/"
--File(websave).mkdirs()--如果只创建一级文件夹，请改为mkdir
File(picture).mkdirs()
File(backup).mkdir()
function 波纹(id,颜色)
  import "android.content.res.ColorStateList"local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
end
import "java.io.File"
function 写入文件(路径,内容)
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
end
function 文件是否存在(id)
  return File(id).exists()
end
if 文件是否存在("/data/data/"..activity.getPackageName().."/是否应用内打开.xml")==false then
  写入文件("/data/data/"..activity.getPackageName().."/是否应用内打开.xml","打开")
 else
end
if 文件是否存在("/data/data/"..activity.getPackageName().."/顶栏颜色储存.xml")==false then
  写入文件("/data/data/"..activity.getPackageName().."/顶栏颜色储存.xml","#FFFAFAFA")
 else
end
if 文件是否存在("/data/data/"..activity.getPackageName().."/顶栏标题颜色储存.xml")==false then
  写入文件("/data/data/"..activity.getPackageName().."/顶栏标题颜色储存.xml","#FF33A7AA")
 else
end
if 文件是否存在("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml")==false then
  写入文件("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml","#ff2c2c2c")
 else
end
if 文件是否存在("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml")==false then
  写入文件("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml","#FF33A7AA")
 else
end
if 文件是否存在("/data/data/"..activity.getPackageName().."/隐藏侧滑栏顶部标题.xml")==false then
  写入文件("/data/data/"..activity.getPackageName().."/隐藏侧滑栏顶部标题.xml","关闭")
 else
end
--导入包
import "android.content.Context"

function getwh(view)
  view.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
  height =view.getMeasuredHeight();
  width =view.getMeasuredWidth();
  return height
end
function 引流神器()
  --列表对话框（列表项目名称自定义）
  items={}--定义一个布局为l列表单个项目布局，名字为itemc
  --给空的items添加所有的数据
  --格式为  table.insert(空列表名称,"列表名称")
  table.insert(items,"王者荣耀引流")
  table.insert(items,"领QB引流")
  table.insert(items,"QQ红包引流")
  table.insert(items,"自定义")


  AlertDialog.Builder(this)
  .setTitle("引流神器 V1.0.0")--设置标题
  --给列表对话框设置点击事件
  .setItems(items,{onClick=function(l,v)
      --注：与创建有数据的列表项目名称必须一样
      if items[v+1]=="王者荣耀引流" then
        InputLayout={
          LinearLayout;
          orientation="vertical";
          Focusable=true,
          FocusableInTouchMode=true,
          {
            TextView;
            id="Prompt",
            textSize="15sp",
            layout_marginTop="10dp";
            layout_marginLeft="3dp",
            layout_width="80%w";
            layout_gravity="center",
            text="输入要跳转的链接地址:";
          };
          {
            EditText;
            hint="输入";
            layout_marginTop="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit";
          };
        };
        AlertDialog.Builder(this)
        .setTitle("请输入跳转链接")
        .setView(loadlayout(InputLayout))
        .setPositiveButton("确定", function()
          import "android.util.Base64"
          import "android.net.Uri"
          import "android.content.Intent"
          function base64(text)
            local base64Text=Base64.encodeToString(String(text).getBytes(),Base64.DEFAULT)
            return base64Text
          end
          function qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
            local shareId=分享ID
            local jumpUrl=base64(跳转链接)
            local previewImgUrl=base64(预览图链接)
            local imgUrl=base64(图片链接)
            local title=base64(标题)
            local description=base64(描述)
            local mqqapi="mqqapi://share/to_fri?file_type=news&src_type=web&version=1&share_id="..shareId.."&url="..jumpUrl.."&previewimageUrl="..previewImgUrl.."&image_url="..imgUrl.."&title="..title.."&description="..description.."&callback_type=scheme&thirdAppDsplayName=UVE&app_name=UVE&cflag=0&shareType=0"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(mqqapi)))
          end

          local 分享ID=1104466820
          local 跳转链接=edit.text
          local 预览图链接="https://ws1.sinaimg.cn/large/006N1muNly1g1izhzc4cqj3068068abf.jpg"
          local 图片链接="https://ws1.sinaimg.cn/large/006N1muNly1g1izhzc4cqj3068068abf.jpg "
          local 标题="王者荣耀"
          local 描述="点击抽取皮肤钻石百分百中奖"
          qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
        end)
        .setNeutralButton("取消", nil)
        .show()
       elseif items[v+1]=="领QB引流" then
        InputLayout={
          LinearLayout;
          orientation="vertical";
          Focusable=true,
          FocusableInTouchMode=true,
          {
            TextView;
            id="Prompt",
            textSize="15sp",
            layout_marginTop="10dp";
            layout_marginLeft="3dp",
            layout_width="80%w";
            layout_gravity="center",
            text="输入要跳转的链接地址:";
          };
          {
            EditText;
            hint="输入";
            layout_marginTop="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit";
          };
        };
        AlertDialog.Builder(this)
        .setTitle("请输入跳转链接")
        .setView(loadlayout(InputLayout))
        .setPositiveButton("确定", function()
          import "android.util.Base64"
          import "android.net.Uri"
          import "android.content.Intent"
          function base64(text)
            local base64Text=Base64.encodeToString(String(text).getBytes(),Base64.DEFAULT)
            return base64Text
          end
          function qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
            local shareId=分享ID
            local jumpUrl=base64(跳转链接)
            local previewImgUrl=base64(预览图链接)
            local imgUrl=base64(图片链接)
            local title=base64(标题)
            local description=base64(描述)
            local mqqapi="mqqapi://share/to_fri?file_type=news&src_type=web&version=1&share_id="..shareId.."&url="..jumpUrl.."&previewimageUrl="..previewImgUrl.."&image_url="..imgUrl.."&title="..title.."&description="..description.."&callback_type=scheme&thirdAppDsplayName=UVE&app_name=UVE&cflag=0&shareType=0"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(mqqapi)))
          end

          local 分享ID=1101685683
          local 跳转链接=edit.text
          local 预览图链接="https://img.alicdn.com/bao/uploaded/i1/T1aiVpXoBHXXb1upjX.jpg"
          local 图片链接="https://img.alicdn.com/bao/uploaded/i1/T1aiVpXoBHXXb1upjX.jpg "
          local 标题="最新活动"
          local 描述="百分百中奖免费抽QB"
          qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
        end)
        .setNeutralButton("取消", nil)
        .show()

       elseif items[v+1]=="QQ红包引流" then
        InputLayout={
          LinearLayout;
          orientation="vertical";
          Focusable=true,
          FocusableInTouchMode=true,
          {
            TextView;
            id="Prompt",
            textSize="15sp",
            layout_marginTop="10dp";
            layout_marginLeft="3dp",
            layout_width="80%w";
            layout_gravity="center",
            text="输入要跳转的链接地址:";
          };
          {
            EditText;
            hint="输入";
            layout_marginTop="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit";
          };
        };
        AlertDialog.Builder(this)
        .setTitle("请输入:")
        .setView(loadlayout(InputLayout))
        .setPositiveButton("确定", function()
          import "android.util.Base64"
          import "android.net.Uri"
          import "android.content.Intent"
          function base64(text)
            local base64Text=Base64.encodeToString(String(text).getBytes(),Base64.DEFAULT)
            return base64Text
          end
          function qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
            local shareId=分享ID
            local jumpUrl=base64(跳转链接)
            local previewImgUrl=base64(预览图链接)
            local imgUrl=base64(图片链接)
            local title=base64(标题)
            local description=base64(描述)
            local mqqapi="mqqapi://share/to_fri?file_type=news&src_type=web&version=1&share_id="..shareId.."&url="..jumpUrl.."&previewimageUrl="..previewImgUrl.."&image_url="..imgUrl.."&title="..title.."&description="..description.."&callback_type=scheme&thirdAppDsplayName=UVE&app_name=UVE&cflag=0&shareType=0"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(mqqapi)))
          end

          local 分享ID=1101685683
          local 跳转链接=edit.text
          local 预览图链接="https://ww1.sinaimg.cn/large/007iUjdily1g1rswi80vgj30bb0dfwep.jpg"
          local 图片链接="https://ww1.sinaimg.cn/large/007iUjdily1g1rswi80vgj30bb0dfwep.jpg "
          local 标题="[QQ红包]发红包啦！"
          local 描述="赶紧点击拆开吧"
          qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
        end)
        .setNeutralButton("取消", nil)
        .show()
       elseif items[v+1]=="自定义" then
        InputLayout={
          LinearLayout;
          orientation="vertical";
          Focusable=true,
          FocusableInTouchMode=true,
          {
            EditText;
            hint="输入分享ID,不填则默认手机腾讯网";
            layout_marginTop="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit";
          };
          {
            EditText;
            hint="输入要跳转的链接地址:";
            layout_marginTop="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit1";
          };
          {
            EditText;
            hint="输入预览图的链接地址:";
            layout_marginTop="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit2";
          };
          {
            EditText;
            hint="输入图片的链接地址:";
            layout_marginTop="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit3";
          };
          {
            EditText;
            hint="输入标题:";
            layout_marginTop="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit4";
          };
          {
            EditText;
            hint="输入描述:";
            layout_marginTop="5dp";
            layout_width="80%w";
            layout_gravity="center",
            id="edit5";
          };
        };

        AlertDialog.Builder(this)
        .setTitle("请输入:")
        .setView(loadlayout(InputLayout))
        .setPositiveButton("GO", function()
          import "android.util.Base64"
          import "android.net.Uri"
          import "android.content.Intent"
          function base64(text)
            local base64Text=Base64.encodeToString(String(text).getBytes(),Base64.DEFAULT)
            return base64Text
          end
          function qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
            local shareId=分享ID
            local jumpUrl=base64(跳转链接)
            local previewImgUrl=base64(预览图链接)
            local imgUrl=base64(图片链接)
            local title=base64(标题)
            local description=base64(描述)
            local mqqapi="mqqapi://share/to_fri?file_type=news&src_type=web&version=1&share_id="..shareId.."&url="..jumpUrl.."&previewimageUrl="..previewImgUrl.."&image_url="..imgUrl.."&title="..title.."&description="..description.."&callback_type=scheme&thirdAppDsplayName=UVE&app_name=UVE&cflag=0&shareType=0"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(mqqapi)))
          end

          if edit.text=="" or nil then
            edit.text=""
          end
          local 分享ID=edit.text
          local 跳转链接=edit1.text
          local 预览图链接=edit2.text
          local 图片链接=edit3.text
          local 标题=edit4.text
          local 描述=edit5.text
          qqShare(分享ID,跳转链接,预览图链接,图片链接,标题,描述)
        end)
        .setNeutralButton("取消", nil)
        .show()
      end
    end})
  .show()--显示弹窗
  activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE|WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN)
end
function 加载(链接)
  应用内浏览=io.open("/data/data/"..activity.getPackageName().."/是否应用内打开.xml"):read("*a")
  if 应用内浏览=="打开" then
    写入文件("/data/data/"..activity.getPackageName().."/链接传递.xml",链接)
    activity.newActivity('Browser')
   else
    import "android.content.Intent"
    import "android.net.Uri"
    url=链接
    viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
    activity.startActivity(viewIntent)
  end
  -- print(链接)
end
--布局表中调用
import "java.io.File"
import "android.graphics.Typeface"
function 字体(t)
  return Typeface.createFromFile(File(activity.getLuaDir().."/res/"..t..".ttf"))
end
w=activity.width
h=activity.height

yuxuan=
{
  DrawerLayout;--侧滑布局
  id='侧滑布局';
  {
    LinearLayout;--线性布局
    Orientation='vertical';--布局方向
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度

    {
      LinearLayout;
      id='mToolbar';
      layout_width='fill';--布局宽度
      layout_height="56dp";
      orientation="vertical";
      background=io.open("/data/data/"..activity.getPackageName().."/顶栏颜色储存.xml"):read("*a");
      {
        LinearLayout;
        layout_width="fill";
        orientation="horizontal";
        layout_height="56dp";
        -- elevation="3dp";
        {
          LinearLayout;
          gravity="center";
          layout_width="56dp";
          layout_height="56dp";
          id="Sideslip";
          {
            ImageView;
            layout_height="28dp";
            src="png/ic_menu.png";
            id="Sideslip1";
            -- colorFilter=io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a");
            layout_width="25dp";
          };
        };
        {
          LinearLayout;
          layout_height="fill";
          layout_weight="1";
          orientation="horizontal";
          {
            TextView;
            text="ApkBest App";
            textColor=io.open("/data/data/"..activity.getPackageName().."/顶栏标题颜色储存.xml"):read("*a");
            layout_gravity="center";
            textSize="18sp";
            Typeface=字体("Product");
            id="标题";
          };
        };
        {
          LinearLayout;
          gravity="center";
          layout_width="55dp";
          layout_height="55dp";
          id="menu0";
          {
            ImageView;
            layout_height="25dp";
            src="png/mmm.png";
            id="menu01";
            colorFilter="#ff000000";
            layout_width="25dp";
          };
        };
        {
          LinearLayout;
          gravity="center";
          layout_width="55dp";
          layout_height="55dp";
          id="menu";
          {
            ImageView;
            layout_height="25dp";
            src="png/ic_dots_vertical.png";
            id="menu1";
            colorFilter="#ff000000";
            layout_width="25dp";
          };
        };
        {
          LinearLayout;
          gravity="center";
          layout_width="0dp";
          layout_height="0dp";
          id="menu2";
        };

      };

      {
        LinearLayout;
        elevation="6dp";
        layout_height="0dp";
        layout_width="36%w";
        layout_gravity="center";
        layout_marginTop="-0dp";
        {
          LinearLayout;
          id="huat";
          layout_height="0%h";
          layout_width="18%w";
          background="#FF018577";
          --background="icon.png";
        };

      };
      {
        Button;
        layout_width="fill";
        layout_marginTop="0%w";
        layout_height="0";
        layout_gravity="center_horizontal";
        backgroundColor="#FFDCDCDC";
        style="?android:attr/borderlessButtonStyle";
      };
    };
    {
      FrameLayout;
      layout_height="fill";
      layout_width="fill";
      {
        PageView;--滑动窗体
        id="slide";
        -- layout_height="fill",
        pages={--生成窗体布局
          {--滚动布局下必须有线性竖直布局
            LinearLayout,
            orientation="vertical",
            layout_width="fill",
            layout_height="fill",

            {
              CardView;--卡片控件
              layout_width="fill";
              elevation="4dp";
              radius="0dp";--4dp
              id="vngggggg";
              --Background="#fffefefe";
              CardBackgroundColor=深色;
              layout_margin="0dp";--10dp
              layout_gravity="center";
              layout_height="fill";
              {--添加一个list布局，这个时候list是空的，还没有匹配数据
                --仅仅是在屏幕布局内开辟一块大空间作为list布局
                GridView;
                fastScrollEnabled=true;
                layout_width="fill";
                layout_height="fill";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
                --这里是分割线的意思
                numColumns=2;--每排显示网格数
                id="list";
                --  background="#ff4285f4",
                background="bi3xxx.png";
              };
            };
          };
          {--滚动布局下必须有线性竖直布局
            LinearLayout,
            orientation="vertical",
            layout_width="fill",
            layout_height="fill",
            --id="swipeRefreshLayout";
            {
              CardView;--卡片控件
              layout_width="fill";
              elevation="4dp";
              radius="0dp";--4dp
              id="vngggggg";
              --Background="#fffefefe";
              CardBackgroundColor=深色;
              layout_margin="0dp";--10dp
              layout_gravity="center";
              layout_height="fill";

              {--添加一个list布局，这个时候list是空的，还没有匹配数据
                --仅仅是在屏幕布局内开辟一块大空间作为list布局
                GridView;--网格视图
                fastScrollEnabled=true;
                layout_width="fill";
                numColumns=2;--每排显示网格数
                layout_height="fill";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
                --这里是分割线的意思
                -- dividerHeight="0";
                id="yuxuan_list";
                --background="#ff4285f4",
              };
            };
          };

          {--滚动布局下必须有线性竖直布局
            LinearLayout,
            orientation="vertical",
            layout_width="fill",
            layout_height="fill",

            {
              CardView;--卡片控件
              layout_width="fill";
              elevation="2dp";
              radius="0dp";--4dp
              id="vngggggg";
              --Background="#fffefefe";
              CardBackgroundColor=深色;
              layout_margin="0dp";--10dp
              layout_gravity="center";
              layout_height="fill";
              {--添加一个list布局，这个时候list是空的，还没有匹配数据
                --仅仅是在屏幕布局内开辟一块大空间作为list布局
                GridView;
                fastScrollEnabled=true;
                layout_width="fill";
                -- layout_margin="30dp";--10dp
                layout_height="fill";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
                --这里是分割线的意思
                numColumns=2;--每排显示网格数
                id="list2";
              };
            };
          };

        };

      };
      {
        LinearLayout;
        layout_width="fill";
        layout_height="56dp";
        backgroundColor="#FFFFFFFF";
        layout_gravity="center";
        orientation="horizontal";
        Elevation="6dp";
        layout_marginBottom="0dp";
        layout_gravity="center|bottom";
        {
          LinearLayout;
          layout_weight="1";
          layout_height="fill";
          background="#00000000";
          {
            LinearLayout;
            id="window0";
            gravity="center";
            orientation="vertical",
            layout_width="fill";
            layout_height="fill";
            {
              ImageView;
              src="png/hjjwr.png";
              layout_height="24dp";
              id="收藏";
              --padding="10dp";
              layout_width="24dp";
              layout_margin="0dp";
              ColorFilter=0xff2c2c2c;--给图标上色
              --找不到图标的老铁可以去酷安了解一下IconsLua+
              layout_gravity="center",
            };
            {
              TextView;
              text="HOME";
              id="tittle0";
              textSize="13sp";
            };
          };
        };
        {
          LinearLayout;
          layout_weight="1";
          layout_height="fill";
          background="#00000000";
          {
            LinearLayout;
            id="window1";
            gravity="center";
            orientation="vertical",
            layout_width="fill";
            layout_height="fill";
            {
              ImageView;
              src="png/package_variant_black.png";
              layout_height="24dp";
              id="工具";
              --padding="10dp";
              layout_width="24dp";
              layout_margin="0dp";
              ColorFilter=0xff2c2c2c;--给图标上色
              --找不到图标的老铁可以去酷安了解一下IconsLua+
              layout_gravity="center",
            };
            {
              TextView;
              text="MOD APP";
              id="tittle1";
              textSize="13sp";
            };
          };
        };
        {
          LinearLayout;
          layout_weight="1";
          layout_height="fill";
          background="#00000000";
          {
            LinearLayout;
            id="window2";
            gravity="center";
            orientation="vertical",
            layout_width="fill";
            layout_height="fill";
            {
              ImageView;
              src="png/tbs.png";
              layout_height="24dp";
              id="网页";
              --padding="10dp";
              layout_width="24dp";
              layout_margin="0dp";
              ColorFilter=0xff2c2c2c;--给图标上色
              --找不到图标的老铁可以去酷安了解一下IconsLua+
              layout_gravity="center",
            };
            {
              TextView;
              text="PLAY STORE";
              id="tittle2";
              textSize="13sp";
            };
          };
        };
      };
    };
  };
  {
    --左侧滑栏布局
    LinearLayout;--线性布局
    Orientation='vertical';--布局方向
    layout_gravity='start';--重力属性
    layout_width='fill';--布局宽度
    layout_height='fill';--布局高度
    background="#FFFAFAFA";--布局背景颜色(或者图片路径)
    --gravity='center';--设置居中
    {
      TextView;--文本控件
      layout_width='wrap';--文本宽度
      layout_height='wrap';--文本高度
      -- Gravity='center';--重力属性
      layout_margin="30.5dp";
      id="ASD工具箱",
      Typeface=字体("Product");
      layout_marginLeft="18dp";
      textColor=io.open("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml"):read("*a");
      text='Apk Best App ';--显文本
      textSize='24sp';--文本大小
    };
    {
      Button;
      layout_width="fill";
      layout_marginTop="-0%w";
      layout_height="2";
      layout_gravity="center_horizontal";
      backgroundColor="#FFDCDCDC";
      style="?android:attr/borderlessButtonStyle";
    };
    {
      CardView;--卡片控件
      layout_width="fill";
      elevation="0dp";
      radius="0dp";--4dp
      id="vngggggg";
      --Background="#fffefefe";
      CardBackgroundColor=深色;
      layout_margin="0dp";--10dp
      layout_gravity="center";
      layout_height="fill";
      {
        --左侧滑栏布局
        LinearLayout;--线性布局
        Orientation='vertical';--布局方向
        layout_width='fill';--布局宽度
        layout_height='fill';--布局高度
        background="#FFFAFAFA";--布局背景颜色(或者图片路径)
        {--添加一个list布局，这个时候list是空的，还没有匹配数据
          --仅仅是在屏幕布局内开辟一块大空间作为list布局
          ListView;
          -- layout_width="fill";
          --layout_marginTop="1dp";
          fastScrollEnabled=true;
          layout_marginLeft="4dp";
          --layout_height="fill";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
          --这里是分割线的意思
          dividerHeight="0";
          id="list4";
          --background="#ff4285f4",
        };
        {
          Button;
          layout_width="fill";
          layout_marginTop="-0%w";
          layout_height="2";
          layout_gravity="center_horizontal";
          backgroundColor="#FFDCDCDC";
          style="?android:attr/borderlessButtonStyle";
        };
        {--添加一个list布局，这个时候list是空的，还没有匹配数据
          --仅仅是在屏幕布局内开辟一块大空间作为list布局
          ListView;
          -- layout_width="fill";
          --layout_marginTop="1dp";
          fastScrollEnabled=true;
          layout_marginLeft="4dp";
          layout_height="fill";--高度需要更苦list多少进行计算，或者自己根据自己的不同写表达式
          --这里是分割线的意思
          dividerHeight="0";
          id="list3";
          --background="#ff4285f4",
        };
      };
    };
  };
};















item={
  LinearLayout,
  orientation="horizontal",
  layout_width="fill",
  --[[id="fpll",
    {
      ImageView;
      src="png/package_variant_black.png";
      layout_width='24dp';
      layout_height='24dp';
      layout_gravity='left|center';
      layout_margin='10dp';
      layout_marginLeft='5dp';
      id='srcf';
      ColorFilter=0xff2c2c2c;--设置图片着色
      onClick=function()
      end
    };]]
  {
    TextView,
    id="srct",
    textColor=0xff2c2c2c;
    textSize="14sp",
    layout_margin="10dp",
    --layout_width="fill",
    layout_width="304dp",
    --textIsSelectable=true,
    layout_marginLeft="3dp";
    layout_gravity="center",
  },
}
itemc={
  LinearLayout,
  orientation="horizontal",
  layout_width="fill",
  layout_height='56dp';
  --id="fpll",
  {
    CardView;
    layout_margin='16dp';
    --  layout_marginTop='3dp';
    layout_gravity='center';
    -- layout_marginLeft="4%w";
    Elevation='0';
    layout_width='fill';
    layout_height='44dp';
    radius='8dp';
    CardBackgroundColor=0xfff0f0f0;
    id='按钮';
    {
      LinearLayout,
      orientation="horizontal",
      layout_width="fill",
      layout_height='44dp';
      {
        ImageView;
        -- src=图标;
        layout_width='14dp';
        layout_height='44dp';
        layout_gravity='left|center';
        layout_margin='0dp';
        layout_marginLeft='0dp';
        id='菜cd单';
        ColorFilter=0xff444444;--设置图片着色
        onClick=function()
        end
      };
      {
        TextView,
        id="srct",
        textColor=0xff2c2c2c;
        textSize="14sp",
        Typeface=字体("Product2");
        --layout_margin="10dp",
        --layout_width="fill",
        -- layout_width="304dp",
        --textIsSelectable=true,
        layout_marginLeft="3dp";
        layout_gravity="left|center",
      },

    },
  },
}
itemc2={
  LinearLayout,
  orientation="horizontal",
  layout_width="fill",
  layout_height='48dp';
  --id="fpll",

  {
    ImageView;
    layout_height="24dp";
    id="srcf";
    --padding="10dp";
    layout_width="24dp";
    layout_margin="12dp";
    ColorFilter=0xFF212121;--给图标上色
    --找不到图标的老铁可以去酷安了解一下IconsLua+
    layout_gravity="center",
  };
  {
    TextView,
    id="srct",
    textColor=0xFF212121;
    textSize="14sp",
    layout_margin="10dp",
    Typeface=字体("Product2");
    --layout_width="fill",
    layout_width="304dp",
    --textIsSelectable=true,
    layout_marginLeft="10dp";
    layout_gravity="center",

  },
  {
    TextView,
    id="srcb",
    --textColor="#ff000000";
    textSize="0sp",
    --layout_margin="0dp",
    --layout_width="fill",
    layout_width="304dp",
    --textIsSelectable=true,
    layout_marginLeft="3dp";
    layout_gravity="center",
  },

}
activity.setContentView(loadlayout(yuxuan))
ASD工具箱.getPaint().setFakeBoldText(true)
--标题.getPaint().setFakeBoldText(true)
--一个小list模板已搭建好了，下面开始匹配数据

--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}

--创建了三个有数据的列表
aic={"png/hjjwr.png","png/package_variant_black.png","png/tbs.png","png/remove_black.png","png/package_black.png","png/mmm.png","png/settings.png","png/lou.png"}
aw3={"HOME","MODDED APP","ORIGINAL APP"}
mmp={"导出为xml","导出导入 添加 删改","导出为xml","当前为"}
--"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")

--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do
for nj=1,#aw3 do
  --给空的datas添加所有的数据
  --格式为  table.insert(空列表名称,{id=数据列表[nj]})
  table.insert(datas,{srct=aw3[nj],srcf=aic[nj],srcb=mmp[nj]})
end
--
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpqy=LuaAdapter(activity,datas,itemc2)

--将小项目匹配给大list
list4.Adapter=yuxuan_adpqy
--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}

--创建了三个有数据的列表
aic={"png/package_black.png","png/mmm.png","png/settings.png","png/lou.png"}
aw3={"ROM","Navigateur","Settings","About"}
mmp={"导出为xml","导出导入 添加 删改","导出为xml","当前为"}
--"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")

--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do
for nj=1,#aw3 do
  --给空的datas添加所有的数据
  --格式为  table.insert(空列表名称,{id=数据列表[nj]})
  table.insert(datas,{srct=aw3[nj],srcf=aic[nj],srcb=mmp[nj]})
end
--
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpqy=LuaAdapter(activity,datas,itemc2)

--将小项目匹配给大list
list3.Adapter=yuxuan_adpqy
--小菜鸟
--"Android list列表滑动显示隐藏toolbar(ListView)来源网络，由小菜鸟转换"
状态栏高度=activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)
--设置高度
linearParams = slide.getLayoutParams()
linearParams.height =h-getwh(window0)-getwh(mToolbar)-状态栏高度
slide.setLayoutParams(linearParams)
import "com.nirenr.Color"
import "android.graphics.Color"
--设置滑动条&字体颜色
appp=activity.getWidth()
local kuan=appp/5.5
slide.setOnPageChangeListener(PageView.OnPageChangeListener{
  onPageScrolled=function(a,b,c)
    huat.setX(kuan*(b+a))
    if c==0 then
      if a==0 then
        收藏.setColorFilter(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml"):read("*a")))
        工具.setColorFilter(0xff3d3d3d)
        网页.setColorFilter(0xff3d3d3d)
        tittle0.setTextColor(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml"):read("*a")))
        tittle1.setTextColor(0xFF7F7F7F)
        tittle2.setTextColor(0xFF7F7F7F)
       elseif a==1 then
        收藏.setColorFilter(0xff3d3d3d)
        工具.setColorFilter(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml"):read("*a")))
        网页.setColorFilter(0xff3d3d3d)
        tittle0.setTextColor(0xFF7F7F7F)
        tittle1.setTextColor(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml"):read("*a")))
        tittle2.setTextColor(0xFF7F7F7F)
       elseif a==2 then
        收藏.setColorFilter(0xff3d3d3d)
        工具.setColorFilter(0xff3d3d3d)
        网页.setColorFilter(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml"):read("*a")))
        tittle0.setTextColor(0xFF7F7F7F)
        tittle1.setTextColor(0xFF7F7F7F)
        tittle2.setTextColor(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/其他部件强调色储存.xml"):read("*a")))
      end
    end
  end})

menu01.setColorFilter(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a")))
menu1.setColorFilter(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a")))
Sideslip1.setColorFilter(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a")))
--按钮切换界面
window0.onClick=function()
  slide.showPage(0)
end
window1.onClick=function()
  slide.showPage(1)
end
window2.onClick=function()
  slide.showPage(2)
end
menu0.onClick=function()
  activity.newActivity('ToolBoxsosuo')
end
menu.onClick=function()
  pop=PopupMenu(activity,menu2)
  menu=pop.Menu
  menu.add("退出").onMenuItemClick=function(a)
    os.exit()--结束程序
  end

  pop.show()
end
隐藏侧滑栏顶部标题=io.open("/data/data/"..activity.getPackageName().."/隐藏侧滑栏顶部标题.xml"):read("*a")
if 隐藏侧滑栏顶部标题=="打开" then
  --控件隐藏
  ASD工具箱.setVisibility(View.GONE)
end
Sideslip.onClick=function()
  --打开侧滑
  侧滑布局.openDrawer(3)
end
波纹(window0,0xFF7F7F7F)--0xFF7F7F7F
波纹(window1,0xFF7F7F7F)--0xFF7F7F7F
波纹(window2,0xFF7F7F7F)
波纹(menu,0xFF7F7F7F)
波纹(menu0,0xFF7F7F7F)
波纹(Sideslip,0xFF7F7F7F)
list3.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent,v,pos,id)
    侧滑布局.closeDrawer(3)

    if pos == 0 then
      activity.newActivity('rom')
    end
    if pos == 1 then
      activity.newActivity('sosuo')
    end
    if pos == 2 then
      activity.newActivity('st/st')
    end
    if pos == 3 then
      --[[packinfo=this.getPackageManager().getPackageInfo(this.getPackageName(),((32552732/2/2-8183)/10000-6-231)/9)
    version=tostring(packinfo.versionName)
    AlertDialog.Builder(this)
    .setTitle("关于")
    .setMessage("当前版本:"..version.."\n普通功能数量:"..#aw.."\n网页功能数量:"..#aw2)
    .setPositiveButton("确定",function()
    end)
    .show()]]
      activity.newActivity('guan')
    end
  end
})

list4.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent,v,pos,id)
    侧滑布局.closeDrawer(3)
    if pos == 0 then
      slide.showPage(0)
    end
    if pos == 1 then
      slide.showPage(1)
    end
    if pos == 2 then
      slide.showPage(2)
    end
  end
})
import "android.graphics.drawable.GradientDrawable"
--侧滑滑动事件
侧滑布局.setDrawerListener(DrawerLayout.DrawerListener{
  onDrawerSlide=function(v,z)

  end})

ch_item_checked_background = GradientDrawable()
.setShape(GradientDrawable.RECTANGLE)
--.setColor(转0x(primaryc)-0xde000000)
--.setCornerRadii({0,0,dp2px(24),dp2px(24),dp2px(24),dp2px(24),0,0});



--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}

--创建了三个有数据的列表
aic={}
--aw2={"Youtuube","CanvaCanva","网页源代码查看","Mikutap","解锁小米手机","网页制作","解密工具","QQAPI智能调用系统","网址缩短","火星文转换器","藏头诗生成","拆字","拷贝兔","logo制作","2048","质感图标生成器","在线取色器","BING","历史地图","PDCICONS","草料二维码","在线电脑","小日历","烟花模拟器","百度云盘搜索引擎","图宝","编程源码","账号解封","QQ网名生成","签名在线生成","小视频","图片压缩","图片放大","最火帽子制作","泼辣修图","在线PS","临时网盘","网址缩短","PDF格式转换","文件转换器","表情包制作","装逼截图","装逼神器","装逼图片生成","文字转二维码","彩色二维码生成","艺术字体生成","书法字体转换器","小说素材生成","QQ强行聊天","阴阳历转换","快递单号查询","微信个性昵称生成","windows93","滑稽"}
aw2={"true caller Ori","canva Ori","kinemaster ORI","turbovpn ORI"}
--❤️❤️❤️❤️
mmp={"导出为xml","导出导入 添加 删改","导出为xml","当前为"}
--"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")

--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do
for nj=1,#aw2 do
  --给空的datas添加所有的数据
  --格式为  table.insert(空列表名称,{id=数据列表[nj]})
  table.insert(datas,{srct=aw2[nj],srcf=aic[nj],srcb=mmp[nj]})
end
--
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adpq=LuaAdapter(activity,datas,itemc)

--将小项目匹配给大list
list2.Adapter=yuxuan_adpq
--给list添加点击事件

--创建一个空的列表为datas(列表就是可以存放多个数据的意思)
datas={}

--创建了三个有数据的列表 --别忘在下面和搜索页面添加！！！ --别忘在下面和搜索页面添加！！！ --别忘在下面和搜索页面添加！！！ --别忘在下面和搜索页面添加！！！ --别忘在下面和搜索页面添加！！！ --别忘在下面和搜索页面添加！！！
aic={}
--aw={"计算器","尺子","指南针","特殊文本生成","文字加密解密","迷宫生成","眼跳测吉凶","QQ工具","记事本","保存桌面壁纸","贪吃蛇","查看手机信息","应用管理","普通取色器","图片取色器","和平精英画质修改","bilibili视频下载","网易云去广告","Shell命令执行","查快递","生成卡密系统","时间屏幕","阅文","引流神器","随机数生成","图颜文","二维码生成","日期推算","打字板","带壳截图"}
aw={"true caller MOD","canva MOD","kinemaster MOD","turbovpn MOD"}
--❤️❤️❤️❤️
mmp={"导出为xml","导出导入 添加 删改","导出为xml","当前为"}
--"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")

--循环添加匹配有数据的列表到
--nj只是一个变量，你可以用其他变量代替
--在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
--就相当于  for  1,3   do
for nj=1,#aw do
  --给空的datas添加所有的数据
  --格式为  table.insert(空列表名称,{id=数据列表[nj]})
  table.insert(datas,{srct=aw[nj],srcf=aic[nj],srcb=mmp[nj]})
end
--创建适配器，将datas里面的数据匹配给itemc小项目
yuxuan_adp=LuaAdapter(activity,datas,itemc)

--将小项目匹配给大list
yuxuan_list.Adapter=yuxuan_adp
yuxuan_list.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent,v,pos,id) --别忘在下面和搜索页面添加！！！ --别忘在下面和搜索页面添加！！！ --别忘在下面和搜索页面添加！！！ --别忘在下面和搜索页面添加！！！
    if pos == 0 then
      加载("https://www.mediafire.com/file/k6d5mpxr0jw3phx/TrueCaller_MOD_ApkBest.apk/file")
      -- activity.newActivity('jisuan')
      --进入子页面('')
    end
    if pos == 1 then
      --  activity.newActivity('se')
      加载("https://www.mediafire.com/file/mona92foere1q58/Canva_MOD_ApkBest.apk/filefile")
    end
    if pos == 2 then
      -- activity.newActivity('zhi')
      加载("https://www.mediafire.com/file/uyg99iamo7uwztq/Kinemaster_MOD_ApkBest.apk/file")

    end
    if pos == 3 then
      -- activity.newActivity('wen')
      加载("https://www.mediafire.com/file/s60rnx1p6sfzsvd/TurboVpn_MOD_ApkBest.apk/file")

    end
    if pos == 4 then
      -- activity.newActivity('rc4')

    end
    if pos == 5 then
      -- activity.newActivity('migong')

    end
    pos=pos+1
    if pos == 7 then
      -- activity.newActivity('ji')

    end
    if pos == 8 then
      -- activity.newActivity('QQ')

    end

    if pos == 9 then
      -- showDataDialog("Collection","记事本")

    end
    if pos == 10 then
      -- activity.newActivity('bizhi')

    end
    if pos == 11 then
      -- activity.newActivity('shi')

    end
    if pos == 12 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      -- activity.newActivity('xi')
    end
    if pos == 13 then
      print("应用加载可能时间较长")
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      --  activity.newActivity('wmaine')
    end
    if pos == 14 then

      require "import"
      import "android.widget.*"
      import "android.view.*"
      import "android.graphics.PorterDuffColorFilter"
      import "android.graphics.PorterDuff"

      取色器=
      {
        LinearLayout;
        orientation="vertical";
        layout_width="fill";
        layout_height="fill";
        gravity="center";
        {
          CardView;
          id="卡片图";
          layout_margin="10dp";
          radius="40dp",
          elevation="0dp",
          layout_width="20%w";
          layout_height="20%w";
        };
        {
          TextView;
          layout_margin="0dp";
          textSize="12sp";
          id="颜色文本";
          textColor=左侧栏项目色;
        };
        {
          SeekBar;
          id="拖动一";
          layout_margin="15dp";
          layout_width="match";
          layout_height="wrap";
        };
        {
          SeekBar;
          id="拖动二";
          layout_margin="15dp";
          layout_width="match";
          layout_height="wrap";
        };
        {
          SeekBar;
          id="拖动三";
          layout_margin="15dp";
          layout_width="match";
          layout_height="wrap";
        };
        {
          SeekBar;
          id="拖动四";
          layout_margin="15dp";
          layout_width="match";
          layout_height="wrap";
        };
      };
      --对话框View
      local 取色器=loadlayout(取色器)
      拖动一.setMax(255)
      拖动二.setMax(255)
      拖动三.setMax(255)
      拖动四.setMax(255)
      拖动一.setProgress(0xff)
      拖动二.setProgress(0x1e)
      拖动三.setProgress(0x8a)
      拖动四.setProgress(0xe8)
      --监听
      拖动一.setOnSeekBarChangeListener{
        onProgressChanged=function(view, i)
          updateArgb()
        end
      }

      拖动二.setOnSeekBarChangeListener{
        onProgressChanged=function(view, i)
          updateArgb()
        end
      }

      拖动三.setOnSeekBarChangeListener{
        onProgressChanged=function(view, i)
          updateArgb()
        end
      }

      拖动四.setOnSeekBarChangeListener{
        onProgressChanged=function(view, i)
          updateArgb()
        end
      }
      --更新颜色
      function updateArgb()
        local a=拖动一.getProgress()
        local r=拖动二.getProgress()
        local g=拖动三.getProgress()
        local b=拖动四.getProgress()
        local argb_hex=(a<<24|r<<16|g<<8|b)
        颜色文本.Text=string.format("%#x", argb_hex)
        卡片图.setCardBackgroundColor(argb_hex)
      end
      --翻译进度
      argbBuild=AlertDialog.Builder(activity)
      argbBuild.setView(取色器)
      argbBuild.setTitle("选色器")
      argbBuild.setPositiveButton("复制", {
        onClick=function(view)
          --[[local a=拖动一.getProgress()
    local r=拖动二.getProgress()
    local g=拖动三.getProgress()
    local b=拖动四.getProgress()
    local argb_hex=(a<<24|r<<16|g<<8|b)
    local argb_str=string.format("%#x", argb_hex)
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(argb_str)]]
          import "android.content.Context"
          activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(颜色文本.text)
          print("已复制到剪贴板❤️❤️❤️")
        end
      })
      argbBuild.setNeutralButton("取消",{onClick=function()

        end})--设置否认按钮
      --实例化对话框
      argbDialog=argbBuild.create()
      argbDialog.setCanceledOnTouchOutside(false)
      function showArgbDialog()
        --展示对话框
        argbDialog.show()
        --更新颜色
        updateArgb()
      end
      showArgbDialog()


    end

    if pos == 15 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      -- activity.newActivity('quse')
    end
    if pos == 16 then
      if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.tmgp.pubgmhd",0) end) then
        print("✅ 检测您已安装，和平精英")--这里拿米侠浏览器，打个比方----------------↑米侠浏览器包名
        print("开启成功")
        File(activity.getLuaDir()..'/EnjoyCJZC.ini').renameTo(File('Android/data/com.tencent.tmgp.pubgmhd/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android'))
       else
        print("❌ 没有安装，和平精英")
      end
    end


    if pos == 17 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      -- activity.newActivity('bilibili')

    end
    if pos == 18 then
      os.execute("rm -r /storage/emulated/0/netease/cloudmusic/Ad")
      print("已去除广告")
    end
    if pos == 19 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      -- activity.newActivity('Shell')
    end
    if pos == 20 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      --activity.newActivity('kuai')

    end
    if pos == 21 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      -- activity.newActivity('km')

    end
    if pos == 22 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      --activity.newActivity('dujit')

    end
    pos=pos+1
    if pos == 24 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      -- activity.newActivity('one')

    end
    if pos == 25 then
      引流神器()
    end
    if pos == 26 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      --activity.newActivity('tianchi')

    end
    if pos == 27 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      --  activity.newActivity('tuyuanwen')

    end
    if pos == 28 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      -- activity.newActivity('tongzhi')

    end
    if pos == 29 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      --  activity.newActivity('riqi')

    end
    if pos == 30 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      -- activity.newActivity('dazi')

    end
    if pos == 31 then
      加载("https://www.mediafire.com/file/38k9gpkwhzd3jqk/APKCombo_Installer_4.0.apk/file")

      -- activity.newActivity('jietu/main')

    end
    --[[if pos == 6 then
      import "android.widget.CardView"
      import "android.widget.AdapterView"
      import "android.graphics.ColorFilter"
      import "android.widget.LinearLayout"
      import "android.widget.ScrollView"
      import "android.widget.ListView"
      import "android.content.Context"
      import "android.widget.TextView"
      import "com.androlua.R$string"
      import "android.R$string"
      import "android.app.AlertDialog"
      import "android.content.res.ColorStateList"
      import "android.R$id"
      import "android.widget.ImageView"
      import "com.androlua.LuaAdapter"
      import "android.content.Context"
      items={"获取WiFi状态","获取网络信号强度","获取Mac地址","获取SSID是否被隐藏","获取WiFi加密类型","获取网络名称","获取Dns","获取运营商名称","判断是否有网络"}
      AlertDialog.Builder(this)
      .setTitle("网络工具箱")
      .setItems(items,{onClick=function(l,v)
          if v==0 then
            import "android.content.Context"
            wifi = activity.Context.getSystemService(Context.WIFI_SERVICE)
            print(wifi.getWifiState())
          end
          if v==1 then
            wifiManager=activity.Context.getSystemService(Context.WIFI_SERVICE);
            wifiInfo=wifiManager.getConnectionInfo();
            print(wifiInfo.getRssi())
          end
          if v==2 then
            wifiManager=activity.Context.getSystemService(Context.WIFI_SERVICE);
            wifiInfo=wifiManager.getConnectionInfo();
            print( wifiInfo.getMacAddress())
          end
          if v==3 then
            wifiManager=activity.Context.getSystemService(Context.WIFI_SERVICE);
            wifiInfo=wifiManager.getConnectionInfo();
            print(wifiInfo.getHiddenSSID())
          end
          if v==4 then
            wifi = activity.Context.getSystemService(Context.WIFI_SERVICE).getConfiguredNetworks()
            print(string.match(tostring(wifi),[[KeyMgmt: (.-) P))
          end
          if v==5 then
            wifiManager=activity.Context.getSystemService(Context.WIFI_SERVICE);
            wifiInfo=wifiManager.getConnectionInfo();
            print(wifiInfo.getSSID())
          end
          if v==6 then
            items={"获取Dns1","获取Dns2"}
            AlertDialog.Builder(this)
            .setTitle("")
            .setItems(items,{onClick=function(l,v)
                if v==0 then
                  import "android.content.Context"
                  wifi = activity.Context.getSystemService(Context.WIFI_SERVICE).getDhcpInfo()
                  print(string.match(tostring(wifi),"dns1 (.-) dns2"))
                end
                if v==1 then
                  import "android.content.Context"
                  wifi = activity.Context.getSystemService(Context.WIFI_SERVICE).getDhcpInfo()
                  dns2 = string.match(tostring(wifi),"dns2 (.-) D")
                  print(dns2)
                end
              end})
            .show()
          end
          if v==7 then
            import "android.content.Context"
            运营商名称 = this.getSystemService(Context.TELEPHONY_SERVICE).getNetworkOperatorName()
            print(运营商名称)
            --添加权限   READ_PHONE_STATE
          end
        end})
      .show()
    end]]
  end
})

list2.setOnItemClickListener(AdapterView.OnItemClickListener{
  onItemClick=function(parent,v,pos,id,aw2)
    v=pos
    --print(aw2[pos])
    if v==0 then
      加载("https://play.google.com/store/apps/details?id=com.truecaller")
    end
    if v==1 then
      加载("https://play.google.com/store/apps/details?id=com.canva.editor")
    end
    if v==2 then
      加载("https://play.google.com/store/apps/details?id=com.nexstreaming.app.kinemasterfree")
    end
    v=v+1
    if v==4 then
      加载("https://play.google.com/store/apps/details?id=free.vpn.unblock.proxy.turbovpn")
    end
    v=v+3
    if v==8 then
      加载("http://www.miui.com/unlock/index.html")
    end
    v=v+3
    if v==12 then
      加载("https://api.uixsj.cn/qqapi/")
    end
    if v==13 then
      加载("http://www.cmd5.com/")
    end
    v=v+1
    if v==15 then
      加载("https://api.uixsj.cn/qqapi/")
    end
    if v==16 then
      加载("http://suo.im/")
    end
    if v==17 then
      加载("http://m.fzlft.com/#http://m.fzlft.com/")
    end
    if v==18 then
      加载("http://m.shicimingju.com/cangtoushi/index.html")
    end
    if v==19 then
      加载("https://chaizi.51240.com/")
    end
    if v==20 then
      加载("https://cp.ifval.com/")
    end
    v=v+1
    if v==22 then
      加载("https://www.logoaa.com/")
    end
    if v==23 then
      加载("http://cdn.games.imlianpu.com/platform/2048/index.html")
    end
    v=v+1
    if v==25 then
      加载("https://pandecheng.coding.me/Icon-Generator/")
    end
    if v==26 then
      加载("http://www.runoob.com/tags/html-colorpicker.html")
    end
    if v==27 then
      加载("http://cn.bing.com")
    end
    if v==28 then
      加载("https://www.ageeye.cn/")
    end
    if v==29 then
      加载("https://pandecheng.ooo/pdcicons/#home")
    end
    if v==30 then
      加载("https://cli.im/mob")
    end
    if v==31 then
      加载("http://lab.mkblog.cn/webos/")
    end
    if v==32 then
      加载("http://yun.rili.cn/wnl/m/index.html")
    end
    if v==33 then
      items={"全屏模式","普通模式"}
      AlertDialog.Builder(this)
      .setTitle("")
      .setItems(items,{onClick=function(l,v)
          if v==0 then

            加载("https://pandecheng.coding.me/firework-simulator-v2/")
          end
          if v==1 then
            加载("https://pandecheng.coding.me/firework-simulator-v2/")
          end
        end})
      .show()
    end
    if v==34 then
      加载("https://m.soyunpan.com/")
    end
    if v==35 then
      加载("http://uzoo.cn/100001")
    end
    if v==36 then
      加载("http://www.iyuji.cn/iyuji/s/Z2JLUXprRzlZV2EwTlR0YXI3NEVYdz09/1548352158617500")
    end
    if v==37 then
      items={"解封QQ群","解封QQ空间","QQ空间认证"}
      AlertDialog.Builder(this)
      .setTitle("账号解封")
      .setNegativeButton("取消",nil)
      .setItems(items,{onClick=function(l,v)
          if v==0 then
            加载("http://kf.qq.com/self_help/qq_group_status.html?_wv=1031")
          end
          if v==1 then
            加载("https://kf.qq.com/touch/")
          end
          if v==2 then
            加载("https://h5.qzone.qq.com/brand/apply/index")
          end

        end})
      .show()

    end
    if v==38 then
      加载("http://www.qqwangming.net")
    end
    if v==39 then
      加载("http://www.yishuzi.com")
    end
    if v==40 then
      加载("http://page.yy.com/svmob/d/?edition=1")
    end
    if v==41 then
      加载("http://optimizilla.com/zh/")
    end
    if v==42 then
      加载("http://bigjpg.com/")
    end
    if v==43 then
      加载("http://mt.uupt.com/cap.html")
    end
    if v==44 then
      加载("http://www.polaxiong.com/editor")
    end
    if v==45 then
      加载("https://m.kantu.com/")
    end
    if v==46 then
      加载("https://send.firefox.com/")
    end
    if v==47 then
      加载("https://www.chaidu.com/App/Web/Url-Shortener/")
    end
    if v==48 then
      加载("https://smallpdf.com/cn/")
    end
    if v==49 then
      加载("https://cn.office-converter.com/")
    end
    if v==50 then
      加载("https://www.52doutu.cn/diy/")
    end
    if v==51 then
      加载("http://sc.appbs.cn/")
    end
    if v==52 then
      加载("http://deepba.com/")
    end
    if v==53 then
      加载("http://m.daohangtx.com/m/tools/detail/zhuangbi/")
    end
    if v==54 then
      加载("http://m.chaxuntu.com/erweima/")
    end
    if v==55 then
      加载("http://www.it399.com/m/qrcode.jsp")
    end
    if v==56 then
      加载("http://www.zitiweb.com/")
    end
    if v==57 then
      加载("http://m.diyiziti.com/")
    end
    if v==58 then
      加载("http://www.xuanpai.com/")
    end
    if v==59 then
      加载("http://m.daohangtx.com/m/tools/detail/qqqiangliao/")
    end
    if v==60 then
      加载("http://tools.2345.com/m/yyl/")
    end
    if v==61 then
      加载("http://m.daohangtx.com/m/tools/detail/kuaidi/")
    end
    if v==62 then
      加载("http://service.tangdaoya.com/tdyapp/mobile/nickname/index.php")
    end
    if v==63 then
      加载("http://www.windows93.net/")
    end
    if v==64 then
      加载("http://tool.uixsj.cn/doge/")
    end
  end

})
import "java.io.File"
export="/sdcard/Asd box/Chronicle export/"
websave="/sdcard/Asd Browser/web_archive/"
backup="/sdcard/Asd Browser/backup/"
File(export).mkdirs()--如果只创建一级文件夹，请改为mkdir
--File(picture).mkdir()
--File(backup).mkdir()

--天生自带混淆的代码~
function 写入文件(路径,内容)
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
end
function getAllData(name)
  local data={}
  for d in each(this.getApplicationContext().getSharedPreferences(name,0).getAll().entrySet()) do
    data[d.getKey()]=d.getValue()
  end
  return data
end



function getData(name,key,MzI1NTI3MzI)
  local data=this.getApplicationContext().getSharedPreferences(name,0).getString(key,nil)--325-5273-2
  return data
end

function putData(name,key,value)
  this.getApplicationContext().getSharedPreferences(name,0).edit().putString(key,value).apply()--3255-2732
  return true
end

function removeData(name,key)
  this.getApplicationContext().getSharedPreferences(name,32552732*0).edit().remove(key).apply()--[[3(2)6?5{2}2[7]32]]
  return true
end

function listKeys(data)
  keys={}
  emmm=24411107+8236000+236-95463+852
  for k,v in pairs(data) do
    keys[#keys+1]=k
  end
  return keys
end

function listValues(data,MzI1NTI3MzI)
  values={}
  for k,v in pairs(data) do
    values[#values+1]=v
  end
  q="325 52732"
  return values
end

function adapterData(data,jdpuk)
  adpd={}
  for d in pairs(data) do
    table.insert(adpd,{
      text={
        Text=tostring(data[d]),
      },
    })
  end
  return adpd
end

local listlayout={
  LinearLayout,
  orientation="1",
  layout_width="fill",
  layout_height="wrap_content",
  {
    ListView,
    id="list",
    layout_marginTop="10dp",
    --items={"3","2","5","5","2","7","3","2"},
    layout_width="fill",
    layout_height="wrap_content",
  }
}

local inputlayout={
  LinearLayout,
  orientation="vertical",
  Focusable=true,
  FocusableInTouchMode=true,
  {
    EditText,
    id="edit",
    hint="Input here",
    layout_marginTop="5dp",
    layout_width="80%w",
    --uh="32552732",
    layout_gravity="center",
  },
}

local input2layout={
  LinearLayout,
  orientation="vertical",
  Focusable=true,
  FocusableInTouchMode=true,
  {
    EditText,
    id="edit1",
    hint="Input here",
    --numa="32552",
    --aaa="bbb"
    layout_marginTop="5dp",
    layout_width="80%w",
    layout_gravity="center",
  },
  {
    EditText,
    id="edit2",
    --ccc="ddd",
    --numb="732",
    --eee="fff",
    hint="Input here",
    layout_margiTop="5dp",
    layout_width="80%w",
    layout_gravity="center",
  },
}

function showDataDialog(name,title,jdpuk)

  local data=getAllData(name)
  local keys=listKeys(data)
  local values=listValues(data)
  item={
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    {
      TextView,
      id="text",
      Typeface=字体("Product2");
      textSize="16sp",
      layout_margin="10dp",
      layout_width="fill",
      layout_width="70%w",
      layout_gravity="center",
    },
  }

  local adpd=adapterData(values)
  local items=LuaAdapter(this,adpd,item)

  local dlb=AlertDialog.Builder(this)
  dlb.setTitle(title)
  local dl
  if #keys>0 then
    dlb.setView(loadlayout(listlayout))
    list.setDividerHeight(0)
    list.Adapter=items
    list.onItemClick=function(adp,view,position,id)--3255273 2
      AlertDialog.Builder(this)
      .setTitle(values[id])
      .setMessage(keys[id])
      .setPositiveButton("确定",function()
      end)
      .setNeutralButton("操作",function()
        items={"分享记事","导出记事","导出记事为网页","复制内容","字数统计"}
        AlertDialog.Builder(this)
        .setTitle("")
        .setNegativeButton("",nil)
        .setItems(items,{onClick=function(l,v)
            if v==0 then
              import "android.content.*"

              text=values[id]..keys[id]
              intent=Intent(Intent.ACTION_SEND);
              intent.setType("text/plain");
              intent.putExtra(Intent.EXTRA_SUBJECT, "分享");
              intent.putExtra(Intent.EXTRA_TEXT, text);
              intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
              activity.startActivity(Intent.createChooser(intent,"分享到:"));
            end
            if v==1 then
              写入文件(backup..values[id]..".xml",keys[id])
              print("已保存")
            end
            if v==2 then
              写入文件(backup..values[id]..".html","<title>"..values[id].."</title>\n <style>a{COLOR: #000000; TEXT-DECORATION: none}</style>\n"..keys[id].."<br>\n ")
              print("已保存")
            end
            if v==3 then
              --先导入包
              import "android.content.*"
              activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(keys[id])
              print("已复制")
            end
            if v==4 then
              AlertDialog.Builder(this)
              .setTitle("字数统计")
              .setMessage("共"..#keys[id].."字")
              .setPositiveButton("确定",function()
              end)
              .show()
            end
          end})
        .show()
      end)
      .setNegativeButton("",nil)
      .show()
      if dl then
        dl.dismiss()
      end
    end
    function addDataDialog(name,title,value,key)--32552732
      m=AlertDialog.Builder(this)
      m.setTitle(title)
      m.setView(loadlayout(input2layout))
      m.setPositiveButton("保存",function()
        if not(edit1.text=="") and not(edit2.text=="") or 325==52732 then
          if not getData(name,edit2.text) then
            putData(name,edit2.text,edit1.text)
           else
            print("❤️❤️")
            --addDataDialog(name,title,edit1.text,edit2.text)
          end
         else
          print("❤️❤️")
          -- addDataDialog(name,title,edit1.text,edit2.text)
        end
      end)
      --.setNegativeButton("",nil)
      m.show()
      edit1.setHint("标题")
      edit2.setHint("链接")
      if(value)then
        edit1.setText(value)
      end
      if(key)then
        edit2.setText(key)
      end
    end
    --照例的一个请求保留QQ号的请求
    --QQ32552732
    list.onItemLongClick=function(adp,view,pos,id)--325 52732
      AlertDialog.Builder(this)
      .setTitle("修改内容")
      .setView(loadlayout(input2layout))
      .setPositiveButton("保存",function()--32552732
        if not(edit1.text=="") and not(edit2.text=="") or 3255==2732 then
          removeData(name,keys[id])
          putData(name,edit2.text,edit1.text)--32552732
          if dl then
            dl.dismiss()
            showDataDialog(name,title)
          end
         else
          print("❤️")
        end
      end)
      .setNegativeButton("取消",nil)
      .setNeutralButton("删除",function()
        removeData(name,keys[id])
        items.remove(pos)
        table.remove(keys,id)
        table.remove(values,id)
        if #adpd<=0 then
          if dl then
            dl.dismiss()
            showDataDialog(name,title);
          end
        end
      end)
      .show()
      edit1.setHint("标题")
      edit2.setHint("内容")
      edit1.setText(values[id])
      edit2.setText(keys[id])
      return true
    end
   else
    dlb.setMessage("没有记事")
  end
  dlb.setPositiveButton("取消",function()end)
  dlb.setNeutralButton("添加",function()
    --addDataDialog("Collection","添加记事")
    m=AlertDialog.Builder(this)
    m.setTitle("添加内容")
    m.setView(loadlayout(input2layout))
    m.setPositiveButton("保存",function()
      if not(edit1.text=="") and not(edit2.text=="") or 325==52732 then
        if not getData(name,edit2.text) then
          putData(name,edit2.text,edit1.text)
         else
          print("该链接已存在")
          addDataDialog(name,title,edit1.text,edit2.text)
        end
       else
        print("请填写所有字段")
        addDataDialog(name,title,edit1.text,edit2.text)
      end
    end)
    .setNegativeButton("取消",nil)
    m.show()
    edit1.setHint("标题")
    edit2.setHint("内容")
    if(value)then
      edit1.setText(value)
    end
    if(key)then
      edit2.setText(key)
    end
  end)
  dl=dlb.show()
end
function showDataDialog2(name,title,jdpuk)

  local data=getAllData(name)
  local keys=listKeys(data)
  local values=listValues(data)
  --[[if name=="历史记录" then
    图标="timelap.png"
  else]]
  图标="png/hjjwr.png"
  --end
  item={
    LinearLayout,
    orientation="horizontal",
    layout_width="fill",
    layout_height='56dp';
    --id="fpll",
    {
      CardView;
      layout_margin='16dp';
      --  layout_marginTop='3dp';
      layout_gravity='center';
      -- layout_marginLeft="4%w";
      Elevation='0';
      layout_width='fill';
      layout_height='44dp';
      radius='8dp';
      CardBackgroundColor=0xfff0f0f0;
      id='收藏按钮';
      {
        LinearLayout,
        orientation="horizontal",
        layout_width="fill",
        layout_height='44dp';
        {
          ImageView;
          src=图标;
          layout_width='24dp';
          layout_height='24dp';
          layout_gravity='left|center';
          layout_margin='10dp';
          layout_marginLeft='5dp';
          id='菜cd单';
          ColorFilter=0xff2c2c2c;--设置图片着色
          onClick=function()
          end
        };
        {
          TextView,
          id="text",
          textColor=0xff2c2c2c;
          textSize="14sp",
          Typeface=字体("Product2");
          --layout_margin="10dp",
          --layout_width="fill",
          -- layout_width="304dp",
          --textIsSelectable=true,
          layout_marginLeft="3dp";
          layout_gravity="left|center",
        },

      },

    },
  }

  local adpd=adapterData(values)
  local items=LuaAdapter(this,adpd,item)

  local dlb=AlertDialog.Builder(this)
  dlb.setTitle(title)
  local dl
  if #keys>0 then
    --webView.addView(loadlayout(listlayout))

    --list.setDividerHeight(0)
    list.Adapter=items
    list.onItemClick=function(adp,view,position,id)--3255273 2
      --webView.loadUrl(keys[id])
      -- 加载网(keys[id])
      if keys[id] == "truecaller MOD" then
        -- activity.newActivity('jisuan')
        加载("https://www.mediafire.com/file/k6d5mpxr0jw3phx/TrueCaller_MOD_ApkBest.apk/file")

       elseif keys[id] == "尺子" then
        activity.newActivity('se')
       elseif keys[id] == "指南针" then
        activity.newActivity('zhi')
       elseif keys[id] == "特殊文本生成" then
        activity.newActivity('wen')
       elseif keys[id] == "文字加密解密" then
        activity.newActivity('rc4')
       elseif keys[id] == "迷宫生成" then
        activity.newActivity('migong')
       elseif keys[id] == "眼跳测吉凶" then
        activity.newActivity('ji')
       elseif keys[id] == "QQ工具" then
        activity.newActivity('QQ')
       elseif keys[id] == "记事本" then
        showDataDialog("Collection","记事本")
       elseif keys[id] == "保存桌面壁纸" then
        activity.newActivity('bizhi')
       elseif keys[id] == "贪吃蛇" then
        activity.newActivity('shi')
       elseif keys[id] == "查看手机信息" then
        activity.newActivity('xi')
       elseif keys[id] == "应用管理" then
        activity.newActivity('wmaine')
       elseif keys[id] == "普通取色器" then

        require "import"
        import "android.widget.*"
        import "android.view.*"
        import "android.graphics.PorterDuffColorFilter"
        import "android.graphics.PorterDuff"

        取色器=
        {
          LinearLayout;
          orientation="vertical";
          layout_width="fill";
          layout_height="fill";
          gravity="center";
          {
            CardView;
            id="卡片图";
            layout_margin="10dp";
            radius="12%w",
            elevation="0dp",
            layout_width="24%w";
            layout_height="24%w";
          };
          {
            TextView;
            layout_margin="0dp";
            textSize="12sp";
            id="颜色文本";
            textColor=左侧栏项目色;
          };
          {
            SeekBar;
            id="拖动一";
            layout_margin="15dp";
            layout_width="match";
            layout_height="wrap";
          };
          {
            SeekBar;
            id="拖动二";
            layout_margin="15dp";
            layout_width="match";
            layout_height="wrap";
          };
          {
            SeekBar;
            id="拖动三";
            layout_margin="15dp";
            layout_width="match";
            layout_height="wrap";
          };
          {
            SeekBar;
            id="拖动四";
            layout_margin="15dp";
            layout_width="match";
            layout_height="wrap";
          };
        };
        --对话框View
        local 取色器=loadlayout(取色器)
        拖动一.setMax(255)
        拖动二.setMax(255)
        拖动三.setMax(255)
        拖动四.setMax(255)
        拖动一.setProgress(0xff)
        拖动二.setProgress(0x1e)
        拖动三.setProgress(0x8a)
        拖动四.setProgress(0xe8)
        --监听
        拖动一.setOnSeekBarChangeListener{
          onProgressChanged=function(view, i)
            updateArgb()
          end
        }

        拖动二.setOnSeekBarChangeListener{
          onProgressChanged=function(view, i)
            updateArgb()
          end
        }

        拖动三.setOnSeekBarChangeListener{
          onProgressChanged=function(view, i)
            updateArgb()
          end
        }

        拖动四.setOnSeekBarChangeListener{
          onProgressChanged=function(view, i)
            updateArgb()
          end
        }
        --更新颜色
        function updateArgb()
          local a=拖动一.getProgress()
          local r=拖动二.getProgress()
          local g=拖动三.getProgress()
          local b=拖动四.getProgress()
          local argb_hex=(a<<24|r<<16|g<<8|b)
          颜色文本.Text=string.format("%#x", argb_hex)
          卡片图.setCardBackgroundColor(argb_hex)
        end
        --翻译进度
        argbBuild=AlertDialog.Builder(activity)
        argbBuild.setView(取色器)
        argbBuild.setTitle("选色器")
        argbBuild.setPositiveButton("复制", {
          onClick=function(view)
            --[[local a=拖动一.getProgress()
    local r=拖动二.getProgress()
    local g=拖动三.getProgress()
    local b=拖动四.getProgress()
    local argb_hex=(a<<24|r<<16|g<<8|b)
    local argb_str=string.format("%#x", argb_hex)
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(argb_str)]]
            import "android.content.Context"
            activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(颜色文本.text)
            print("已复制到剪贴板")
          end
        })
        argbBuild.setNeutralButton("取消",{onClick=function()

          end})--设置否认按钮
        --实例化对话框
        argbDialog=argbBuild.create()
        argbDialog.setCanceledOnTouchOutside(false)
        function showArgbDialog()
          --展示对话框
          argbDialog.show()
          --更新颜色
          updateArgb()
        end
        showArgbDialog()


       elseif keys[id] == "truecaller MOD" then
        -- activity.newActivity('quse')
        加载("https://www.mediafire.com/file/k6d5mpxr0jw3phx/TrueCaller_MOD_ApkBest.apk/file")

       elseif keys[id] == "和平精英画质修改" then
        if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.tmgp.pubgmhd",0) end) then
          print("✅ 检测您已安装，和平精英")--这里拿米侠浏览器，打个比方----------------↑米侠浏览器包名
          print("开启成功")
          File(activity.getLuaDir()..'/EnjoyCJZC.ini').renameTo(File('Android/data/com.tencent.tmgp.pubgmhd/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android'))
         else
          print("❌ 没有安装，和平精英")
        end
        --❤️❤️❤️❤️❤️
       elseif keys[id] == "truecaller MOD" then
        -- activity.newActivity('quse')
        加载("https://www.mediafire.com/file/k6d5mpxr0jw3phx/TrueCaller_MOD_ApkBest.apk/file")

       elseif keys[id] == "bilibili视频下载" then
        activity.newActivity('bilibili')
       elseif keys[id] == "网易云去广告" then
        os.execute("rm -r /storage/emulated/0/netease/cloudmusic/Ad")
        print("已去除广告")
       elseif keys[id] == "Shell命令执行" then
        activity.newActivity('Shell')
       elseif keys[id] == "查快递" then
        activity.newActivity('kuai')
       elseif keys[id] == "时间屏幕" then
        activity.newActivity('dujit')
       elseif keys[id] == "阅文" then
        activity.newActivity('one')
       elseif keys[id] == "引流神器" then
        引流神器()
       elseif keys[id] == "随机数生成" then
        activity.newActivity('tianchi')
       elseif keys[id] == "图颜文" then
        activity.newActivity('tuyuanwen')
       elseif keys[id] == "二维码生成" then
        activity.newActivity('tongzhi')
       elseif keys[id] == "日期推算" then
        activity.newActivity('riqi')
       elseif keys[id] == "打字板" then
        activity.newActivity('dazi')
       elseif keys[id] == "生成卡密系统" then
        activity.newActivity('km')
       elseif keys[id] == "带壳截图" then
        activity.newActivity('jietu/main')
       else
        print("❤️")
      end
    end
    list.onItemLongClick=function(adp,view,pos,id)--325 52732
      --普通对话框
      AlertDialog.Builder(this)
      .setTitle("I hate this app")
      .setMessage("Sur you want remove？")
      .setPositiveButton("yes",{onClick=function()
          removeData("功能收藏",keys[id])
          items.remove(pos)
          table.remove(keys,id)
          table.remove(values,id)
          print("removed")
        end})
      --.setNeutralButton("中立",nil)
      .setNegativeButton("no",nil)
      .show()
    end
   else
    --创建一个空的列表为datas(列表就是可以存放多个数据的意思)
    datas={}

    --创建了三个有数据的列表
    aic={"png/error_black.png"}
    aw3={"Bienvenue"}
    mmp={}
    --"当前为"..io.open("/data/data/"..activity.getPackageName().."/主页链接.xml"):read("*a")

    --循环添加匹配有数据的列表到
    --nj只是一个变量，你可以用其他变量代替
    --在lua中#用来测长度，所以#aw,因为aw里面有3个数据，所以#aw=3
    --就相当于  for  1,3   do
    for nj=1,#aw3 do
      --给空的datas添加所有的数据
      --格式为  table.insert(空列表名称,{id=数据列表[nj]})
      table.insert(datas,{srct=aw3[nj],srcf=aic[nj],srcb=mmp[nj]})
    end
    --
    --创建适配器，将datas里面的数据匹配给itemc小项目
    yuxuan_adpqy=LuaAdapter(activity,datas,itemc2)

    --将小项目匹配给大list
    list.Adapter=yuxuan_adpqy
    --弹出消息("没有收藏")
  end
  -- dlb.设置积极按钮("添加收藏",function()addDataDialog(name,"加入收藏",webView.getTitle(),webView.getUrl())
  --  end)
end
--putData("功能收藏","功能收藏","功能收藏")
showDataDialog2("功能收藏","记事本")
yuxuan_list.setOnItemLongClickListener(AdapterView.OnItemLongClickListener{
  onItemLongClick=function(parent, v, pos,id)
    --事件
    --print(v.Tag.srct.Text)
    --普通对话框
    AlertDialog.Builder(this)
    .setTitle("Favorite App")
    .setMessage("Add this App to Home page for favorite?❤️")
    .setPositiveButton("yes",{onClick=function()
        if not getData("功能收藏",v.Tag.srct.Text) then
          putData("功能收藏",v.Tag.srct.Text,v.Tag.srct.Text)
          showDataDialog2("功能收藏","记事本")
          print("added")
         else
          print("removed")
        end
      end})
    --.setNeutralButton("中立",nil)
    .setNegativeButton("no",nil)
    .show()
  end
})
import "com.nirenr.Color"
import "android.graphics.Color"
t=io.open("/data/data/"..activity.getPackageName().."/顶栏颜色储存.xml"):read("*a")
mToolbar.setBackgroundColor(Color.parseColor(t));

