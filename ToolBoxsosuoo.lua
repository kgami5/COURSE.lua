require "import"
import "android.widget.*"
import "android.view.*"
activity.setTheme(android.R.style.Theme_DeviceDefault_Light)
--activity.ActionBar.hide()
import "java.io.File"
--布局表中调用
import "android.graphics.Typeface"
function 字体(t)
  return Typeface.createFromFile(File(activity.getLuaDir().."/res/"..t..".ttf"))
end
function 波纹(id,颜色)
  import "android.content.res.ColorStateList"local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
end
w=activity.width
h=activity.height
sosuo=
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
    {
      LinearLayout;
      layout_width="fill";
      orientation="horizontal";
      layout_height="56dp";
      -- elevation="3dp";
      background="#00000000";
      {
        LinearLayout;
        gravity="center";
        layout_width="56dp";
        layout_height="56dp";
        id="Sideslip";
        {
          ImageView;
          layout_height="28dp";
          src="png/__ic_fltbtn.png";
          colorFilter="#ff000000";
          id="Sideslip1";
          layout_width="25dp";
        };
      };
      {
        LinearLayout;
        layout_height="fill";
        layout_weight="1";
        orientation="horizontal";
        {
          EditText;--编辑框控件
          text="";
          textColor=io.open("/data/data/"..activity.getPackageName().."/顶栏标题颜色储存.xml"):read("*a");
          Hint='Searching...';--设置编辑框为空时的提示文字
          --  textColor=0xFF33A7AA;
          layout_width=w-224,
          layout_gravity="center";
          textSize="18sp";
          background="#00000000";
          Typeface=字体("Product");
          id="text";
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
        id="list";
        --background="#ff4285f4",
      };
    };
  };
};
activity.setContentView(loadlayout(sosuo))
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
        id="wz",
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
--❤️❤️❤️❤️
on_pickedup={"true caller MOD","canva MOD","kinemaster MOD","turbovpn MOD","true caller ORI","canva ORI","kinemaster ORI","turbo on ORI","记事本","保存桌面壁纸","贪吃蛇","查看手机信息","应用管理","普通取色器","图片取色器","和平精英画质修改","bilibili视频下载","网易云去广告","Shell命令执行","查快递","生成卡密系统","时间屏幕","阅文","引流神器","随机数生成","图颜文","二维码生成","日期推算","打字板"}
adp=LuaAdapter(activity,item)
for k,v in ipairs(on_pickedup) do
  adp.add{wz=v}
end
--list.setAdapter(adp)

--程序启动事件
import "java.awt.event.*"
text.addTextChangedListener{
  onTextChanged=function(s)
    if not(text.text=="") then
      adp=LuaAdapter(activity,item)--创建适配器
      adp.clear()--清空适配器
      for k,v in ipairs(on_pickedup) do --遍历
        if v:find(tostring(text.Text))then--如果表的一项的内容包含(find)就怎么怎么样
          adp.add{wz=v}--添加一行
        end
      end
      list.setAdapter(adp)--设置适配器
    end

  end
}

Sideslip.onClick=function(v)
  activity.finish()
  --相当于FusionAPP的退出页面与退出程序
end
波纹(Sideslip,0xFF7F7F7F)
--波纹(find,0xFF7F7F7F)

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
      m.setPositiveButton("ok",function()
        if not(edit1.text=="") and not(edit2.text=="") or 325==52732 then
          if not getData(name,edit2.text) then
            putData(name,edit2.text,edit1.text)
           else
            print("available search in app")
            --addDataDialog(name,title,edit1.text,edit2.text)
          end
         else
          print("not available")
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
          print("请填写所有字段")
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
list.setOnItemLongClickListener(AdapterView.OnItemLongClickListener{
  onItemLongClick=function(parent, v, pos,id)
    --事件
    --print(v.Tag.srct.Text)
    --普通对话框
    import "android.app.AlertDialog"
    AlertDialog.Builder(this)
    .setTitle("提示")
    .setMessage("确定要将此功能添加到收藏中吗？")
    .setPositiveButton("确定",{onClick=function()
        if not getData("功能收藏",v.Tag.wz.Text) then
          putData("功能收藏",v.Tag.wz.Text,v.Tag.wz.Text)
          刷新="是"
          print("已收藏")
         else
          print("该功能已存在")
        end
      end})
    --.setNeutralButton("中立",nil)
    .setNegativeButton("取消",nil)
    .show()
  end
})


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



list.onItemClick=function(parent, v, pos,id)
  --webView.loadUrl(keys[id])
  -- 加载网(keys[id])
  文本=v.Tag.wz.Text
  if 文本 == "true caller MOD" then
    -- activity.newActivity('jisuan')
    加载("https://www.mediafire.com/file/k6d5mpxr0jw3phx/TrueCaller_MOD_ApkBest.apk/file")

   elseif 文本 == "canva MOD" then
    --❤️❤️❤️❤️
    加载("https://www.mediafire.com/file/mona92foere1q58/Canva_MOD_ApkBest.apk/filefile")

    -- activity.newActivity('se')
   elseif 文本 == "kinemaster MOD" then
    --activity.newActivity('zhi')
    加载("https://www.mediafire.com/file/uyg99iamo7uwztq/Kinemaster_MOD_ApkBest.apk/file")

   elseif 文本 == "turbovpn MOD" then
    -- activity.newActivity('wen')
    加载("https://www.mediafire.com/file/s60rnx1p6sfzsvd/TurboVpn_MOD_ApkBest.apk/file")

   elseif 文本 == "文字加密解密" then
    --  activity.newActivity('rc4')
   elseif 文本 == "迷宫生成" then
    --   activity.newActivity('migong')
   elseif 文本 == "眼跳测吉凶" then
    --  activity.newActivity('ji')
   elseif 文本 == "QQ工具" then
    --  activity.newActivity('QQ')
   elseif 文本 == "记事本" then
    -- showDataDialog("Collection","记事本")
   elseif 文本 == "保存桌面壁纸" then
    -- activity.newActivity('bizhi')
   elseif 文本 == "石头剪刀布" then
    -- activity.newActivity('shi')
   elseif 文本 == "查看手机信息" then
    --  activity.newActivity('xi')
   elseif 文本 == "应用管理" then
    --  activity.newActivity('wmaine')
   elseif 文本 == "普通取色器" then

    require "import"
    import "android.app.AlertDialog"
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


   elseif 文本 == "图片取色器" then
    activity.newActivity('quse')
   elseif 文本 == "和平精英画质修改" then
    if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.tmgp.pubgmhd",0) end) then
      print("✅ 检测您已安装，和平精英")--这里拿米侠浏览器，打个比方----------------↑米侠浏览器包名
      print("开启成功")
      File(activity.getLuaDir()..'/EnjoyCJZC.ini').renameTo(File('Android/data/com.tencent.tmgp.pubgmhd/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android'))
     else
      print("❌ 没有安装，和平精英")
    end
   elseif 文本 == "图片取色器" then
    activity.newActivity('quse')
   elseif 文本 == "bilibili视频下载" then
    activity.newActivity('bilibili')
   elseif 文本 == "网易云去广告" then
    os.execute("rm -r /storage/emulated/0/netease/cloudmusic/Ad")
    print("已去除广告")
   elseif 文本 == "Shell命令执行" then
    activity.newActivity('Shell')
   elseif 文本 == "查快递" then
    activity.newActivity('kuai')
   elseif 文本 == "时间屏幕" then
    activity.newActivity('dujit')
   elseif 文本 == "阅文" then
    activity.newActivity('one')
   elseif 文本 == "引流神器" then
    引流神器()
   elseif 文本 == "随机数生成" then
    activity.newActivity('tianchi')
   elseif 文本 == "图颜文" then
    activity.newActivity('tuyuanwen')
   elseif 文本 == "二维码生成" then
    activity.newActivity('tongzhi')
   elseif 文本 == "日期推算" then
    activity.newActivity('riqi')
   elseif 文本 == "打字板" then
    activity.newActivity('dazi')
   elseif 文本 == "生成卡密系统" then
    activity.newActivity('km')
   else
    print("MOD disponible Please select in list")
  end
end
import "com.nirenr.Color"
import "android.graphics.Color"
t=io.open("/data/data/"..activity.getPackageName().."/顶栏颜色储存.xml"):read("*a")
mToolbar.setBackgroundColor(Color.parseColor(t));
Sideslip1.setColorFilter(Color.parseColor(io.open("/data/data/"..activity.getPackageName().."/顶栏部件颜色储存.xml"):read("*a")))
 
