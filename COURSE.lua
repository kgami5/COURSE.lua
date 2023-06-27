require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "mods.qing"
import "android.graphics.Typeface"
import "android.graphics.Bitmap"
import "android.view.animation.AccelerateInterpolator"
import "android.widget.FrameLayout"
import "java.lang.Math"
import "android.view.ViewAnimationUtils"
import "android.widget.PageView"
import "android.R$animator"
import "android.widget.ImageView"
import "android.widget.LinearLayout"
import "android.R$id"
import "android.widget.CardView"
import "item.item"
import "android.net.Uri"
import "android.content.Intent"
activity.setContentView(loadlayout("layout"))
屏幕沉浸二(0x00000000,0xFF73AA95)
--祝大家2020新年快乐，新的一年不负韶华，前程似锦，财运亨通
--作者QQ：3041913305
--作者快手号：qfyb888888
--作者店铺上新：https://k.weidian.com/BDZ5ut5-
--官方讨论群：576155996
--使用模板务必备注保留版权信息©aiTools

huadong.onScrollChange=function(a,b,j,y,u)
  title_box.setY(-j*.29)
  if j>activity.getHeight()*.1+转分辨率("15dp") then
    list_box.setY(-j+(activity.getHeight()*.1+转分辨率("15dp")))
  end

  if j<=转分辨率("100dp") then
    bottom_bar.setY(bottom_bar.getTop()+j)
  end
end

bottom_bar_two.setAlpha(0)
page.addOnPageChangeListener{
  onPageScrolled=function(a,b,c)
    ftb.Rotation=c/8
    if b>0 then
      bottom_bar_one.setAlpha(1-b)
      bottom_bar_two.setAlpha(b)
    end
    --print(a,b,c)
  end}



import "java.io.File"
import "android.graphics.Typeface"
local bf=File(activity.getLuaDir().."/font/zt2.ttf");
local tf=Typeface.createFromFile(bf)
title_one.setTypeface(tf);



function 获取屏幕高度()
  import "android.content.Context"
  import "com.nirenr.Point"
  import "android.graphics.Point"
  local windowManager =activity.getApplication().getSystemService(Context.WINDOW_SERVICE);
  local display = windowManager.getDefaultDisplay();
  local outPoint = Point();
  if (Build.VERSION.SDK_INT >= 19) then
    --可能有虚拟按键的情况
    display.getRealSize(outPoint);
   else
    --不可能有虚拟按键
    display.getSize(outPoint);
  end
  return outPoint.y
end








pmh=activity.getHeight()

ase=true

huadong2.onScrollChange=function(a,b,j,y,u)

  back_img.setY(-j*.3)

  bar_box.setY(-j)

  if j>0 and j<=.19*activity.getHeight() then

    head_box.setScaleX(((.19*pmh)-j)/(.19*pmh)).setScaleY(((.19*pmh)-j)/(.19*pmh))

  end

  if j==0 then

    top_bar.setBackgroundColor(0x00000000)

   elseif j<=pmh*.20 then

    top_bar.setBackgroundColor(0x00000000)

    if not ase then

      变色动画(detail_box,0xFF73AA95,0x00000000,500)

      透明动画(custom_title,{1,0},500)

      task(330,function()

        custom_title.setVisibility(View.INVISIBLE)

      end)

      ase=true

    end

   elseif j>=pmh*.20 and j<=(pmh*.43-状态栏高()-转分辨率("50dp")) then

    top_bar.setBackgroundColor(0x00ffffff)

    if ase then

      变色动画(detail_box,0x00000000,0xFF73AA95,500)

      透明动画(custom_title,{0,1},500)

      custom_title.setVisibility(View.VISIBLE)

      ase=false

    end

   elseif j>=(pmh*.43-状态栏高()-转分辨率("50dp")) then

    top_bar.setBackgroundColor(0xFF73AA95)

  end

end

import "java.io.File"
import "android.graphics.Typeface"
local bf=File(activity.getLuaDir().."/font/zt.otf");
local tf=Typeface.createFromFile(bf)
custom_name.setTypeface(tf);
custom_title.setTypeface(tf);





adapter2=LuaAdapter(activity,item)

adapter2.add{item_img=loadbitmap("image/wallpaper/hd.jpg")}

for i=0,2 do
  adapter2.add{item_img=loadbitmap("image/wallpaper/hd.jpg")}
end
home_page.Adapter=PageAdapter(adapter2)
function 设置控件宽(控件,宽度)
  local linearParams = 控件.getLayoutParams()
  linearParams.width=宽度
  控件.setLayoutParams(linearParams)
end

home_page.addOnPageChangeListener{
  onPageScrolled=function(a,b,c)
    if a==0 and b>0 and b<1 then
      设置控件宽(huatiao_a,转分辨率("16dp")-转分辨率("8dp")*b)
      设置控件宽(huatiao_b,转分辨率("8dp")+转分辨率("8dp")*b)
     elseif a==1 and b>0 and b<1 then
      设置控件宽(huatiao_b,转分辨率("16dp")-转分辨率("8dp")*b)
      设置控件宽(huatiao_c,转分辨率("8dp")+转分辨率("8dp")*b)
     elseif a==2 and b>0 and b<1 then
      设置控件宽(huatiao_c,转分辨率("16dp")-转分辨率("8dp")*b)
      设置控件宽(huatiao_d,转分辨率("8dp")+转分辨率("8dp")*b)
    end
  end}





txt={"Après la pluie, le beau temps",
  "Charbonnier est maître chez soi。",
  "En avril, ne te découvre pas d'un fil。",
  "Il n'y a pas de fumée sans feu。",
  "Les absents ont toujours tort。",
  "Qui sème le vent récolte la tempête。",
  "Tout vient à point à qui sait attendre。",
  "Un tiens vaut mieux que deux tu l'auras。",
  "Les cordonniers sont les plus mal chaussés。",
  "Qui se ressemble s'assemble。",
  "À la Saint-Glinglin。",
  "La nuit porte conseil。",
  "On ne fait pas d'omelette sans casser des œufs"}


function 设置一言()
  Http.get("https://v1.hitokoto.cn/?encode=json","utf8",function(code,content,cookie,header)
    if code==200 then
      local cjson=import "cjson"
      local json=cjson.decode(content)
      yiyan.setText(json.hitokoto)
     else
      yiyan.setText(txt[math.random(0,12)])
    end
  end)
end

设置一言()




import "android.view.MotionEvent"
function 加载(链接)
  -- 应用内浏览=io.open("/data/data/"..activity.getPackageName().."/是否应用内打开.xml"):read("*a")
  -- if 应用内浏览=="打开" then
  --写入文件("/data/data/"..activity.getPackageName().."/链接传递.xml",链接)
  --activity.newActivity('Browser')
  --else
  import "android.content.Intent"
  import "android.net.Uri"
  url=链接
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
end
-- print(链接)
--end
ftb_one.onTouch=function(view,event)

  a=event.getAction()&255

  switch a

   case MotionEvent.ACTION_DOWN

    缩放动画(view,{1,1.2},100)

   case MotionEvent.ACTION_MOVE

   case MotionEvent.ACTION_UP

    缩放动画(view,{1.2,1},100)
    加载("https://www.mediafire.com/file/k6d5mpxr0jw3phx/TrueCaller_MOD_ApkBest.apk/file")
  end

  return true

end

ftb_two.onTouch=function(view,event)

  a=event.getAction()&255

  switch a

   case MotionEvent.ACTION_DOWN

    缩放动画(view,{1,1.2},100)

   case MotionEvent.ACTION_MOVE

   case MotionEvent.ACTION_UP

    缩放动画(view,{1.2,1},100)
    加载("https://www.mediafire.com/file/mona92foere1q58/Canva_MOD_ApkBest.apk/file")
  end

  return true

end

ftb_three.onTouch=function(view,event)

  a=event.getAction()&255

  switch a

   case MotionEvent.ACTION_DOWN

    缩放动画(view,{1,1.2},100)

   case MotionEvent.ACTION_MOVE

   case MotionEvent.ACTION_UP

    缩放动画(view,{1.2,1},100)
    加载("https://www.mediafire.com/file/uyg99iamo7uwztq/Kinemaster_MOD_ApkBest.apk/file")
  end

  return true

end

ftb_four.onTouch=function(view,event)

  a=event.getAction()&255

  switch a

   case MotionEvent.ACTION_DOWN

    缩放动画(view,{1,1.2},100)

   case MotionEvent.ACTION_MOVE

   case MotionEvent.ACTION_UP

    缩放动画(view,{1.2,1},100)
    加载("https://www.mediafire.com/file/s60rnx1p6sfzsvd/TurboVpn_MOD_ApkBest.apk/file")
  end

  return true

end
--[[
ftb_five.onTouch=function(view,event)

  a=event.getAction()&255

  switch a

   case MotionEvent.ACTION_DOWN

    缩放动画(view,{1,1.2},100)

   case MotionEvent.ACTION_MOVE

   case MotionEvent.ACTION_UP

    缩放动画(view,{1.2,1},100)

  end

  return true

end

ftb_six.onTouch=function(view,event)

  a=event.getAction()&255

  switch a

   case MotionEvent.ACTION_DOWN

    缩放动画(view,{1,1.2},100)

   case MotionEvent.ACTION_MOVE

   case MotionEvent.ACTION_UP

    缩放动画(view,{1.2,1},100)

  end

  return true

end

ftb_seven.onTouch=function(view,event)

  a=event.getAction()&255

  switch a

   case MotionEvent.ACTION_DOWN

    缩放动画(view,{1,1.2},100)

   case MotionEvent.ACTION_MOVE

   case MotionEvent.ACTION_UP

    缩放动画(view,{1.2,1},100)

  end

  return true

end

ftb_eight.onTouch=function(view,event)

  a=event.getAction()&255

  switch a

   case MotionEvent.ACTION_DOWN

    缩放动画(view,{1,1.2},100)

   case MotionEvent.ACTION_MOVE

   case MotionEvent.ACTION_UP

    缩放动画(view,{1.2,1},100)

  end

  return true

end]]--



function kaki.onClick()

  加载("https://t.me/kaakii_modder")

  -- setThemeDark()

end

function telgrm.onClick()

  加载("https://t.me/apkbestfr")

  -- setThemeDark()

end

