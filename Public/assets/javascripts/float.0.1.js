var F = F || {};


F.$ = function (id) {
    return document.getElementById(id);
}

//F.msg(msg,260,0,1000);
F.msg = function (html, width, height, isClose_time) {
    F.$('icibaWinWarning').style.width = width + 'px';
    if (height > 0) F.$('icibaWinWarningW').style.height = height + 'px';
    var pos = F.getPos(width, height);
    F.$('icibaWinWarning').style.left = (pos[0]) + 'px';
    F.$('icibaWinWarning').style.top = (pos[1]) + 'px';
    F.$('icibaWinWarningW').innerHTML = html;
    F.$('icibaWinWarning').style.display = 'block';
    //if(isClose)
    if (isClose_time > 0) {
        setTimeout(F.msgHide, isClose_time);
    }
}
F.msgHide = function () {
    F.$('icibaWinWarning').style.display = 'none';
}
/**
 String    title
 String    html,
 Arrary    bts Array( Array(clickFunction,valueString),Array(clickFunction,valueString));
 int    width
 int    height

 F.show('爱词霸短句2','<div style="padding:50px;">good</div>',[[function(){alert(5)},'关闭'],['','开始']],400,250);
 **/
F.show = function (title, html, bts, width, height) {
    try {
        btstring = '';
        F.$('icibaWinBotton').innerHTML = '';
        for (i = 0; i < bts.length; i++) {
            ds = document.createElement('span');
            b = document.createElement('INPUT');
            if (bts[i][0] != '') b.onclick = bts[i][0];
            if (bts[i][1] != '') b.value = bts[i][1];
            b.type = 'button';
            ds.appendChild(b);
            F.$('icibaWinBotton').appendChild(ds);
        }

    } catch (e) {
        alert("初始化按钮出问题");
    }

    F.$('icibaWin').style.width = width + 'px';
    if (height > 0) F.$('icibaWinContW').style.height = height + 'px';
    F.$('icibaWinTitle').innerHTML = title;
    F.$('icibaWinCont').innerHTML = html;
    var pos = F.getPos(width, height);
    F.$('icibaWin').style.left = (pos[0]) + 'px';
    //alert(height);
    //alert(body.clientHeight );
    /*var _top=pos[1];*/
    if (document.documentElement) {
        var _top = document.body.scrollTop + document.documentElement.scrollTop;
    } else {
        var _top = window.scrollY;
    }
    _top = _top + 100;

    /*
    if(height==0){
        _top= pos[1]-200;
    }else{
        _top= pos[1]-height;
    }
    if(_top<=0){_top=0;}
    */

    //alert(pos);
    F.$('icibaWin').style.top = _top + 'px';
    F.floatShow();
    F.$('icibaWin').style.display = 'block';
    $("#icibaWin").css({opacity: 1});
}
F.getPos = function (width, height) {
    //alert(height);
    var w = (document.documentElement) ? document.documentElement.scrollWidth : document.body.scrollWidth;
    var h = (document.documentElement) ? document.documentElement.scrollHeight : document.body.scrollHeight;
    var clX = (w - parseInt(width)) / 2;
    var clY = (h - parseInt(height)) / 4;

    if (clX < 0) clX = 0;
    if (clY < 0) clY = 0;
    if (document.documentElement) {
        ex = clX + document.documentElement.scrollLeft + document.body.scrollLeft;
        ey = clY + document.documentElement.scrollTop + document.body.scrollTop;
    } else {
        ex = clX + window.scrollX;
        ey = clY + window.scrollY;
    }
    if (height == 0) {
        //alert(ey);
        //ey= ey-200;
    } else {
        //alert(ey);
        //ey= ey-200;
    }
    if (ey <= 0) {
        ey = 0;
    }
    return [ex, ey];
}
F.hide = function () {
    var type = arguments.length > 0 ? arguments[0] : 0;
    //alert( typeof $  );
    if (typeof $ == 'function' && type == 0) {
        F.$('icibaWinFloat').style.display = 'none';
        $("#icibaWin").animate({opacity: 0}, 1000
            , function () {
                F.$('icibaWinCont').innerHTML = '';
                $("#icibaWin").hide();
            });


    } else {
        F.$('icibaWin').style.display = 'none';
        F.$('icibaWinFloat').style.display = 'none';
        F.$('icibaWinCont').innerHTML = '';
    }
    try {
        F.$('pigai_guide').style.display = 'none';
    } catch (e) {
    }

    //if(w) location.reload();
}

F.floatShow = function () {
    //document.documentElement.scrollHeight + 'px';
    //alert(document.documentElement.clientHeight+ ':'+ document.body.clientHeight +":"+ document.body.scrollTop);
    var w, h;
    if (self.innerHeight) {
        w = self.innerWidth;
        h = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) {
        w = document.documentElement.clientWidth;
        h = document.documentElement.clientHeight;
    } else if (document.body) {
        w = document.body.clientWidth;
        h = document.body.clientHeight;
    }
    sh = document.body.scrollTop;
    sh = sh ? sh : document.documentElement.scrollTop;
    mh = document.body.scrollHeight;
    mh = mh > h ? mh : h;

    h = mh;//(document.documentElement)?document.documentElement.scrollHeight:document.body.scrollHeight;
    w = (document.documentElement) ? document.documentElement.scrollWidth : document.body.scrollWidth;
    F.$('icibaWinFloat').style.width = '100%';//w+'px';
    F.$('icibaWinFloat').style.height = h + 'px';
    F.$('icibaWinFloat').style.display = 'block';

}
F.floatHide = function () {
    F.$('icibaWinFloat').style.display = 'none';
}

F.w = function (str) {
    document.write(str);
}


F.init = function () {
    F.w('<style>');
    F.w('#icibaWin{position:absolute;top:0px;left:5px;background-color:#ffffff;border:2px solid #bcd6ee;z-index:1005;display:none}');
    F.w('#icibaWinHead{height:27px;background:url("http://www.pigai.org/res/css/img/icibawin.png") repeat-x scroll -0px -0px;padding:0 10px 0 15px;}');
    F.w('#icibaWinHead #icibaWinTitle{float:left;font-size:12px;font-weight:bold;color:#336699;line-height:24px;font-family:"宋体"} ');
    F.w('#icibaWinHead #icibaWinClose{float:right;overflow:hidden;margin-top:5px;height:15px;width:15px;background:url("http://www.pigai.org/res/css/img/icibawin.png") no-repeat scroll -10px -40px;line-height:300px;cursor:pointer;} ');
    F.w('');
    F.w('#icibaWinContW{padding:20px;}');
    F.w('#icibaWinBotton{text-align:center;}');
    F.w('#icibaWinBotton span{margin-right:20px;margin-top:20px;border:1px solid #dfeffc}');
    F.w('#icibaWinBotton span INPUT{padding:0;margin:0;border:1px solid #bcd6ee;height:23px;cursor:pointer;');
    F.w('	background:url("http://www.pigai.org/res/css/img/icibawin.png") repeat-x scroll -0px -60px;font-size:12px;line-height:20px;padding:0 5px;');
    F.w('	color:#336699;font-family:"宋体";font-weight:bold;	');
    F.w('}');
    F.w('#icibaWinHead{cursor:move;}');
    F.w('#icibaWinFloat{background-color:#CCCCCC;height:100%;left:0;opacity:0.7;position:absolute;top:0;width:100%;z-index:1000;');
    F.w('	filter : progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=70,finishOpacity=100);display:none');
    F.w('}');
    F.w('#icibaWinWarning{background-color:#BCD6EE;	border:2px solid #DFEFFC;left:5px;position:absolute;top:0;z-index:1005;}');
    //F.w('#icibaWinWarningW{width:200px;}');

    F.w('</style>');
    F.w('<div id="icibaWin" style="width:400px;">');
    F.w('	<div id="icibaWinHead" >');
    F.w('		   <div id="icibaWinTitle">句酷批改网</div>');
    F.w('		   <div id="icibaWinClose">关闭</div>');
    F.w('		   <div style="clear:both"></div>');
    F.w('	</div>');
    F.w('	<div id="icibaWinContW">');
    F.w('		<div id="icibaWinCont">	</div>	');
    F.w('		<div id="icibaWinBotton">  </div>');
    F.w('	</div>');
    F.w('</div>');
    F.w('<div id="icibaWinFloat"></div>');
    F.w('<div id="icibaWinWarning" style="display:none;">	<div id="icibaWinWarningW">	提示。。。</div></div>');


    F.$('icibaWinClose').onclick = F.hide;
    F.$('icibaWinHead').onmousedown = F.regDrag;
}


function contact_us() {
    var html = '';
    html += "<div style='font-size:20px;padding-bottom:20px;font-weight:bold;text-align:left'>电话：4008-900-989<font style='font-size:12px;font-weight:normal'>(全国免长途话费)</font></div>";
    html += "<div style='font-size:20px;padding-bottom:20px;font-weight:bold;text-align:left'>邮箱：pigai@jukuu.com</div>";
    html += "<div style='font-size:20px;padding-bottom:20px;font-weight:bold;text-align:left;color:#999999'>手机：153-2156-1819</div>";
    try {
        F.show('联系我们 句酷批改网(pigai.org)', '<div style="padding:0 20px;" id="viewSqs">' + html + '<ul></ul></div>'
            , [[F.hide, '关 闭']], 400, 0);
        return false;
    } catch (e) {
        return true;
    }
}

//拖动
F.regDrag = function (e) {
    e = e || window.event;
    F.Drag(F.$('icibaWin'), e, false);
}


F.Drag = function (obj, e, limit) {


    e = e || window.event;
    var x = parseInt(obj.style.left);
    var y = parseInt(obj.style.top);

    var x_ = e.clientX - x;
    var y_ = e.clientY - y;
    if (document.addEventListener) {
        document.addEventListener('mousemove', PIGAI_move, true);
        document.addEventListener('mouseup', PIGAI_up, true);
    } else if (document.attachEvent) {
        document.attachEvent('onmousemove', PIGAI_move);
        document.attachEvent('onmouseup', PIGAI_up);
    }

    PIGAI_stop(e);
    PIGAI_abort(e)

    function PIGAI_move(e) {
        e = e || window.event;
        if ((e.clientX - x_) < 0) {
            return false;
        }
        if ((e.clientY - y_) < 0) {
            return false;
        }
        if (limit) {
            if ((e.clientX - x_ + K.config.oObjWidth) > K.config.bodyArea["x"]) {
                return false;
            }
            if ((e.clientY - y_ + K.config.oObjHeight) > K.config.bodyArea["y"]) {
                return false;
            }
            //status=e.clientY-y_;
        }

        obj.style.left = e.clientX - x_ + 'px';
        obj.style.top = e.clientY - y_ + 'px';
        PIGAI_stop(e);
    }

    function PIGAI_up(e) {
        e = e || window.event;

        if (document.removeEventListener) {
            document.removeEventListener('mousemove', PIGAI_move, true);
            document.removeEventListener('mouseup', PIGAI_up, true);
        } else if (document.detachEvent) {
            document.detachEvent('onmousemove', PIGAI_move);
            document.detachEvent('onmouseup', PIGAI_up);
        }

        PIGAI_stop(e);
    }

    function PIGAI_stop(e) {
        if (e.stopPropagation) return e.stopPropagation();
        else return e.cancelBubble = true;
    }

    function PIGAI_abort(e) {
        if (e.preventDefault) return e.preventDefault();
        else return e.returnValue = false;
    }
}

F.init();