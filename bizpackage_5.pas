unit bizpackage_5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, math,bizsrvclass,bizutils,DOM, XMLRead,IdHTTP,
  IdSSLOpenSSL,fpjson, jsonparser,variants, MemUtils,DB,
  jsonscanner;

// package 5 51pas gongzhonghao
function pashome_1(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasmypost_2(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function passendsms_3(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function paslogin_4(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function paschecklogin_5(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function paswxscan_6(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasconfirmlogin_7(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasbbshome_8(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasbulletin_9(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasnewthread_10(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasthreadpost_11(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasviewthread_12(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasquicknewthread_13(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasquickthreadpost_14(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasquickresppost_15(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasgetuploadfileid_16(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasmyhome_17(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function paseditapp_18(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function paseditapppost_19(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasdeletethread_20(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pastopthread_21(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasclosethread_22(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pascanceltopthread_23(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pascancelclosethread_24(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasquoteresp_25(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasquoteresppost_26(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pasgetfile_27(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function pastestlongsqltext_28(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  package_5: array[1..28] of TServiceEntry = (
    (svcid:1;serviceproc:@pashome_1;desc:'';isbinary: false)
    ,(svcid:2;serviceproc:@pasmypost_2;desc:'';isbinary: false)
    ,(svcid:3;serviceproc:@passendsms_3;desc:'';isbinary: false)
    ,(svcid:4;serviceproc:@paslogin_4;desc:'';isbinary: false)
    ,(svcid:5;serviceproc:@paschecklogin_5;desc:'';isbinary: false)
    ,(svcid:6;serviceproc:@paswxscan_6;desc:'';isbinary: false)
    ,(svcid:7;serviceproc:@pasconfirmlogin_7;desc:'';isbinary: false)
    ,(svcid:8;serviceproc:@pasbbshome_8;desc:'';isbinary: false)
    ,(svcid:9;serviceproc:@pasbulletin_9;desc:'';isbinary: false)
    ,(svcid:10;serviceproc:@pasnewthread_10;desc:'';isbinary: false)
    ,(svcid:11;serviceproc:@pasthreadpost_11;desc:'';isbinary: false)
    ,(svcid:12;serviceproc:@pasviewthread_12;desc:'';isbinary: false)
    ,(svcid:13;serviceproc:@pasquicknewthread_13;desc:'';isbinary: false)
    ,(svcid:14;serviceproc:@pasquickthreadpost_14;desc:'';isbinary: false)
    ,(svcid:15;serviceproc:@pasquickresppost_15;desc:'';isbinary: false)
    ,(svcid:16;serviceproc:@pasgetuploadfileid_16;desc:'';isbinary: false)
    ,(svcid:17;serviceproc:@pasmyhome_17;desc:'';isbinary: false)
    ,(svcid:18;serviceproc:@paseditapp_18;desc:'';isbinary: false)
    ,(svcid:19;serviceproc:@paseditapppost_19;desc:'';isbinary: false)
    ,(svcid:20;serviceproc:@pasdeletethread_20;desc:'';isbinary: false)
    ,(svcid:21;serviceproc:@pastopthread_21;desc:'';isbinary: false)
    ,(svcid:22;serviceproc:@pasclosethread_22;desc:'';isbinary: false)
    ,(svcid:23;serviceproc:@pascanceltopthread_23;desc:'';isbinary: false)
    ,(svcid:24;serviceproc:@pascancelclosethread_24;desc:'';isbinary: false)
    ,(svcid:25;serviceproc:@pasquoteresp_25;desc:'';isbinary: false)
    ,(svcid:26;serviceproc:@pasquoteresppost_26;desc:'';isbinary: false)
    ,(svcid:27;serviceproc:@pasgetfile_27;desc:'';isbinary: false)
    ,(svcid:28;serviceproc:@pastestlongsqltext_28;desc:'';isbinary: false)
  );

implementation
procedure checkbbsright(session: tbizsession; bid: integer; var ismanager: boolean; var ismember: boolean; var iscert: boolean);
begin
  ismanager := false;
  ismember := false;
  iscert := false;

  if session.uid=1000100 then begin
    ismanager := true;
    ismember := true;
    iscert := true;
    exit;
  end;

  if session.uid<=0 then begin
    exit;
  end;

  session.query3.fieldlist := 'd_memvalid,i_cert';
  session.query3.tablelist := 'biz_wxid';
  session.query3.condition := 'i_user_id='+inttostr(session.uid);
  session.query3.open;
  if session.query3.eof then begin
    exit;
  end;

  if session.query3.fields[0].asdatetime>=floor(now) then
    ismember := true;

  if session.query3.fields[1].asinteger=1 then
    iscert := true;

  session.query3.fieldlist := 'i_user_id';
  session.query3.tablelist := 'bbs_bulletinmanager';
  session.query3.condition := 'i_bbs_id='+inttostr(bid)+' and i_user_id='+inttostr(session.uid);
  session.query3.open;
  if not session.query3.eof then ismanager := true;
end;

function pashome_1(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  vol,val: extended;
  pz,bgcolor,jqpz: string;
  rq: tdatetime;
  row: integer;
begin
  html := session.html;
  if session.uid<=0 then begin
    result := '请在微信中关注PAS社区后操作！';
    exit;
  end;

  session.query.fieldlist := 'c_wxname,c_name,c_mobile,i_cert,d_memvalid';
  session.query.tablelist := 'biz_wxid';
  session.query.condition := 'i_user_id='+inttostr(session.uid);
  session.query.open;

  html.appendline('<script language="javascript">');
  html.appendline('function clickapply() {');
  html.AppendLine('document.forms[''editmemfrm''].submit();');
  html.appendline('}');
  html.appendline('function sendsms() {');
  html.appendline('$.ajax({');
  html.appendline('   type:"GET",');
  html.appendline('   url:"passendsms.php?sj="+document.all.sj.value,');
  html.appendline('   datatype: "html",');
  html.appendline('            beforeSend: function () {');
  html.appendline('    	         document.all.fsyzm.innerHTML="发送中";');
  html.appendline('  	         },');
  html.appendline('            success:function(data){');
  html.appendline('    	         document.all.fsyzm.innerHTML="已发送";');
  html.appendline('            },');
  html.appendline('   error: function(){');
  html.appendline('   }');
  html.appendline(' });');
  html.appendline('}');
  html.appendline('</script>');
  html.AppendLine('<form name=editmemfrm action="pasmypost.php" method="post">');
  html.appendline('<ul id="my-listview" data-role="listview" data-inset="true">');
  html.writeli('data-mini="true"');
  html.WriteTABLE('width=100%');
  if session.query.fieldbyname('i_cert').asinteger=0 then begin
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('昵称<font color=red>*</font>');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.AppendLine('<input name="myname" type="text" value="'+'"/>');
    html.CloseTD;
    html.CloseTR;
    html.writetr('width=100%');
    html.WriteTD('colspan=2 class=bizsmalltxt');
    html.appendline('<font class=biztinytxt color=teal>注：昵称确认后不能修改!</font>');
    html.closetd;
    html.closetr;
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('手机号<font color=red>*</font>');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.AppendLine('<input name="sj" id="sj" type="text" value="'+session.query.fieldbyname('c_mobile').asstring+'"/>');
    html.CloseTD;
    html.CloseTR;
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('验证码<font color=red>*</font>');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.writetable('width=100%');
    html.writetr('width=100%');
    html.writetd('width=60% align=left');
    html.AppendLine('<input name="yzm" type="text" value=""/>');
    html.closetd;
    html.writetd('width=40% align=left');
    html.AppendLine('<a name="fsyzm" id="fsyzm" data-ajax=true onclick="sendsms();">发送验证码</a>');
    html.closetd;
    html.closetr;
    html.closetable;
    html.CloseTD;
    html.CloseTR;
  end
  else begin
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('昵称');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.AppendLine('<input name="myname" type="text" value="'+session.query.fieldbyname('c_name').asstring+'" readonly/>');
    html.CloseTD;
    html.CloseTR;
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('手机号');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.AppendLine('<input name="sj" type="text" value="'+session.query.fieldbyname('c_mobile').asstring+'" readonly/>');
    html.CloseTD;
    html.CloseTR;
  end;

  if session.query.fieldbyname('d_memvalid').asdatetime>1 then begin
    html.writetr('width=100%');
    html.WriteTD('colspan=2 class=bizsmalltxt');
    html.appendline('会员有效期至：'+formatdatetime('yyyy-mm-dd',session.query.fieldbyname('d_memvalid').asdatetime));
    html.closetd;
    html.closetr;
  end
  else begin
    html.writetr('width=100%');
    html.WriteTD('colspan=2 class=bizsmalltxt');
    html.appendline('<font class=biztinytxt color=teal>注：加入会员请联系微信号13801381127！</font>');
    html.closetd;
    html.closetr;
  end;

  html.writetr('width=100%');
  html.WriteTD('width=100% colspan=2');
  html.AppendLine('<a align=center onclick="clickapply()" data-role="button">保存</a>',true,true);
  html.CloseTD;
  html.CloseTR;

  html.CloseTABLE;
  html.CloseLI;

  result := html.content;
end;

function pasmypost_2(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  xm,sj,yzm: string;
begin
  if session.uid<=0 then begin
    result := '请在微信中关注PAS社区后操作！';
    exit;
  end;

  delimitstring(param,'&',session.strings);
  xm := bizurldecode(session.strings.values['myname']);
  sj := bizurldecode(session.strings.values['sj']);
  yzm := bizurldecode(session.strings.values['yzm']);
  if trim(xm)='' then begin
    result := '昵称不能为空！';
    exit;
  end;

  if trim(sj)='' then begin
    result := '手机不能为空！';
    exit;
  end;

  session.query.fieldlist := 'i_cert';
  session.query.tablelist := 'biz_wxid';
  session.query.condition := 'i_user_id='+inttostr(session.uid);
  session.query.open;
  if session.query.fields[0].asinteger=1 then begin
  end
  else begin
    session.query.fieldlist := 'i_user_id';
    session.query.tablelist := 'biz_wxqrm';
    session.query.condition := 'i_user_id='+inttostr(session.uid)+' and i_type=1 and c_mobile='''+sj+''' and c_qrm='''+yzm+'''';
    session.query.open;
    if session.query.eof then begin
      result := '手机验证码不对!';
      exit;
    end;

    session.delete('biz_wxqrm','i_user_id='+inttostr(session.uid)+' and i_type=1 and c_mobile='''+sj+''' and c_qrm='''+yzm+'''');
    session.update('biz_wxid','c_name,c_mobile,i_cert','i_user_id='+inttostr(session.uid),[xm,sj,1]);
  end;

  redirecturl := 'pasmy.php';
end;

function passendsms_3(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  sj,qrm: string;
  i,j: integer;
begin
  result := '';
  delimitstring(query,'&',session.strings);
  sj := session.strings.values['sj'];
  if length(sj)<>11 then begin
    result := '请输入正确的手机号！';
    exit;
  end;

  session.delete('biz_wxqrm','i_user_id='+inttostr(session.uid)+' and i_type=1 and c_mobile='''+sj+'''');
  session.insert('biz_wxqrm','i_user_id,i_type,c_mobile,c_qrm',[session.uid,'1',sj,'']);
  randomize;
  qrm := '';
  for j := 1 to 4 do begin
    i := random(10);
    qrm := qrm+inttostr(i);
  end;

  bizsendsms(sj,'验证码：'+qrm+'【PAS社区】', qrm);
  session.update('biz_wxqrm','c_qrm','i_user_id='+inttostr(session.uid)+' and i_type=1 and c_mobile='''+sj+'''',[qrm]);
end;

function paslogin_4(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  uuid: string;
begin
  result := '';
  html := session.html;
  uuid := bizuuid;
  bizqrencodepic('https://open.weixin.qq.com/connect/oauth2/authorize?'
    +'appid=wxa34c6a4fb6784f8d&redirect_uri=http%3A%2F%2Fwww.51pas.com%2Fpaswxscan.php?u='
    +uuid+'&response_type=code&scope=snsapi_base&state=123#'
    +'wechat_redirect',bizstring(@serverparam^.tmppath[1])+uuid+'.png',100);
  session.insert('biz_wxscan','c_uuid',[uuid]);
  html.appendline('<script language="javascript">');
  html.appendline('function autoclick() {');
  html.appendline('$.ajax({');
  html.appendline('   timeout: 5000,//请求超时时间（毫秒）');
  html.appendline('   async: true,//异步');
  html.appendline('   type: "GET",');
  html.appendline('   dataType: "html",//返回json格式的数据');
  html.appendline('   beforeSend: function () {');
  html.appendline('    	');
  html.appendline('  	},');
  html.appendline(' 	complete: function () {');
  html.appendline(' 	  ');
  html.appendline('  	},');
  html.appendline(' 	url: "paschecklogin.php?u='+uuid+'",');
  html.appendline('  	success: function (data) {');
  html.appendline('      var content = data;');
  html.appendline('      if (content=="1") {window.location.href="pashomepage.php";}');
  html.appendline('   },');
  html.appendline('   error: function(XMLHttpRequest, textStatus, errorThrown){');
  html.appendline('     alert("Error:"+textStatus);');
  html.appendline('   }');
  html.appendline('});');
  html.appendline('}');
  html.AppendLine('setInterval("autoclick()", 2000);');
  html.appendline('</script>');
  html.appendline('<div data-role="page" name="wqpage" id="wqpage" data-dom-cache="false" >');
  html.appendline('<table width=100%>');
  html.appendline('<tr width=100%>');
  html.appendline('<td width=100% align=center><br><br><br></td>');
  html.appendline('</tr>');
  html.appendline('<tr>');
  html.appendline('<td align=center>');
  html.appendline('<center><img src="loginewm.php?u='+uuid+'" width=200px height=200px/></center>');
  html.appendline('</td><tr><td align=center>');
  html.appendline('请用微信扫描上面二维码并确认登录。');
  html.appendline('</td></tr></table></div>');
  result := html.content;
end;


function paschecklogin_5(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  uuid: string;
  d: tdatetime;
begin
  result := '';
  delimitstring(query,'&',session.strings);
  uuid := session.strings.values['u'];
  session.query.fieldlist := '*';
  session.query.tablelist := 'biz_wxscan';
  session.query.condition := 'c_uuid='''+uuid+''' and d_time is not null';
  session.query.open;
  if (not session.query.eof) and ((now-session.query.fieldbyname('d_time').asdatetime)*24*60<=2) then begin
    result := '1';
    //session.delete('biz_wxscan','c_uuid='''+uuid+''' and d_time is not null');
    exit;
  end;
end;

function paswxscan_6(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  uuid,s: string;
  firstuid: integer;
begin
  result := '';
  if session.uid<=0 then begin
    result := '<table width=100%><tr width=100%><td align=center width=100% align=left>请长按下面二维码关注PAS社区微信公众号后再登录：</td></tr>';
    result := result+'<tr><td><img src="images/51pasewm.jpg"/></td></tr></table>';
    exit;
  end;

  delimitstring(query,'&',session.strings);
  uuid := session.strings.values['u'];
  html := session.html;
  session.query.fieldlist := 'c_wxname,c_name,c_mobile,i_cert,d_memvalid,i_subscript';
  session.query.tablelist := 'biz_wxid';
  session.query.condition := 'i_user_id='+inttostr(session.uid);
  session.query.open;
  if session.query.fields[5].asinteger=0 then begin
    result := '<table width=100%><tr width=100%><td align=center width=100% align=left>请长按下面二维码关注PAS社区微信公众号后再登录：</td></tr>';
    result := result+'<tr><td align=center><img src="images/51pasewm.jpg" width=100%/></td></tr></table>';
    exit;
  end;

  html.appendline('<script language="javascript">');
  html.appendline('function clickapply() {');
  html.AppendLine('document.forms[''editmemfrm''].submit();');
  html.appendline('}');
  html.appendline('function sendsms() {');
  html.appendline('$.ajax({');
  html.appendline('   type:"GET",');
  html.appendline('   url:"passendsms.php?sj="+document.all.sj.value,');
  html.appendline('   datatype: "html",');
  html.appendline('            beforeSend: function () {');
  html.appendline('    	         document.all.fsyzm.innerHTML="发送中";');
  html.appendline('  	         },');
  html.appendline('            success:function(data){');
  html.appendline('    	         document.all.fsyzm.innerHTML="已发送";');
  html.appendline('            },');
  html.appendline('   error: function(){');
  html.appendline('   }');
  html.appendline(' });');
  html.appendline('}');
  html.appendline('</script>');
  html.AppendLine('<form name=editmemfrm action="pasconfirmlogin.php?u='+uuid+'&uid='+inttostr(session.uid)+'" method="post">');
  html.appendline('<ul id="my-listview" data-role="listview" data-inset="true">');
  html.writeli('data-mini="true"');
  html.WriteTABLE('width=100%');
  if session.query.fieldbyname('i_cert').asinteger=0 then begin
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('昵称<font color=red>*</font>');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.AppendLine('<input name="myname" type="text" value="'+'"/>');
    html.CloseTD;
    html.CloseTR;
    html.writetr('width=100%');
    html.WriteTD('colspan=2 class=bizsmalltxt');
    html.appendline('<font class=biztinytxt color=teal>注：昵称确认后不能修改!</font>');
    html.closetd;
    html.closetr;
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('手机号<font color=red>*</font>');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.AppendLine('<input name="sj" id="sj" type="text" value="'+session.query.fieldbyname('c_mobile').asstring+'"/>');
    html.CloseTD;
    html.CloseTR;
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('验证码<font color=red>*</font>');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.writetable('width=100%');
    html.writetr('width=100%');
    html.writetd('width=60% align=left');
    html.AppendLine('<input name="yzm" type="text" value=""/>');
    html.closetd;
    html.writetd('width=40% align=left');
    html.AppendLine('<a name="fsyzm" id="fsyzm" data-ajax=true onclick="sendsms();">发送验证码</a>');
    html.closetd;
    html.closetr;
    html.closetable;
    html.CloseTD;
    html.CloseTR;
  end
  else begin
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('昵称');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.AppendLine('<input name="myname" type="text" value="'+session.query.fieldbyname('c_name').asstring+'" readonly/>');
    html.CloseTD;
    html.CloseTR;
    //html.writetr('width=100%');
    //html.WriteTD('width=40%');
    //html.AppendLine('手机号');
    //html.CloseTD;
    //html.WriteTD('width=60%');
    //html.AppendLine('<input name="sj" type="text" value="'+session.query.fieldbyname('c_mobile').asstring+'" readonly/>');
    //html.CloseTD;
    //html.CloseTR;
  end;

  html.writetr('width=100%');
  html.WriteTD('width=40%');
  html.AppendLine('记住登录');
  html.CloseTD;
  html.WriteTD('width=60%');
  html.AppendLine('<input name="jzdl" data-role="mini" type="checkbox" value="1"/>');
  html.CloseTD;
  html.CloseTR;
  {
  html.writetr('width=100%');
  html.WriteTD('width=40%');
  html.AppendLine('清除历史登录');
  html.CloseTD;
  html.WriteTD('width=60%');
  html.AppendLine('<input name="qcls" data-role="mini" type="checkbox" value="1"/>');
  html.CloseTD;
  html.CloseTR;
  }
  html.writetr('width=100%');
  html.WriteTD('width=100% colspan=2');
  html.AppendLine('<a align=center onclick="clickapply()" data-role="button">确定登录</a>',true,true);
  html.CloseTD;
  html.CloseTR;

  html.CloseTABLE;
  html.CloseLI;
  result := html.content;
end;

function pasconfirmlogin_7(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  uuid,jzdl,qcls: string;
  v: variant;
  uid: integer;
begin
  v := now;
  delimitstring(param,'&',session.strings);
  jzdl := session.strings.values['jzdl'];
  //qcls := session.strings.values['qcls'];

  delimitstring(query,'&',session.strings);
  uuid := session.strings.values['u'];
  uid := strtoint(session.strings.values['uid']);
  if session.uid<>uid then begin
    result := '登录错误！';
    exit;
  end;

  if jzdl<>'1' then jzdl := '0';
  if jzdl='1' then
    session.delete('biz_remember','i_user_id='+inttostr(session.uid));

  session.update('biz_wxscan','i_wxuser_id,c_user,i_user_id,d_time,i_remember','c_uuid='''+uuid+''' and d_time is null',
    [session.uid,session.username,session.uid,v,strtoint(jzdl)]);

  result := '登录成功！';
end;

function pasbbshome_8(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  i: integer;
  bgcolor: string;
  ismem,islogin: boolean;
  uuid,s1,s2,s3: string;
begin
  if session.uid<=0 then islogin := false
  else islogin := true;

  html := session.html;
  session.query.fieldlist := 'd_memvalid';
  session.query.tablelist := 'biz_wxid';
  session.query.condition := 'i_user_id='+inttostr(session.uid);
  session.query.open;
  if session.query.fields[0].asdatetime>=date then
    ismem := true
  else
    ismem := false;

  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_catalog';
  session.query.order := 'i_seq';
  session.query.open;
  if (not islogin) and (param='fromlogin') then begin
    uuid := bizuuid;
    s1 := 'https://open.weixin.qq.com/connect/oauth2/authorize?'
      +'appid=wxa34c6a4fb6784f8d&redirect_uri=http%3A%2F%2Fwww.ebizmis.com%2F'
      +'51pas%2Fpaswxscan.php?u='+uuid+'&response_type=code&scope=snsapi_base&state=123#'
      +'wechat_redirect';
    s2 := bizstring(@serverparam^.tmppath[1])+uuid+'.png';
    bizwritefile('/home/ramdisk/'+uuid+'.pic',s1+#$a+s2+#$a+'350');
    s3 := 'su - root -c "/usr/bin/qrencodepic /home/ramdisk/'+uuid+'.pic"';
    bizsystem(s3);
    deletefile('/home/ramdisk/'+uuid+'.pic');
    session.insert('biz_wxscan','c_uuid',[uuid]);
    html.appendline('<script language="javascript">');
    html.appendline('function autoclick() {');
    html.appendline('$.ajax({');
    html.appendline('   timeout: 5000,//请求超时时间（毫秒）');
    html.appendline('   async: true,//异步');
    html.appendline('   type: "GET",');
    html.appendline('   dataType: "html",//返回json格式的数据');
    html.appendline('   beforeSend: function () {');
    html.appendline('    	');
    html.appendline('  	},');
    html.appendline(' 	complete: function () {');
    html.appendline(' 	  ');
    html.appendline('  	},');
    html.appendline(' 	url: "paschecklogin.php?u='+uuid+'",');
    html.appendline('  	success: function (data) {');
    html.appendline('      var content = data;');
    html.appendline('      if (content=="1") {window.location.href="pashomepage.php";}');  //alert(document.cookie);
    html.appendline('   },');
    html.appendline('   error: function(XMLHttpRequest, textStatus, errorThrown){');
    html.appendline('     //alert("Error:"+textStatus);');
    html.appendline('   }');
    html.appendline('});');
    html.appendline('}');
    html.AppendLine('setInterval("autoclick()", 2000);');
    html.appendline('</script>');
    html.appendline('<div width=100%><table width=100%>');
    html.appendline('<tr bgcolor=#ccdffb width=100%%>');
    html.appendline('<td width=100% align=center>微信登录</td>');
    //html.appendline('<td width=4% align=center>或</td>');
    //html.appendline('<td width=48% align=center>QQ&nbsp;登录</td>');
    html.appendline('</tr>');
    html.appendline('<tr width=100%>');
    html.appendline('<td width=100% align=left style="border-top:none;border-bottom:1px solid #C1C1C1">');
    html.appendline('<table width=100%><tr width=100%><td width=100px height=100px align=left>');
    html.appendline('<img src="loginewm.php?u='+uuid+'" width=100px height=100px/>');
    html.appendline('</td><td valign=middle align=left>');
    html.appendline('请用微信扫描左边二维码并确认登录。');
    html.appendline('<br>请关注<font color=red><b>PAS社区</b></font>微信公众号注册。【<a href="pasreg.php" data-ajax=false>注册步骤说明</a>】');
    html.appendline('</td></tr></table></td>');
    //<td style="border-top:none;border-bottom:1px solid #C1C1C1">&nbsp;</td><td style="border-top:none;border-bottom:1px solid #C1C1C1">&nbsp;</td>
    html.appendline('</tr></table></div>');
  end
  else begin
    html.writediv('');
    if islogin then
      html.appendline('<br>'+session.username+' 您好，今天是'+formatdatetime('yyyy-mm-dd',now)+'！&nbsp;&nbsp;【<a href="logoff.php">退出登录</a>】')
    else
      html.appendline('<br>请关注PAS社区微信公众号注册。【<a href="pasreg.php" data-ajax=false>注册步骤说明</a>】');

    html.closediv;
  end;

  while not session.query.eof do begin
    html.writediv('class="mainbox forumlist"');
    html.appendline('<h3>'+session.query.fieldbyname('c_name').asstring+'</h3>');
    html.writetable('width=100%');
    html.appendline('<thead class="catagory">');
    html.writetr('bgcolor=#ccdffb width=100%');
    html.writetd('align=center valign=middle width=5%');
    html.appendline('<b>序号<b>');
    html.closetd;
    html.writetd('align=center valign=middle width=20%');
    html.appendline('<b>论坛名称<b>');
    html.closetd;
    html.writetd('align=center valign=middle width=75%');
    html.appendline('<b>最新回帖<b>');
    html.closetd;
    //html.writetd('align=center valign=middle width=15%');
    //html.appendline('<b>贴数<b>');
    //html.closetd;
    html.closetr;
    html.appendline('</thead>');
    session.query1.fieldlist := '*';
    session.query1.tablelist := 'bbs_bulletins';
    session.query1.condition := 'i_cat_id='+inttostr(session.query.fieldbyname('i_cat_id').asinteger)+' and i_hide=0';
    session.query1.Order := 'i_seq';
    session.query1.open;
    i := 0;
    while not session.query1.eof do begin
      inc(i);
      if (i div 2)*2=i then bgcolor := '#F5FCF5'
      else bgcolor := '#FAFAE9';
      html.writetr('bgcolor="'+bgcolor+'" width=100%');
      html.writetd('align=left valign=middle width=5% style="font-size:12px"');
      html.appendline(inttostr(i)+'<br><br>主题: '+inttostr(session.query1.fieldbyname('i_topic').asinteger)+'<br>跟帖: '+inttostr(session.query1.fieldbyname('i_post').asinteger));
      html.closetd;
      html.writetd('align=left valign=middle width=20% style="font-size:16px"');
      html.appendline('<br><a data-ajax="false" href="pasbulletin.php?bid='+inttostr(session.query1.fieldbyname('i_bbs_id').asinteger)+'"><b>'+session.query1.fieldbyname('c_name').asstring+'</b></a><br>');
      if session.query1.fieldbyname('c_desc').asstring<>'' then
        html.appendline('<span style="font-size:12px">'+session.query1.fieldbyname('c_desc').asstring+'</span><br>');

      html.appendline('<br>版主：'+session.query1.fieldbyname('c_manager').asstring+'<br>');
      html.closetd;
      html.writetd('width=75% style="font-size:14px" valign=top');
      session.query2.fieldlist := 'c_title,c_author,d_public,c_last_postuser,d_last_post,i_thread_id,i_post,i_click';
      session.query2.TableList := 'bbs_threads';
      session.query2.condition := 'i_bbs_id='+inttostr(session.query1.fieldbyname('i_bbs_id').asinteger)+' and i_seq=1 and i_hide=0';
      session.query2.order := 'd_last_post desc';
      session.query2.limit := 5;
      session.query2.open;
      html.writetable('width=100%');
      while not session.query2.eof do begin
        html.writetr('width=100%');
        html.writetd('width=70% style="border-bottom:1px solid #C1C1C1; font-size:14px"');
        html.appendline('<a data-ajax=false href="pasviewthread.php?tid='+inttostr(session.query2.fields[5].asinteger)+'">'+session.query2.fields[0].asstring+'</a>');
        html.closetd;
        html.writetd('width=30% style="border-bottom:1px solid #C1C1C1;font-size:12px;"');
        html.appendline('<font color=#225588>'+session.query2.fields[1].asstring+' '+formatdatetime('yyyy-mm-dd hh:nn',session.query2.fields[2].asdatetime)+'&nbsp;|&nbsp;'
          +session.query2.fields[3].asstring+' '+formatdatetime('mm-dd hh:nn',session.query2.fields[4].asdatetime)+'&nbsp;|&nbsp;'+inttostr(session.query2.fields[6].asinteger)+'/'+inttostr(session.query2.fields[7].asinteger)+'</font>');
        html.closetd;
        html.closetr;
        session.query2.next;
      end;

      html.closetable;
      html.closetd;
      html.writetd;
      html.closetd;
      html.closetr;
      session.query1.next;
    end;

    html.closetable;
    html.closediv;
    session.query.next;
  end;

  html.appendline('<br><br><br><br>');
  result := html.content;
end;

function pasbulletin_9(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  bid,pid,prevpid,nextpid,lastpid: integer;
  s: string;
  islogin,zdheader,ltheader,notop: boolean;
begin
  result := '';
  if session.uid<=0 then islogin := false
  else islogin := true;

  html := session.html;
  delimitstring(query,'&',session.strings);
  bid := strtoint(session.strings.values['bid']);
  s := session.strings.values['pid'];
  if s='' then pid := 0
  else pid := strtoint(s);

  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_bulletins';
  session.query.condition := 'i_bbs_id='+inttostr(bid);
  session.query.open;
  lastpid := (session.query.fieldbyname('i_topic').asinteger-1) div 25;
  if lastpid<0 then lastpid := 0;

  html.appendline('  <table width=100%>');
  html.appendline(' <tr><td width=1%></td><td width=98%>');
  html.writediv('');
  if islogin then
    html.appendline('<br>'+session.username+' 您好，今天是'+formatdatetime('yyyy-mm-dd',now)+'！&nbsp;&nbsp;【<a href="index.php">返回主页</a>】&nbsp;&nbsp;【<a href="logoff.php">退出登录</a>】<br>')
  else
    html.appendline('<br>请关注PAS社区微信公众号注册。今天是'+formatdatetime('yyyy-mm-dd',now)+'！&nbsp;&nbsp;【<a href="index.php">返回主页</a>】<br>');

  html.closediv;
  html.appendline('<br>');
  html.writediv('class="mainbox forumlist"');
  html.appendline('<font size=5><b>'+session.query.fieldbyname('c_name').asstring+'</b>&nbsp;&nbsp;<a data-role="button" data-inline="true" data-mini="true" data-ajax="false" href="pasnewthread.php?bid='+inttostr(bid)+'&tid=0&sid=0">发表新帖</a>&nbsp;&nbsp;<a data-role="button" data-inline="true" data-ajax="false" data-mini="true" href="pasquicknewthread.php?bid='+inttostr(bid)+'&tid=0&sid=0">快速发帖</a>');

  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_bbs_id='+inttostr(bid)+' and i_seq=1 and i_hide=0';
  session.query.order := 'i_type,d_last_post desc';
  session.query.offset := pid*25;
  session.query.limit := 25;
  session.query.open;
  zdheader := false;
  ltheader := false;
  notop := true;
  if pid=0 then prevpid := 0
  else prevpid := pid-1;
  if session.query.recordcount>=25 then nextpid := pid+1
  else nextpid := pid;
  html.writetable('width=100%');
  html.writetr('width=100%');
  html.writetd('style="font: 12px Arial, Tahoma; color: #225588;"');
  html.appendline('<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'&pid=0">首页</a>&nbsp;&nbsp;<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'&pid='+inttostr(prevpid)+'">前一页</a>&nbsp;&nbsp;'+inttostr(pid+1)+'&nbsp;&nbsp;<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'&pid='+inttostr(nextpid)+'">后一页</a>&nbsp;&nbsp;<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'&pid='+inttostr(lastpid)+'">末页</a>');
  html.closetd;
  html.closetr;
  html.closetable;

  html.writetable('width=100%');
  html.appendline('<thead class="catagory">');
  html.writetr('bgcolor=#ccdffb width=100%');
  html.writetd('align=center valign=middle width=5%');
  html.appendline('<b><b>');
  html.closetd;
  html.writetd('align=center valign=middle width=60%');
  html.appendline('<b>标&nbsp;&nbsp;题<b>');
  html.closetd;
  html.writetd('align=center valign=middle width=15%');
  html.appendline('<b>作者<b>');
  html.closetd;
  html.writetd('align=center valign=middle width=15%');
  html.appendline('<b>最后发表<b>');
  html.closetd;
  html.writetd('align=center valign=middle width=5%');
  html.appendline('<b>回复<b>');
  html.closetd;
  html.closetr;
  html.appendline('</thead>');
  while not session.query.eof do begin
    if (session.query.fieldbyname('i_type').asinteger=0) and (not zdheader) then begin
      html.writetr('width=100% style="font: 12px Arial, Tahoma; color: #225588; background-color: #D3DCEE;"');
      html.writetd();
      html.closetd;
      html.writetd('align=left colspan=4 style="font: 12px Arial, Tahoma; color: #225588; background-color: #D3DCEE;"');
      html.appendline('公告与置顶主题');
      html.closetd;
      html.closetr;
      zdheader := true;
      notop := true;
    end;

    if (session.query.fieldbyname('i_type').asinteger<>0) and (zdheader) and (not ltheader) then begin
      html.writetr('width=100% style="font: 12px Arial, Tahoma; color: #225588; background-color: #D3DCEE;"');
      html.writetd();
      html.closetd;
      html.writetd('align=left colspan=4 style="font: 12px Arial, Tahoma; color: #225588; background-color: #D3DCEE;"');
      html.appendline('论坛主题');
      html.closetd;
      html.closetr;
      ltheader := true;
      notop := true;
    end;

    if not notop then
      html.appendline('<tr><td colspan=5 border="0" height=1px style="border-top:none;border-bottom:1px solid #C1C1C1"></td></tr>')
    else
      notop := false;

    html.writetr('width=100%');
    html.writetd('align=center valign=middle width=5% style="font: 12px Arial, Tahoma; color: #225588;"');
    case session.query.fieldbyname('i_contenttype').asinteger of
      0:html.appendline('[公告]');
      1:html.appendline('[讨论]');
      2:html.appendline('[提问]');
      3:html.appendline('[原创]');
      4:html.appendline('[转帖]');
      5:html.appendline('[投票]');
    end;

    html.closetd;
    html.writetd('align=left valign=middle width=60% style="font: 12px Arial, Tahoma; color: #225588;"');
    html.appendline('<a data-ajax=false href="pasviewthread.php?tid='+inttostr(session.query.fieldbyname('i_thread_id').asinteger)+'">'+session.query.fieldbyname('c_title').asstring+'</a>');
    html.closetd;
    html.writetd('align=left valign=middle width=15% style="font: 12px Arial, Tahoma; color: #225588;"');
    html.appendline(session.query.fieldbyname('c_author').asstring+'<br>'+formatdatetime('yyyy-mm-dd hh:nn:ss',session.query.fieldbyname('d_public').asdatetime));
    html.closetd;
    html.writetd('align=left valign=middle width=15% style="font: 12px Arial, Tahoma; color: #225588;"');
    html.appendline(session.query.fieldbyname('c_last_postuser').asstring+'<br>'+formatdatetime('yyyy-mm-dd hh:nn:ss',session.query.fieldbyname('d_last_post').asdatetime));
    html.closetd;
    html.writetd('align=center valign=middle width=5% style="font: 12px Arial, Tahoma; color: #225588;"');
    html.appendline(inttostr(session.query.fieldbyname('i_post').asinteger)+'<br>'+inttostr(session.query.fieldbyname('i_click').asinteger));
    html.closetd;
    html.closetr;
    session.query.next;
  end;

  html.closetable;

  html.writetable('width=100%');
  html.appendline('<tr width=100%><td border="0" height=1px style="border-top:none;border-bottom:1px solid #C1C1C1"></td></tr>');
  html.writetr('width=100%');
  html.writetd('style="font: 12px Arial, Tahoma; color: #225588;"');
  html.appendline('<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'&pid=0">首页</a>&nbsp;&nbsp;<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'&pid='+inttostr(prevpid)+'">前一页</a>&nbsp;&nbsp;'+inttostr(pid+1)+'&nbsp;&nbsp;<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'&pid='+inttostr(nextpid)+'">后一页</a>&nbsp;&nbsp;<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'&pid='+inttostr(lastpid)+'">末页</a>');
  //html.appendline('<a href="#">首页</a>&nbsp;&nbsp;<a href="#">前一页</a>&nbsp;&nbsp;<a href="#">后一页</a>&nbsp;&nbsp;<a href="#">末页</a>');
  html.closetd;
  html.closetr;
  html.closetable;

  html.closediv;
  html.appendline('    </td>');
  html.appendline('	<td width=1%></td></tr></table>');
  result := html.content;
end;

function pasnewthread_10(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  bid,sid,tid: integer;
  bbsname,msg,s: string;
  ismanager,ismember,iscert: boolean;
  txtfile: tbiztextfile;
begin
  result := '';
  delimitstring(query,'&',session.strings);
  bid := strtoint(session.strings.values['bid']);
  tid := strtoint(session.strings.values['tid']);
  sid := strtoint(session.strings.values['sid']);
  checkbbsright(session,bid,ismanager,ismember,iscert);
  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_bulletins';
  session.query.condition := 'i_bbs_id='+inttostr(bid);
  session.query.open;
  bbsname := session.query.fieldbyname('c_name').asstring;
  if (session.query.fieldbyname('i_member').asinteger=1) and (not ismember) then begin
    result := bbsname+' 仅提供会员发帖，需要注册会员请联系微信号: christopherli。';
    exit;
  end
  else if not iscert then begin
    result := '为便于论坛管理要求，请认证手机号后发帖。位置：手机微信-->PAS社区公众号-->我的信息-->短信确认。';
    exit;
  end;

  html := session.html;
  html.appendline('<div style="width:100%"><form id="replyfrm" enctype="multipart/form-data" method="post">');
  html.appendline('    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" style="table-layout: fixed">');
  html.appendline('      <tr>');
  if tid=0 then
    html.appendline('        <td class="nav" width="90%" align="left" nowrap>&nbsp;<a href="pasbbs.php?bid='+inttostr(bid)+'">'+bbsname+'</a> &raquo; 发表新帖',True)
  else
    html.appendline('        <td class="nav" width="90%" align="left" nowrap>&nbsp;<a href="pasbbs.php?bid='+inttostr(bid)+'">'+bbsname+'</a> &raquo; 发表回复');

  html.appendline('        </td>');
  html.appendline('        <td align="right" width="10%">&nbsp;');
  html.appendline('        </td>');
  html.appendline('      </tr>');
  html.appendline('    </table>');
  html.appendline('    <div style="width:100%">');
  html.appendline('      <table cellspacing="1" cellpadding="4" width="100%" align="center" class="tableborder">');
  html.appendline('  <tr>');
  html.appendline('            <td class="altbg1" width="15%" valign="top">类型:');
  html.appendline('            </td> ');
  html.appendline('            <td class="altbg2"><table width=90%><tr><td align=right width=5%>');
  html.appendline('  		<input type="radio" value="0" name="em"></td><td width=12%>公告</td>');
  html.appendline('  <td width=5%>		<input type="radio" value="1" checked name="em"></td><td align=left width=12%>讨论</td>');
  html.appendline('  <td width=5%>		<input type="radio" value="2" name="em"></td><td align=left width=12%>提问</td>');
  html.appendline('  <td width=5%>		<input type="radio" value="3" name="em"></td><td align=left width=12%>原创</td>');
  html.appendline('  <td width=5%>		<input type="radio" value="4" name="em"></td><td align=left width=11%>转帖</td>');
  html.appendline('  <td width=5%></td><td align=left width=11%></td>');
  //html.appendline('  <td width=5%>		<input type="radio" value="5" name="em"></td><td align=left width=11%>投票</td>');
  html.appendline('            </tr></table></td>');
  html.appendline('          </tr>');
  html.appendline('        <tr>');
  html.appendline('          <td class="altbg1" width="15%">标题:');
  html.appendline('          </td>');
  html.appendline('          <td class="altbg2"><input type="text" name="subject" style="width:90%" size="100" value="" tabindex="3">');
  if tid<>0 then
    html.appendline('          &nbsp;(可选)</td>',True)
  else
    html.appendline('          </td>');

  html.appendline('        </tr>');
  html.appendline('        <tr>');
  html.appendline('          <td class="altbg1" valign="top">');
  html.appendline('            内容:<br><br>');
  html.appendline('            <table cellpadding="3" cellspacing="0" width="90%" border="0" class="altbg1" style="border-width: 2px; " align="center">');
  html.appendline('              <tr>');
  html.appendline('                <td align="center" style="border-width:1px; border-style:inset">表&nbsp;&nbsp;&nbsp;情');
  html.appendline('                </td>');
  html.appendline('              </tr>');
  try
    txtfile := tbiztextfile.create;
    txtfile.openexistfile('/etc/emoji.txt');
    while not txtfile.eof do begin
      s := '<tr><td align="center"><span style="font-size:24px">'+txtfile.readln+'</span></td></tr>';
      html.appendline(s);
    end;
  finally
    txtfile.free;
  end;

  html.appendline('              </table>');
  html.appendline('            </td>');
  html.appendline('            <td class="altbg2"><span class="smalltxt">');
  html.appendline('<script type="text/plain" id="myEditor" style="width:100%;height:240px;word-wrap:break-all;">');
  html.appendline('</script>');
  if sid<>0 then begin
    Session.query.FieldList := 'c_text,c_author,d_last_post,i_close,c_title';
    session.query.tablelist := 'bbs_threads';
    session.query.condition := 'i_thread_id='+inttostr(tid)+' and i_seq='+inttostr(sid)+' and i_hide=0';
    session.query.open;
    if not session.query.eof then begin
      msg := session.query.Fields[0].asstring;
      if msg='' then msg := Session.query.Fields[4].AsString;
      //bbsquote(msg);
      if msg<>'' then begin
        if session.query.Fields[3].asinteger=1 then
          msg := '[quote]原帖由 [b]匿名[/b] 于 '
            +formatdatetime('yyyy-mm-dd hh:nn:ss',session.query.Fields[2].AsDateTime)+' 发表'#$d#$a
            +msg+'[/quote]'
        else
          msg := '[quote]原帖由 [b]'+session.query.Fields[1].asstring+'[/b] 于 '
            +formatdatetime('yyyy-mm-dd hh:nn:ss',session.query.Fields[2].AsDateTime)+' 发表'#$d#$a
            +msg+'[/quote]';

        html.appendline(msg);
      end;
    end;
  end;

  html.appendline('            </td>');
  html.appendline('          </tr>');
  html.appendline('        <tr>');
  html.appendline('          <td class="altbg1" width="200px">附件:');
  html.appendline('          </td>');
  html.appendline('          <td class="altbg2"><input type="file" id="attfile" name="attfile"/>');
  html.appendline('          </td>');

  html.appendline('        </tr>');
  html.appendline('        </table>');
  html.appendline('        <br>');
  if tid=0 then
    html.appendline('        <center><input width="100px" type="submit" id="replysubmit" value="发表新帖" tabindex="5">',True)
  else
    html.appendline('        <center><input width="100px" type="submit" id="replysubmit" value="发表回复" tabindex="5">');

  html.appendline('        </center>');
  html.appendline('      </form></div>');
  html.appendline('        <script language="JavaScript">');
  html.appendline('  $("#replysubmit").click(function(event) {');
  html.appendline('      event.preventDefault();');
  html.appendline('      var s=UM.getEditor(''myEditor'').getContent();');
  html.appendline('      var n=s.length+2000;');
  html.appendline('      if (n>=900000) {alert("当前内容长度"+n+"字节，不能超过900000");return false;};');
  html.appendline('      var form_data = new FormData(document.getElementById(''replyfrm''));');
  html.appendline('      $.ajax({');
  html.appendline('          url: ''pasthreadpost.php?bid='+inttostr(bid)+'&tid=0&sid=0'',');
  html.appendline('          type: ''POST'',');
  html.appendline('          cache : false,');
  html.appendline('          contentType: false, ');
  html.appendline('          processData: false, ');
  html.appendline('          data: form_data');
  html.appendline('      })');
  html.appendline('      .done(function(data) {');
  html.appendline('          window.location.href=''pasbulletin.php?bid='+inttostr(bid)+''';');
  html.appendline('      })');
  html.appendline('      .fail(function(data) {');
  html.appendline('          console.log(data);');
  html.appendline('      });');
  html.appendline('      return false;');
  html.appendline('  });');
  html.appendline('</script></div></center>');
  html.appendline('<script type="text/javascript">');
  html.appendline('      var um = UM.getEditor("myEditor");');
  html.appendline('</script>');
  result := html.content;
end;

function pasthreadpost_11(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  s,em,attfile,subject,editorValue,replysubmit,bbsname: string;
  fileid,bid,tid,sid,ttype: integer;
  v: variant;
  ismanager,iscert,ismember: boolean;
begin
  //bizwritefilestring('/root/ramdisk/x.txt',param);
  delimitstring(param,'&',session.strings);
  em := session.strings.values['em'];
  subject := trim(bizurldecode(session.strings.values['subject']));
  if length(subject)<3 then begin
    result := '标题长度需要达到3个字符！';
    exit;
  end;

  attfile := bizurldecode(session.strings.values['attfile']);
  if attfile<>'' then begin
    fileid := strtoint(session.strings.values['fileid']);
    attfile := inttostr(fileid)+'/'+attfile;
  end;

  editorValue := bizurldecode(session.strings.values['editorValue']);
  bizwritefile('/root/textcontent.txt',editorvalue);
  if length(editorValue)<5 then begin
    result := '内容长度需要达到5个字符！';
    exit;
  end;

  bizloginfo(session,'content:'+inttostr(length(editorvalue)));
  if length(editorValue)>898000 then begin
    result := '内容长度不能超过900000个字符！';
    exit;
  end;

  bid := strtoint(session.strings.values['bid']);
  checkbbsright(session,bid,ismanager,ismember,iscert);

  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_bulletins';
  session.query.condition := 'i_bbs_id='+inttostr(bid);
  session.query.open;
  bbsname := session.query.fieldbyname('c_name').asstring;
  if (session.query.fieldbyname('i_member').asinteger=1) and (not ismember) then begin
    result := bbsname+' 仅提供会员发帖，需要注册会员请联系微信号: christopherli。';
    exit;
  end
  else if not iscert then begin
    result := '为便于论坛管理要求，请认证手机号后发帖。位置：手机微信-->PAS社区公众号-->我的信息-->短信确认。';
    exit;
  end;

  tid := 0;
  sid := 0;
  if tid=0 then tid := session.getglobalsequence(2000);
  if sid=0 then sid := 1;
  if em='0' then ttype := 0
  else ttype := 1;
  v := now;
  session.execsql('update bbs_bulletins set i_topic=i_topic+1 where i_bbs_id='+inttostr(bid));
  session.insert('bbs_threads','i_bbs_id,i_thread_id,i_seq,i_type,i_contenttype,i_close,c_title'
    +',c_author,i_author,d_public,c_ip,c_text,d_last_post,i_last_postuser,c_last_postuser,'
    +'i_post,i_click,i_approved,i_hide,i_quickresp,c_files,i_guest',
    [bid,tid,sid,ttype,strtoint(em),0,subject,
    session.username,session.uid,v,'',editorValue,v,session.uid,session.username,
    1,0,1,0,0,attfile,0]);
  redirecturl := 'pasviewthread.php?tid='+inttostr(tid);
  result := '';
end;

function pasviewthread_12(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  bid,tid,pid,lastpid,nextpid,prevpid: integer;
  islogin,zdheader,ltheader: boolean;
  bbsname,ctype,title,content,s: string;
  txtfile: tbiztextfile;
  ismanager,ismember,iscert: boolean;
begin
  result := '';
  pid := 0;
  ismanager := true;
  if session.uid<=0 then islogin := false
  else islogin := true;

  html := session.html;
  delimitstring(query,'&',session.strings);
  tid := strtoint(session.strings.values['tid']);
  s := session.strings.values['pid'];
  if s='' then pid := 0
  else pid := strtoint(s);

  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_thread_id='+inttostr(tid)+' and i_seq=1';
  session.query.open;
  if session.query.eof then begin
    result := '没有找到帖子！';
    exit;
  end;

  case session.query.fieldbyname('i_contenttype').asinteger of
    0:ctype:='[公告]&nbsp;';
    1:ctype:='[讨论]&nbsp;';
    2:ctype:='[提问]&nbsp;';
    3:ctype:='[原创]&nbsp;';
    4:ctype:='[转帖]&nbsp;';
    5:ctype:='[投票]&nbsp;';
  end;

  lastpid := (session.query.fieldbyname('i_post').asinteger) div 20;
  if lastpid<0 then lastpid := 0;

  bid := session.query.fieldbyname('i_bbs_id').asinteger;
  checkbbsright(session,bid,ismanager,ismember,iscert);
  title := session.query.fieldbyname('c_title').asstring;

  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_bulletins';
  session.query.condition := 'i_bbs_id='+inttostr(bid);
  session.query.open;
  bbsname := session.query.fieldbyname('c_name').asstring;

  // check authorize
  if (session.query.fieldbyname('i_member').asinteger=1) and (not ismember) then begin
    result := bbsname+' 仅提供会员访问，需要注册会员请联系微信号: christopherli。';
    exit;
  end;

  // increase click count
  if pid=0 then
    session.execsql('update bbs_threads set i_click=i_click+1 where i_thread_id='+inttostr(tid));

  html.appendline('<script type="text/javascript">');
  html.appendline('function clickapply() {');
  html.appendline('      var s=document.all.myEditor.value;');
  html.appendline('      var n=s.length+2000;');
  html.appendline('      if (n>=900000) {alert("当前内容长度"+n+"字节，不能超过900000");return false;};');
  html.AppendLine('  document.forms[''quickrespfrm''].submit();');
  html.appendline('}');
  html.appendline('  function setCaret(el, st, end)');
  html.appendline('  {');
  html.appendline('   if (el.setSelectionRange)');
  html.appendline('   {');
  html.appendline('    el.focus();');
  html.appendline('    el.setSelectionRange(st, end);');
  html.appendline('   }');
  html.appendline('   else');
  html.appendline('   {');
  html.appendline('    if (el.createTextRange)');
  html.appendline('    {');
  html.appendline('     range = el.createTextRange();');
  html.appendline('     range.collapse(true);');
  html.appendline('     range.moveEnd(''character'', end);');
  html.appendline('     range.moveStart(''character'', st);');
  html.appendline('     range.select();');
  html.appendline('    }');
  html.appendline('   }');
  html.appendline('  }');
  html.appendline('  function insertAtCursor(myField, myValue) {');
  html.appendline('          //IE support');
  html.appendline('          if (document.selection) {');
  html.appendline('              myField.focus();');
  html.appendline('              sel = document.selection.createRange();');
  html.appendline('              sel.text = myValue;');
  html.appendline('          }');
  html.appendline('          // Microsoft Edge');
  html.appendline('          else if(window.navigator.userAgent.indexOf("Edge") > -1) {');
  html.appendline('            var startPos = myField.selectionStart;');
  html.appendline('            var endPos = myField.selectionEnd;');
  html.appendline('            myField.value = myField.value.substring(0, startPos)+ myValue');
  html.appendline('                   + myField.value.substring(endPos, myField.value.length);');
  html.appendline('            var pos = startPos + myValue.length;');
  html.appendline('            myField.focus();');
  html.appendline('            myField.setSelectionRange(pos, pos);');
  html.appendline('          }');
  html.appendline('          //MOZILLA and others');
  html.appendline('          else if (myField.selectionStart || myField.selectionStart == ''0'') {');
  html.appendline('              var startPos = myField.selectionStart;');
  html.appendline('              var endPos = myField.selectionEnd;');
  html.appendline('              myField.value = myField.value.substring(0, startPos)');
  html.appendline('                  + myValue');
  html.appendline('                  + myField.value.substring(endPos, myField.value.length);');
  html.appendline('  	    setCaret(myField,startPos+myValue.length,startPos+myValue.length);');
  html.appendline('          } else {');
  html.appendline('              myField.value += myValue;');
  html.appendline('          }');
  html.appendline('      } ');
  html.appendline('  </script>');

  html.appendline('  <table width=100%>');
  html.appendline(' <tr><td width=1%></td><td width=98%>');
  html.writediv('');
  if islogin then
    html.appendline('<br>'+session.username+' 您好，今天是'+formatdatetime('yyyy-mm-dd',now)+'！&nbsp;&nbsp;【<a data-ajax=false href="index.php">返回主页</a>】&nbsp;&nbsp;【<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'">返回论坛</a>】&nbsp;&nbsp;【<a data-ajax=false href="logoff.php">退出登录</a>】<br>')
  else
    html.appendline('<br>请关注PAS社区微信公众号注册。今天是'+formatdatetime('yyyy-mm-dd',now)+'！&nbsp;&nbsp;【<a data-ajax=false href="index.php">返回主页</a>】&nbsp;&nbsp;【<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'">返回论坛</a>】<br>');

  html.closediv;
  html.appendline('<br>');
  html.writediv('class="mainbox forumlist"');

  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_thread_id='+inttostr(tid)+' and i_hide=0';
  session.query.order := 'i_seq';
  session.query.offset := 20*pid;
  session.query.limit := 20;
  session.query.open;
  if pid=0 then prevpid := 0
  else prevpid := pid-1;
  if session.query.recordcount>=25 then nextpid := pid+1
  else nextpid := pid;

  html.writetable('width=100% class=tableorder style="border-collapse: collapse;"');
  html.appendline('<tr><td width=160px border="0" height=1px style="border-top:none;border-bottom:1px solid #C1C1C1;" class=normaltxt>');
  html.appendline('<a data-ajax=false href="pasviewthread.php?tid='+inttostr(tid)+'&pid=0">首页</a>&nbsp;&nbsp;<a data-ajax=false href="pasviewthread.php?tid='+inttostr(tid)+'&pid='+inttostr(prevpid)+'">前一页</a>&nbsp;&nbsp;'+inttostr(pid+1)+'&nbsp;&nbsp;<a data-ajax=false href="pasviewthread.php?tid='+inttostr(tid)+'&pid='+inttostr(nextpid)+'">后一页</a>&nbsp;&nbsp;<a data-ajax=false href="pasviewthread.php?tid='+inttostr(tid)+'&pid='+inttostr(lastpid)+'">末页</a>');
  html.appendline('</td></tr>');
  html.writetr('style="background: #DEDEDE;table-layout: fixed"');
  html.appendline('<td width="160px" align="left" nowrap class=normaltxt style="border-right:1px solid #C1C1C1"><a data-ajax=false href="index.php">主页</a> &nbsp;&raquo;&nbsp;<a data-ajax=false href="pasbulletin.php?bid='+inttostr(bid)+'">'+bbsname+'</a>');
  html.appendline('</td>');
  html.appendline('<td class=normaltxt align="left"><table width=100%><tr width=100%><td width=90% align=left class=normaltxt>');
  html.appendline('<b>'+ctype+title);
  html.appendline('</b></td><td width=10% align=right class=normaltxt><a href="#" data-ajax=false>收藏</a></td></tr></table></td>');
  html.closetr;
  while not session.query.eof do begin
    html.appendline('<tr><td colspan=2 border="0" height=1px style="border-top:none;border-bottom:1px solid #C1C1C1"></td></tr>');
    html.writetr('width=100%');
    html.writetd('width=160px height="180px" valign=top align=left class=normaltxt style="border-right:1px solid #C1C1C1;border-bottom:1px solid #C1C1C1"');
    if session.query.fieldbyname('i_seq').asinteger=1 then
      html.appendline('<b>'+session.query.fieldbyname('c_author').asstring+'&nbsp;<font color=red>(楼主)</b>')
    else
      html.appendline('<b>'+session.query.fieldbyname('c_author').asstring+'&nbsp;<font color=red>('+inttostr(session.query.fieldbyname('i_seq').asinteger)+'楼)</b>');

    html.closetd;
    html.writetd('align=left valign=top class=normaltxt style="font-size:16px;border-bottom:1px solid #C1C1C1;word-wrap:break-all;"');
    if session.query.fieldbyname('i_quickresp').asinteger=1 then
      content := '<span style="font-size:16px">'+session.query.fieldbyname('c_text').asstring+'</span>'
    else
      content := session.query.fieldbyname('c_text').asstring;

    html.appendline(content);
    if session.query.fieldbyname('c_files').asstring<>'' then begin
       delimitstring(session.query.fieldbyname('c_files').asstring,'/',session.strings);
       html.appendline('<br><br>附件：<a target="blank_new" data-ajax=false href="pasgetfile.php?tid='+inttostr(tid)+'&sid='+inttostr(session.query.fieldbyname('i_seq').asinteger)+'">'+session.strings[1]+'</a>');
    end;

    html.closetd;
    html.closetr;
    html.writetr();
    html.writetd('align=left class=normaltxt style="border-right:1px solid #C1C1C1"');
    html.appendline(formatdatetime('yyyy-mm-dd hh:nn',session.query.fieldbyname('d_public').asdatetime));
    html.closetd;
    html.writetd('align=left class=normaltxt singleborder');
    html.appendline('<table width=100% border="0" cellspacing="0" cellpadding="0" class=tableorder><tr width=100%><td align=left width=50% class=normaltxt>');
    if session.query.fieldbyname('i_close').asinteger=0 then begin
      html.appendline('<a href="#" onclick="quickrespclick()" data-ajax=false data-mini=true data-inline=true>快速回复</a>&nbsp;&nbsp;');
      html.appendline('<a href="pasquoteresp.php?tid='+inttostr(tid)+'&sid='+inttostr(session.query.fieldbyname('i_seq').asinteger)+'" data-ajax=false data-mini=true data-inline=true>引用&nbsp;&nbsp;</a>');
      //if session.query.fieldbyname('i_author').asinteger=session.uid then
      //  html.appendline('<a href="#" data-ajax=false data-mini=true data-inline=true>补充本楼&nbsp;&nbsp;</a>');
    end;

    html.appendline('</td>');
    html.appendline('<td align=right class=normaltxt>');
    if ismanager then begin
      if session.query.fieldbyname('i_hide').asinteger=0 then
        html.appendline('<a href="pasdeletethread.php?tid='+inttostr(tid)+'&sid='+inttostr(session.query.fieldbyname('i_seq').asinteger)+'" data-ajax=false data-mini=true data-inline=true>删除</a>&nbsp;&nbsp;');

      if session.query.fieldbyname('i_type').asinteger<>0 then
        html.appendline('<a href="pastopthread.php?tid='+inttostr(tid)+'" data-ajax=false data-mini=true data-inline=true>置顶</a>&nbsp;&nbsp;')
      else
        html.appendline('<a href="pascanceltopthread.php?tid='+inttostr(tid)+'" data-ajax=false data-mini=true data-inline=true>取消置顶</a>&nbsp;&nbsp;');

      if session.query.fieldbyname('i_close').asinteger=0 then
        html.appendline('<a href="pasclosethread.php?tid='+inttostr(tid)+'" data-ajax=false data-mini=true data-inline=true>关闭本帖</a>')
      else
        html.appendline('<a href="pasclosethread.php?tid='+inttostr(tid)+'" data-ajax=false data-mini=true data-inline=true>取消关闭</a>');
    end;

    html.append('</td></tr></table>');
    html.closetd;
    html.closetr;
    session.query.next;
  end;

  html.appendline('<tr><td colspan=2 border="0" height=1px style="border-top:1px solid #C1C1C1;border-bottom:1px solid #C1C1C1" class=normaltxt>');
  html.appendline('<a data-ajax=false href="pasviewthread.php?tid='+inttostr(tid)+'&pid=0">首页</a>&nbsp;&nbsp;<a data-ajax=false href="pasviewthread.php?tid='+inttostr(tid)+'&pid='+inttostr(prevpid)+'">前一页</a>&nbsp;&nbsp;'+inttostr(pid+1)+'&nbsp;&nbsp;<a data-ajax=false href="pasviewthread.php?tid='+inttostr(tid)+'&pid='+inttostr(nextpid)+'">后一页</a>&nbsp;&nbsp;<a data-ajax=false href="pasviewthread.php?tid='+inttostr(tid)+'&pid='+inttostr(lastpid)+'">末页</a>');
  html.appendline('</td></tr>');
  html.closetable;
  html.closediv;
  html.appendline('    </td>');
  html.appendline('	<td width=1%></td></tr></table>');

  html.appendline('  <script type="text/javascript" >function quickrespclick() {window.location.hash = "#quickresp";'
    +'document.all.myEditor.focus();document.all.myEditor.rows=6}</script>');
  html.appendline('	<div id="quickresp" style="height:180px;width:100%">');
  html.appendline('<form name=quickrespfrm action="pasquickresppost.php?bid='+inttostr(bid)+'&tid='+inttostr(tid)+'&sid=0" method="post">');
  s := '';
  try
    txtfile := tbiztextfile.create;
    txtfile.openexistfile('/etc/emoji-quickresp.txt');
    while not txtfile.eof do begin
      s := s+txtfile.readln;
    end;
  finally
    txtfile.free;
  end;

  html.appendline('	<table width=100%><tr width=100%><td width=1%></td><td width=98% style="font-size:24px;">'+s+'</td><td width=1%></td></tr><tr><td width=1%></td><td>');
  html.appendline('		<textarea id="myEditor" name="myEditor" width=98% style="width:100%;height:180px;word-wrap:break-all;rows:6;font-size:16px;"></textarea>');
  html.appendline('</td><td width=1%></td></tr>');
  html.appendline('	<tr><td width=1%></td><td align=center><a href="#" onclick="clickapply();">快速回复</a></td><td></td></tr>');
  html.appendline('	</table>');
  html.appendline('	</div>');

  result := html.content;
end;

function pasquicknewthread_13(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  bid,sid,tid: integer;
  bbsname,msg,s: string;
  ismanager,ismember,iscert: boolean;
  txtfile: tbiztextfile;
begin
  result := '';
  ismanager := false;
  delimitstring(query,'&',session.strings);
  bid := strtoint(session.strings.values['bid']);
  tid := strtoint(session.strings.values['tid']);
  sid := strtoint(session.strings.values['sid']);
  checkbbsright(session,bid,ismanager,ismember,iscert);
  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_bulletins';
  session.query.condition := 'i_bbs_id='+inttostr(bid);
  session.query.open;
  bbsname := session.query.fieldbyname('c_name').asstring;
  if (session.query.fieldbyname('i_member').asinteger=1) and (not ismember) then begin
    result := bbsname+' 仅提供会员发帖，需要注册会员请联系微信号: christopherli。';
    exit;
  end
  else if not iscert then begin
    result := '为便于论坛管理要求，请认证手机号后发帖。位置：手机微信-->PAS社区公众号-->我的信息-->短信确认。';
    exit;
  end;

  html := session.html;
  html.appendline('<script type="text/javascript">');
  html.appendline('function clickapply() {');
  html.appendline('      var s=document.all.myEditor.value;');
  html.appendline('      var n=s.length+2000;');
  html.appendline('      if (n>=900000) {alert("当前内容长度"+n+"字节，不能超过900000");return false;};');
  html.AppendLine('  document.forms[''quickrespfrm''].submit();');
  html.appendline('}');
  html.appendline('  function setCaret(el, st, end)');
  html.appendline('  {');
  html.appendline('   if (el.setSelectionRange)');
  html.appendline('   {');
  html.appendline('    el.focus();');
  html.appendline('    el.setSelectionRange(st, end);');
  html.appendline('   }');
  html.appendline('   else');
  html.appendline('   {');
  html.appendline('    if (el.createTextRange)');
  html.appendline('    {');
  html.appendline('     range = el.createTextRange();');
  html.appendline('     range.collapse(true);');
  html.appendline('     range.moveEnd(''character'', end);');
  html.appendline('     range.moveStart(''character'', st);');
  html.appendline('     range.select();');
  html.appendline('    }');
  html.appendline('   }');
  html.appendline('  }');
  html.appendline('  function insertAtCursor(myField, myValue) {');
  html.appendline('          //IE support');
  html.appendline('          if (document.selection) {');
  html.appendline('              myField.focus();');
  html.appendline('              sel = document.selection.createRange();');
  html.appendline('              sel.text = myValue;');
  html.appendline('          }');
  html.appendline('          // Microsoft Edge');
  html.appendline('          else if(window.navigator.userAgent.indexOf("Edge") > -1) {');
  html.appendline('            var startPos = myField.selectionStart;');
  html.appendline('            var endPos = myField.selectionEnd;');
  html.appendline('            myField.value = myField.value.substring(0, startPos)+ myValue');
  html.appendline('                   + myField.value.substring(endPos, myField.value.length);');
  html.appendline('            var pos = startPos + myValue.length;');
  html.appendline('            myField.focus();');
  html.appendline('            myField.setSelectionRange(pos, pos);');
  html.appendline('          }');
  html.appendline('          //MOZILLA and others');
  html.appendline('          else if (myField.selectionStart || myField.selectionStart == ''0'') {');
  html.appendline('              var startPos = myField.selectionStart;');
  html.appendline('              var endPos = myField.selectionEnd;');
  html.appendline('              myField.value = myField.value.substring(0, startPos)');
  html.appendline('                  + myValue');
  html.appendline('                  + myField.value.substring(endPos, myField.value.length);');
  html.appendline('  	    setCaret(myField,startPos+myValue.length,startPos+myValue.length);');
  html.appendline('          } else {');
  html.appendline('              myField.value += myValue;');
  html.appendline('          }');
  html.appendline('      } ');
  html.appendline('  </script>');

  html.appendline('<div style="width:100%"><form name="quickrespfrm" action="pasquickthreadpost.php?bid='+inttostr(bid)+'&tid=0&sid='+inttostr(sid)+'" enctype="multipart/form-data" method="post">');
  html.appendline('    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" style="table-layout: fixed">');
  html.appendline('      <tr>');
  if tid=0 then
    html.appendline('        <td class="nav" width="90%" align="left" nowrap>&nbsp;<a href="pasbulletin.php?bid='+inttostr(bid)+'">'+bbsname+'</a> &raquo; 快速发帖',True)
  else
    html.appendline('        <td class="nav" width="90%" align="left" nowrap>&nbsp;<a href="pasbulletin.php?bid='+inttostr(bid)+'">'+bbsname+'</a> &raquo; 快速回复');

  html.appendline('        </td>');
  html.appendline('        <td align="right" width="10%">&nbsp;');
  html.appendline('        </td>');
  html.appendline('      </tr>');
  html.appendline('    </table>');
  html.appendline('    <div style="width:100%">');
  html.appendline('      <table cellspacing="1" cellpadding="4" width="100%" align="center" class="tableborder">');
  html.appendline('  <tr>');
  html.appendline('            <td class="altbg1" width="200px" valign="top">类型:');
  html.appendline('            </td> ');
  html.appendline('            <td class="altbg2"><table width=90%><tr><td align=right width=5%>');
  html.appendline('  		<input type="radio" value="0" name="em"></td><td width=12%>公告</td>');
  html.appendline('  <td width=5%>		<input type="radio" value="1" checked name="em"></td><td align=left width=12%>讨论</td>');
  html.appendline('  <td width=5%>		<input type="radio" value="2" name="em"></td><td align=left width=12%>提问</td>');
  html.appendline('  <td width=5%>		<input type="radio" value="3" name="em"></td><td align=left width=12%>原创</td>');
  html.appendline('  <td width=5%>		<input type="radio" value="4" name="em"></td><td align=left width=11%>转帖</td>');
  html.appendline('  <td width=5%></td><td align=left width=11%></td>');
  //html.appendline('  <td width=5%>		<input type="radio" value="5" name="em"></td><td align=left width=11%>投票</td>');
  html.appendline('            </tr></table></td>');
  html.appendline('          </tr>');
  html.appendline('        <tr>');
  html.appendline('          <td class="altbg1" width="200px">标题:');
  html.appendline('          </td>');
  html.appendline('          <td class="altbg2"><input type="text" name="subject" style="width:100%;min-height:30px;" size="100" value="" tabindex="3" style="height:30px; font-size:16pt">');
  if tid<>0 then
    html.appendline('          &nbsp;(可选)</td>',True)
  else
    html.appendline('          </td>');

  html.appendline('        </tr>');
  html.appendline('        <tr>');
  html.appendline('          <td class="altbg1" valign="top">');
  html.appendline('            内容:<br><br>');
  html.appendline('            <table cellpadding="3" cellspacing="0" width="90%" border="0" class="altbg1" style="border-width: 2px; " align="center">');
  html.appendline('              <tr>');
  html.appendline('                <td align="center" style="border-width:1px; border-style:inset">表&nbsp;&nbsp;&nbsp;情');
  html.appendline('                </td>');
  html.appendline('              </tr>');
  try
    txtfile := tbiztextfile.create;
    txtfile.openexistfile('/etc/emoji-quick.txt');
    while not txtfile.eof do begin
      s := '<tr><td align="center"><span style="font-size:24px">'+txtfile.readln+'</span></td></tr>';
      html.appendline(s);
    end;
  finally
    txtfile.free;
  end;

  html.appendline('              </table>');
  html.appendline('            </td>');
  html.appendline('            <td class="altbg2"><span class="smalltxt">');
  html.appendline('<textarea id="myEditor" name="myEditor" style="width:100%;height:240px;word-wrap:break-all;rows:6;font-size:16px;">');
  html.appendline('</textarea>');
  if sid<>0 then begin
    Session.query.FieldList := 'c_text,c_author,d_last_post,i_close,c_title';
    session.query.tablelist := 'bbs_threads';
    session.query.condition := 'i_thread_id='+inttostr(tid)+' and i_seq='+inttostr(sid)+' and i_hide=0';
    session.query.open;
    if not session.query.eof then begin
      msg := session.query.Fields[0].asstring;
      if msg='' then msg := Session.query.Fields[4].AsString;
      //bbsquote(msg);
      if msg<>'' then begin
        if session.query.Fields[3].asinteger=1 then
          msg := '[quote]原帖由 [b]匿名[/b] 于 '
            +formatdatetime('yyyy-mm-dd hh:nn:ss',session.query.Fields[2].AsDateTime)+' 发表'#$d#$a
            +msg+'[/quote]'
        else
          msg := '[quote]原帖由 [b]'+session.query.Fields[1].asstring+'[/b] 于 '
            +formatdatetime('yyyy-mm-dd hh:nn:ss',session.query.Fields[2].AsDateTime)+' 发表'#$d#$a
            +msg+'[/quote]';

        html.appendline(msg);
      end;
    end;
  end;

  html.appendline('            </td>');
  html.appendline('          </tr>');
  html.appendline('        <tr>');
  html.appendline('          <td class="altbg1" width="200px">附件:');
  html.appendline('          </td>');
  html.appendline('          <td class="altbg2"><input type="file" id="attfile" name="attfile"/>');
  html.appendline('          </td>');

  html.appendline('        </tr>');
  html.appendline('        </table>');
  html.appendline('        <br>');
  if tid=0 then
    html.appendline('        <center><input width="100px" style="min-height:30px" onclick="clickapply()" type="submit" name="replysubmit" value="发表新帖" tabindex="5">',True)
  else
    html.appendline('        <center><input width="100px" style="min-height:30px" onclick="clickapply()" type="submit" name="replysubmit" value="发表回复" tabindex="5">');

  html.appendline('        </center>');
  html.appendline('<script type="text/javascript">');
  html.appendline('      document.all.myEditor.rows=6;');
  html.appendline('</script>');
  html.appendline('</form></div>');
  result := html.content;
end;

function pasquickthreadpost_14(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  s,em,subject,editorValue,replysubmit,bbsname,attfile: string;
  bid,tid,sid,ttype,fileid: integer;
  v: variant;
  ismanager,iscert,ismember: boolean;
begin
  delimitstring(param,'&',session.strings);
  em := session.strings.values['em'];
  subject := trim(bizurldecode(session.strings.values['subject']));
  if length(subject)<3 then begin
    result := '标题长度需要达到3个字符！';
    exit;
  end;

  attfile := bizurldecode(session.strings.values['attfile']);
  if attfile<>'' then begin
    fileid := strtoint(session.strings.values['fileid']);
    attfile := inttostr(fileid)+'/'+attfile;
  end;

  editorValue := bizurldecode(session.strings.values['myEditor']);
  if length(editorValue)<5 then begin
    result := '内容长度需要达到5个字符！';
    exit;
  end;

  if length(editorValue)>898000 then begin
    result := '内容长度不能超过900000个字符！';
    exit;
  end;

  bid := strtoint(session.strings.values['bid']);
  checkbbsright(session,bid,ismanager,ismember,iscert);
  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_bulletins';
  session.query.condition := 'i_bbs_id='+inttostr(bid);
  session.query.open;
  bbsname := session.query.fieldbyname('c_name').asstring;
  if (session.query.fieldbyname('i_member').asinteger=1) and (not ismember) then begin
    result := bbsname+' 仅提供会员发帖，需要注册会员请联系微信号: christopherli。';
    exit;
  end
  else if not iscert then begin
    result := '为便于论坛管理要求，请认证手机号后发帖。位置：手机微信-->PAS社区公众号-->我的信息-->短信确认。';
    exit;
  end;

  tid := 0;
  sid := 0;
  if tid=0 then tid := session.getglobalsequence(2000);
  if sid=0 then sid := 1;
  if em='0' then ttype := 0
  else ttype := 1;
  v := now;
  session.execsql('update bbs_bulletins set i_topic=i_topic+1 where i_bbs_id='+inttostr(bid));
  session.insert('bbs_threads','i_bbs_id,i_thread_id,i_seq,i_type,i_contenttype,i_close,c_title'
    +',c_author,i_author,d_public,c_ip,c_text,d_last_post,i_last_postuser,c_last_postuser,'
    +'i_post,i_click,i_approved,i_hide,i_quickresp,c_files,i_guest',
    [bid,tid,sid,ttype,strtoint(em),0,subject,
    session.username,session.uid,v,'',editorValue,v,session.uid,session.username,
    1,0,1,0,0,attfile,0]);
  redirecturl := 'pasviewthread.php?tid='+inttostr(tid);
  result := '';
end;

function pasquickresppost_15(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  s,em,subject,editorValue,replysubmit,bbsname: string;
  bid,tid,sid,ttype: integer;
  v: variant;
  ismanager,ismember,iscert: boolean;
begin
  if session.uid<=0 then begin
    result := '请先登录论坛！';
    exit;
  end;

  delimitstring(param,'&',session.strings);
  editorValue := bizurldecode(session.strings.values['myEditor']);
  if length(editorValue)<2 then begin
    result := '内容长度需要达到2个字符！';
    exit;
  end;

  if length(editorValue)>898000 then begin
    result := '内容长度不能超过900000个字符！';
    exit;
  end;

  delimitstring(query,'&',session.strings);
  tid := strtoint(session.strings.values['tid']);
  session.starttransaction;
  try
    v := now;
    session.query.fieldlist := 'i_post,i_bbs_id';
    session.query.tablelist := 'bbs_threads';
    session.query.condition := 'i_thread_id='+inttostr(tid)+' and i_seq=1';
    session.query.open;
    if session.query.eof then begin
      raise exception.create('没有找到帖子！');
    end;

    bid := session.query.fields[1].asinteger;
    sid := session.query.fields[0].asinteger+1;

    checkbbsright(session,bid,ismanager,ismember,iscert);
    session.query.fieldlist := '*';
    session.query.tablelist := 'bbs_bulletins';
    session.query.condition := 'i_bbs_id='+inttostr(bid);
    session.query.open;
    bbsname := session.query.fieldbyname('c_name').asstring;
    if (session.query.fieldbyname('i_member').asinteger=1) and (not ismember) then begin
      raise exception.create(bbsname+' 仅提供会员发帖，需要注册会员请联系微信号: christopherli。');
    end
    else if not iscert then begin
      raise exception.create('为便于论坛管理要求，请认证手机号后发帖。位置：手机微信-->PAS社区公众号-->我的信息-->短信确认。');
    end;

    session.execsql('update bbs_bulletins set i_post=i_post+1 where i_bbs_id='+inttostr(bid));
    session.execsql('update bbs_threads set i_post=i_post+1,d_last_post='+getsqldatetimetext(v)+',c_last_postuser='''+session.username+''' where i_thread_id='+inttostr(tid)+' and i_seq=1');
    session.insert('bbs_threads','i_bbs_id,i_thread_id,i_seq,i_type,i_contenttype,i_close,c_title'
      +',c_author,i_author,d_public,c_ip,c_text,d_last_post,i_last_postuser,c_last_postuser,'
      +'i_post,i_click,i_approved,i_hide,i_quickresp,i_guest',
      [bid,tid,sid,1,1,0,'',
      session.username,session.uid,v,'',editorValue,v,session.uid,session.username,
      sid,0,1,0,1,0]);
    session.commit;
  except
    session.rollback;
    raise;
  end;

  redirecturl := 'pasviewthread.php?tid='+inttostr(tid);
  result := '';
end;

function pasgetuploadfileid_16(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
begin
  result := inttostr(session.getglobalsequence(2001,true));
end;

function pasmyhome_17(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  defstoreid,cert,row: integer;
  wxname,zsname,bgcolor: string;
begin
  result := '';
  if session.uid<=0 then begin
    result := 'please login in wechat!';
    exit;
  end;

  session.query.fieldlist := 'c_wxname,c_name,i_cert,d_memvalid';
  session.query.tablelist := 'biz_wxid';
  session.query.condition := 'i_user_id='+inttostr(session.uid);
  session.query.open;
  wxname := session.query.fields[0].asstring;
  zsname := session.query.fields[1].asstring;
  cert := session.query.fields[2].asinteger;
  html := session.html;
  html.appendline('<ul data-role="listview" data-ajax="false" data-inset="true" data-theme="a">');
  html.appendline('<li data-role="list-divider">我的信息&nbsp;&nbsp;<a data-ajax=false href="pasmodmeminfo.php">修改</a></li>');
  html.writeli('data-mini="true"');
  html.appendline('名称：'+zsname+'&nbsp;&nbsp;');
  if cert=0 then html.appendline('&nbsp;&nbsp;<font color=red><b>手机未认证</b></font>')
  else html.appendline('&nbsp;&nbsp;<font color=green><b>手机已认证</b></font>');

  if session.query.fields[3].asdatetime>=floor(now) then html.appendline('&nbsp;&nbsp;&nbsp;&nbsp;<font color=green><b>会员</b></font>')
  else html.appendline('&nbsp;&nbsp;&nbsp;&nbsp;<font color=red><b>非会员</b></font>');

  html.closeli;
  html.appendline('<li data-role="list-divider">eBizMIS应用登记</li>');
  html.appendline('<li><a data-ajax=false href="paseditapp.php?aid=0">登记新应用</a></li>');
  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_newapp';
  session.query.condition := 'i_user_id='+inttostr(session.uid)+' and i_hide=0';
  session.query.order := 'c_appname,d_time';
  session.query.open;
  html.writetable('width=100%');
  html.appendline('<thead class="catagory">');
  html.writetr('bgcolor=#ccdffb width=100%');
  html.writetd('align=center valign=middle width=35%');
  html.appendline('<b>应用名称<b>');
  html.closetd;
  html.writetd('align=center valign=middle width=20%');
  html.appendline('<b>授权<b>');
  html.closetd;
  html.writetd('align=center valign=middle width=45%');
  html.appendline('<b>机器码<b>');
  html.closetd;
  html.closetr;
  html.appendline('</thead>');
  row := 0;
  while not session.query.eof do begin
    inc(row);
    if (row div 2)*2=row then bgcolor := '#F5FCF5'
    else bgcolor := '#FAFAE9';
    html.WriteTR('bgcolor="'+bgcolor+'"');
    html.writetd('align=left');
    html.appendline('<a href="paseditapp.php?aid='+inttostr(session.query.fieldbyname('i_app_id').asinteger)+'" data-ajax=false>'+session.query.fieldbyname('c_appname').asstring+'</a><br>'+session.query.fieldbyname('c_host').asstring);
    html.closetd;
    html.writetd('align=left');
    html.appendline(session.query.fieldbyname('c_type').asstring+'<br>'+formatdatetime('yyyymmdd',session.query.fieldbyname('d_time').asdatetime));
    html.closetd;
    html.writetd('align=left');
    html.appendline(session.query.fieldbyname('c_machinecode').asstring+'<br>'+session.query.fieldbyname('c_serial').asstring);
    html.closetd;
    html.closetr;
    session.query.next;
  end;

  html.appendline('</ul>');
  result := html.content;
end;

function paseditapp_18(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  aid: integer;
  appname,appsheng,hangye,hostname,mcode,xlh: string;
  ismanager,ismember,iscert: boolean;
begin
  delimitstring(query,'&',session.strings);
  html := session.html;
  result := '';
  aid := strtoint(session.strings.values['aid']);
  checkbbsright(session,0,ismanager,ismember,iscert);
  if not iscert then begin
    result := '请先认证手机号码！';
    exit;
  end;

  //if not ismember then begin
  //  result := '该功能仅提供会员使用！';
  //  exit;
  //end;

  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_newapp';
  session.query.condition := 'i_app_id='+inttostr(aid)+' and i_hide=0';
  session.query.open;
  appname := session.query.fieldbyname('c_appname').asstring;
  appsheng := session.query.fieldbyname('c_sheng').asstring;
  hangye := session.query.fieldbyname('c_hangye').asstring;
  hostname := session.query.fieldbyname('c_host').asstring;
  mcode := session.query.fieldbyname('c_machinecode').asstring;
  xlh := session.query.fieldbyname('c_serial').asstring;
  html.appendline('<script language="javascript">');
  html.appendline('function clickapply() {');
  html.AppendLine('document.forms[''editappfrm''].submit();');
  html.appendline('}');
  html.appendline('</script>');
  html.AppendLine('<form name=editappfrm action="paseditapppost.php?aid='+inttostr(aid)+'" method="post">');
  html.appendline('<ul id="my-listview" data-role="listview" data-inset="true">');
  html.writeli('data-mini="true"');
  html.WriteTABLE('width=100%');
  html.writetr('width=100%');
  html.WriteTD('width=40%');
  html.AppendLine('应用名称<font color=red>*</font>');
  html.CloseTD;
  html.WriteTD('width=60%');
  html.AppendLine('<input name="appname" type="text" value="'+appname+'"/>');
  html.CloseTD;
  html.CloseTR;
  html.writetr('width=100%');
  html.WriteTD('width=40%');
  html.AppendLine('所属省<font color=red>*</font>');
  html.CloseTD;
  html.WriteTD('width=60%');
  html.AppendLine('<input name="appsheng" type="text" value="'+appsheng+'"/>');
  html.CloseTD;
  html.CloseTR;
  html.CloseTR;
  html.writetr('width=100%');
  html.WriteTD('width=40%');
  html.AppendLine('行业<font color=red>*</font>');
  html.CloseTD;
  html.WriteTD('width=60%');
  html.AppendLine('<input name="hangye" type="text" value="'+hangye+'"/>');
  html.CloseTD;
  html.CloseTR;
  html.writetr('width=100%');
  html.WriteTD('width=40%');
  html.AppendLine('域名或IP<font color=red>*</font>');
  html.CloseTD;
  html.WriteTD('width=60%');
  html.AppendLine('<input name="hostname" type="text" value="'+hostname+'"/>');
  html.CloseTD;
  html.CloseTR;
  if aid>0 then begin
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('机器码');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.AppendLine('<input name="mcode" type="text" value="'+mcode+'" readonly/>');
    html.CloseTD;
    html.CloseTR;
  end
  else begin
    html.writetr('width=100%');
    html.WriteTD('width=40%');
    html.AppendLine('机器码<font color=red>*</font>');
    html.CloseTD;
    html.WriteTD('width=60%');
    html.AppendLine('<input name="mcode" type="text" value="'+mcode+'"/>');
    html.CloseTD;
    html.CloseTR;
  end;

  html.writetr('width=100%');
  html.WriteTD('width=40%');
  html.AppendLine('序列号');
  html.CloseTD;
  html.WriteTD('width=60%');
  html.AppendLine('<input name="xlh" type="text" value="'+xlh+'" readonly/>');
  html.CloseTD;
  html.CloseTR;

  html.writetr('width=100%');
  html.WriteTD('width=100% colspan=2');
  if aid>0 then
    html.AppendLine('<a align=center onclick="clickapply()" data-role="button">保存</a>',true,true)
  else
    html.AppendLine('<a align=center onclick="clickapply()" data-role="button">重新生成序列号</a>',true,true);

  html.CloseTD;
  html.CloseTR;

  html.CloseTABLE;
  html.CloseLI;
  result := html.content;
end;

function paseditapppost_19(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  aid: integer;
  appname,appsheng,hangye,hostname,mcode,xlh: string;
  v: variant;
  ismanager,ismember,iscert: boolean;
begin
  checkbbsright(session,0,ismanager,ismember,iscert);
  if not iscert then begin
    result := '请先认证手机号码！';
    exit;
  end;

  //if not ismember then begin
  //  result := '该功能仅提供会员使用！';
  //  exit;
  //end;

  delimitstring(query,'&',session.strings);
  html := session.html;
  result := '';
  aid := strtoint(session.strings.values['aid']);
  delimitstring(param,'&',session.strings);
  appname := bizurldecode(session.strings.values['appname']);
  if length(appname)<=1 then begin
    result := '应用名称必须大于1个字符！';
    exit;
  end;

  appsheng := bizurldecode(session.strings.values['appsheng']);
  if length(appsheng)<=1 then begin
    result := '所属省必须长度大于1个字符！';
    exit;
  end;

  hangye := bizurldecode(session.strings.values['hangye']);
  if length(appsheng)<=1 then begin
    result := '行业必须长度大于1个字符！';
    exit;
  end;

  hostname := bizurldecode(session.strings.values['hostname']);
  if length(appsheng)<=1 then begin
    result := '域名或IP长度必须大于5个字符！';
    exit;
  end;

  mcode := bizurldecode(session.strings.values['mcode']);
  if length(mcode)<>6 then begin
    result := '机器码长度必须6位！';
    exit;
  end;

  xlh := bizurldecode(session.strings.values['xlh']);
  if aid<1 then begin
    session.query.fieldlist := 'i_app_id';
    session.query.tablelist := 'bbs_newapp';
    session.query.condition := 'i_user_id='+inttostr(session.uid)+' and (c_appname='''+appname+''' or c_machinecode='''+mcode+''' and c_host='''+hostname+''') and i_hide=0';
    session.query.open;
    if not session.query.eof then begin
      result := '已经存在应用名称:'+appname+'或机器码:'+mcode+'和域名及IP:'+hostname+'！';
      exit;
    end;

    aid := session.getglobalsequence(2001,true);
    v := now;
    bizsystem('getwebserver '+mcode+' '+hostname+'>/root/ramdisk/tmpcode.txt');
    xlh := bizreadfile('/root/ramdisk/tmpcode.txt');
    bizloginfo(session,'uid: '+inttostr(session.uid)+', host: '+hostname+', mcode: '+mcode+', serial: '+xlh);
    deletefile('/root/ramdisk/tmpcode.txt');
    session.insert('bbs_newapp','i_app_id,i_user_id,c_appname,c_hangye,c_sheng,d_time,i_hide,c_machinecode,c_type,c_host,c_serial',
      [aid,session.uid,appname,hangye,appsheng,v,0,mcode,'个人',hostname,xlh]);
  end
  else begin

  end;

  redirecturl := 'pasmy.php';
end;

function pasdeletethread_20(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  tid, sid,bid: integer;
  ismanager,ismember,iscert: boolean;
begin
  result := '';
  delimitstring(query,'&',session.strings);
  tid := strtoint(session.strings.values['tid']);
  sid := strtoint(session.strings.values['sid']);
  session.query.fieldlist := 'i_bbs_id';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_thread_id='+inttostr(tid);
  session.query.open;
  bid := session.query.fields[0].asinteger;
  checkbbsright(session,bid,ismanager,ismember,iscert);
  if not ismanager then begin
    result := '仅管理员可以删除帖子。';
    exit;
  end;

  session.update('bbs_threads','i_hide','i_thread_id='+inttostr(tid)+' and i_seq='+inttostr(sid),[1]);
  if sid=1 then begin
    redirecturl := 'pasbulletin.php?bid='+inttostr(bid);
  end
  else
    redirecturl := 'pasviewthread.php?tid='+inttostr(tid);
end;

function pastopthread_21(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  tid,bid: integer;
  ismanager,ismember,iscert: boolean;
begin
  result := '';
  delimitstring(query,'&',session.strings);
  tid := strtoint(session.strings.values['tid']);
  session.query.fieldlist := 'i_bbs_id';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_thread_id='+inttostr(tid);
  session.query.open;
  bid := session.query.fields[0].asinteger;
  checkbbsright(session,bid,ismanager,ismember,iscert);
  if not ismanager then begin
    result := '仅管理员可以置顶帖子。';
    exit;
  end;

  session.update('bbs_threads','i_type','i_thread_id='+inttostr(tid)+' and i_seq=1',[0]);
  redirecturl := 'pasbulletin.php?bid='+inttostr(bid);
end;

function pasclosethread_22(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  tid,bid: integer;
  ismanager,ismember,iscert: boolean;
begin
  result := '';
  delimitstring(query,'&',session.strings);
  tid := strtoint(session.strings.values['tid']);
  session.query.fieldlist := 'i_bbs_id';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_thread_id='+inttostr(tid);
  session.query.open;
  bid := session.query.fields[0].asinteger;
  checkbbsright(session,bid,ismanager,ismember,iscert);
  if not ismanager then begin
    result := '仅管理员可以关闭帖子。';
    exit;
  end;

  session.update('bbs_threads','i_close','i_thread_id='+inttostr(tid)+' and i_seq=1',[1]);
  redirecturl := 'pasbulletin.php?bid='+inttostr(bid);
end;

function pascanceltopthread_23(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  tid,bid: integer;
  ismanager,ismember,iscert: boolean;
begin
  result := '';
  delimitstring(query,'&',session.strings);
  tid := strtoint(session.strings.values['tid']);
  session.query.fieldlist := 'i_bbs_id';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_thread_id='+inttostr(tid);
  session.query.open;
  bid := session.query.fields[0].asinteger;
  checkbbsright(session,bid,ismanager,ismember,iscert);
  if not ismanager then begin
    result := '仅管理员可以取消置顶帖子。';
    exit;
  end;

  session.update('bbs_threads','i_type','i_thread_id='+inttostr(tid)+' and i_seq=1',[1]);
  redirecturl := 'pasbulletin.php?bid='+inttostr(bid);
end;

function pascancelclosethread_24(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  tid,bid: integer;
  ismanager,ismember,iscert: boolean;
begin
  result := '';
  delimitstring(query,'&',session.strings);
  tid := strtoint(session.strings.values['tid']);
  session.query.fieldlist := 'i_bbs_id';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_thread_id='+inttostr(tid);
  session.query.open;
  bid := session.query.fields[0].asinteger;
  checkbbsright(session,bid,ismanager,ismember,iscert);
  if not ismanager then begin
    result := '仅管理员可以取消关闭帖子。';
    exit;
  end;


  session.update('bbs_threads','i_close','i_thread_id='+inttostr(tid)+' and i_seq=1',[0]);
  redirecturl := 'pasbulletin.php?bid='+inttostr(bid);
end;

function pasquoteresp_25(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  html: tbizhtml;
  bid,sid,tid,i,j: integer;
  bbsname,msg,s,lou,str,s1: string;
  ismanager,ismember,iscert: boolean;
  txtfile: tbiztextfile;
  strlist: tstringlist;
begin
  result := '';
  ismanager := false;
  delimitstring(query,'&',session.strings);
  tid := strtoint(session.strings.values['tid']);
  sid := strtoint(session.strings.values['sid']);
  Session.query.FieldList := 'c_text,c_author,d_last_post,i_close,c_title,i_bbs_id,d_public,c_files';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_thread_id='+inttostr(tid)+' and i_seq='+inttostr(sid)+' and i_hide=0';
  session.query.open;
  if session.query.eof then begin
    result := '没有找到帖子！';
    exit;
  end;

  if sid=1 then lou := '楼主'
  else lou := inttostr(sid)+'楼';

  bid := session.query.fieldbyname('i_bbs_id').asinteger;
  checkbbsright(session,bid,ismanager,ismember,iscert);
  session.query1.fieldlist := '*';
  session.query1.tablelist := 'bbs_bulletins';
  session.query1.condition := 'i_bbs_id='+inttostr(bid);
  session.query1.open;
  bbsname := session.query1.fieldbyname('c_name').asstring;
  if (session.query1.fieldbyname('i_member').asinteger=1) and (not ismember) then begin
    result := bbsname+' 仅提供会员发帖，需要注册会员请联系微信号: christopherli。';
    exit;
  end
  else if not iscert then begin
    result := '为便于论坛管理要求，请认证手机号后发帖。位置：手机微信-->PAS社区公众号-->我的信息-->短信确认。';
    exit;
  end;

  html := session.html;
  html.appendline('<div style="width:100%"><form id="replyfrm" enctype="multipart/form-data" method="post">');
  html.appendline('    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" style="table-layout: fixed">');
  html.appendline('      <tr>');
  if tid=0 then
    html.appendline('        <td class="nav" width="90%" align="left" nowrap>&nbsp;<a href="pasbbs.php?bid='+inttostr(bid)+'">'+bbsname+'</a> &raquo; 发表新帖',True)
  else
    html.appendline('        <td class="nav" width="90%" align="left" nowrap>&nbsp;<a href="pasbbs.php?bid='+inttostr(bid)+'">'+bbsname+'</a> &raquo; 发表回复');

  html.appendline('        </td>');
  html.appendline('        <td align="right" width="10%">&nbsp;');
  html.appendline('        </td>');
  html.appendline('      </tr>');
  html.appendline('    </table>');
  html.appendline('    <div style="width:100%">');
  html.appendline('      <table cellspacing="1" cellpadding="4" width="100%" align="center" class="tableborder">');
  html.appendline('        <tr>');
  html.appendline('          <td class="altbg1" valign="top">');
  html.appendline('            内容:<br><br>');
  html.appendline('            <table cellpadding="3" cellspacing="0" width="90%" border="0" class="altbg1" style="border-width: 2px; " align="center">');
  html.appendline('              <tr>');
  html.appendline('                <td align="center" style="border-width:1px; border-style:inset">表&nbsp;&nbsp;&nbsp;情');
  html.appendline('                </td>');
  html.appendline('              </tr>');
  try
    txtfile := tbiztextfile.create;
    txtfile.openexistfile('/etc/emoji.txt');
    while not txtfile.eof do begin
      s := '<tr><td align="center"><span style="font-size:24px">'+txtfile.readln+'</span></td></tr>';
      html.appendline(s);
    end;
  finally
    txtfile.free;
  end;

  try
    strlist := tstringlist.create;
    s1 := session.query.fieldbyname('c_text').asstring;
    s1 := stringreplace(s1,'<p><br/></p>','',[rfreplaceall]);
    if session.query.fieldbyname('c_files').asstring<>'' then begin
      delimitstring(session.query.fieldbyname('c_files').asstring,'/',session.strings);
      s1 := s1+'附件：'+session.strings[1];
    end;

    //bizloginfo(session,'1:'+s1);
    i := pos('<center><table border="0" width="90%" style="border: 1px solid #A4B6D7"><tbody><tr><td width="100%" class="quotetxt" style="word-break:break-all">',s1);
    if i>0 then begin
      s := copy(s1,1,i-1);
      j := pos('</center>',s1);
      if j>0 then
        s := s+copy(s1,j+9,10000)
      else
        s := s1;

      s1 := s;
    end;

    try
      txtfile := tbiztextfile.create;
      txtfile.openexistfile('/etc/emoji-line.txt');
      i := 0;
      while not txtfile.eof do begin
        s := txtfile.readln;
        if pos(s,s1)>0 then begin
          inc(i);
          s1 := stringreplace(s1,s,'@@'+inttostr(i),[rfreplaceall]);
          j := strlist.add(s);
          strlist.objects[j] := tobject(pointer(i));
        end;
      end;

      str := bizgetlimittext(s1,100+3*i,true);
      for j := 0 to strlist.count-1 do begin
        i := integer(pointer(strlist.objects[j]));
        str := stringreplace(str,'@@'+inttostr(i),strlist[j],[rfreplaceall]);
      end;
    finally
      txtfile.free;
    end;

    html.appendline('              </table>');
    html.appendline('            </td>');
    html.appendline('            <td class="altbg2"><span class="smalltxt">');
    html.appendline('<script type="text/plain" id="myEditor" style="width:100%;height:240px;word-wrap:break-all;">');
    str := '<center><table border="0" width="90%" cellspacing="1" cellpadding="10" style="border: 1px solid #A4B6D7"><tr>'
      +'<td width="100%" class="quotetxt" style="word-break:break-all">原帖由 <b>'+session.query.fieldbyname('c_author').asstring+'('+lou+')</b> 于 '+formatdatetime('yyyy-mm-dd hh:nn',session.query.fieldbyname('d_public').asdatetime)+' 发表<br>'
      +str
      +'</td></tr></table></center>';
  finally
    strlist.free;
  end;

  html.appendline('</script>');
  html.appendline('            </td>');
  html.appendline('          </tr>');
  html.appendline('        <tr>');
  html.appendline('          <td class="altbg1" width="200px">附件:');
  html.appendline('          </td>');
  html.appendline('          <td class="altbg2"><input type="file" id="attfile" name="attfile"/>');
  html.appendline('          </td>');

  html.appendline('        </tr>');
  html.appendline('        </table>');
  html.appendline('        <br>');
  if tid=0 then
    html.appendline('        <center><input width="100px" type="submit" id="replysubmit" value="发表新帖" tabindex="5">',True)
  else
    html.appendline('        <center><input width="100px" type="submit" id="replysubmit" value="发表回复" tabindex="5">');

  html.appendline('        </center>');
  html.appendline('      </form></div>');
  html.appendline('        <script language="JavaScript">');
  html.appendline('  $("#replysubmit").click(function(event) {');
  html.appendline('      event.preventDefault();');
  html.appendline('      var s=UM.getEditor(''myEditor'').getContent();');
  html.appendline('      var n=s.length+2000;');
  html.appendline('      if (n>=900000) {alert("当前内容长度"+n+"字节，不能超过900000");return false;};');
  html.appendline('      var form_data = new FormData(document.getElementById(''replyfrm''));');
  html.appendline('      $.ajax({');
  html.appendline('          url: ''pasquoteresppost.php?tid='+inttostr(tid)+''',');
  html.appendline('          type: ''POST'',');
  html.appendline('          cache : false,');
  html.appendline('          contentType: false, ');
  html.appendline('          processData: false, ');
  html.appendline('          data: form_data');
  html.appendline('      })');
  html.appendline('      .done(function(data) {');
  html.appendline('          console.log(data);');
  html.appendline('          window.location.href=''pasviewthread.php?tid='+inttostr(tid)+''';');
  html.appendline('      })');
  html.appendline('      .fail(function(data) {');
  html.appendline('          console.log(data);');
  html.appendline('      });');
  html.appendline('      return false;');
  html.appendline('  });');
  html.appendline('</script></div></center>');
  html.appendline('<script type="text/javascript">');
  html.appendline('      var um = UM.getEditor("myEditor");');
  html.appendline('        value='''+str+''';');
  html.appendline('      um.execCommand(''insertHtml'', value)');
  html.appendline('</script>');
  result := html.content;
end;

function pasquoteresppost_26(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  s,em,attfile,subject,editorValue,bbsname,replysubmit: string;
  fileid,bid,tid,sid,ttype: integer;
  v: variant;
  ismanager,ismember,iscert: boolean;
begin
  //bizwritefilestring('/root/ramdisk/x.txt',param);
  delimitstring(param,'&',session.strings);
  subject := '';
  attfile := bizurldecode(session.strings.values['attfile']);
  if attfile<>'' then begin
    fileid := strtoint(session.strings.values['fileid']);
    attfile := inttostr(fileid)+'/'+attfile;
  end;

  editorValue := bizurldecode(session.strings.values['editorValue']);
  tid := strtoint(session.strings.values['tid']);

  if length(editorValue)>898000 then begin
    result := '内容长度不能超过900000个字符！';
    exit;
  end;

  session.starttransaction;
  try
    v := now;
    session.query.fieldlist := 'i_post,i_bbs_id';
    session.query.tablelist := 'bbs_threads';
    session.query.condition := 'i_thread_id='+inttostr(tid)+' and i_seq=1';
    session.query.open;
    if session.query.eof then begin
      raise exception.create('没有找到帖子！');
    end;

    sid := session.query.fields[0].asinteger+1;
    bid := session.query.fields[1].asinteger;
    checkbbsright(session,bid,ismanager,ismember,iscert);
    session.query.fieldlist := '*';
    session.query.tablelist := 'bbs_bulletins';
    session.query.condition := 'i_bbs_id='+inttostr(bid);
    session.query.open;
    bbsname := session.query.fieldbyname('c_name').asstring;
    if (session.query.fieldbyname('i_member').asinteger=1) and (not ismember) then begin
      raise exception.create(bbsname+' 仅提供会员发帖，需要注册会员请联系微信号: christopherli。');
    end
    else if not iscert then begin
      raise exception.create('为便于论坛管理要求，请认证手机号后发帖。位置：手机微信-->PAS社区公众号-->我的信息-->短信确认。');
    end;

    session.execsql('update bbs_bulletins set i_post=i_post+1 where i_bbs_id='+inttostr(bid));
    session.execsql('update bbs_threads set i_post=i_post+1,d_last_post='+getsqldatetimetext(v)+',c_last_postuser='''+session.username+''' where i_thread_id='+inttostr(tid)+' and i_seq=1');
    session.insert('bbs_threads','i_bbs_id,i_thread_id,i_seq,i_type,i_contenttype,i_close,c_title'
      +',c_author,i_author,d_public,c_ip,c_text,d_last_post,i_last_postuser,c_last_postuser,'
      +'i_post,i_click,i_approved,i_hide,i_quickresp,i_guest,c_files',
      [bid,tid,sid,1,1,0,'',
      session.username,session.uid,v,'',editorValue,v,session.uid,session.username,
      sid,0,1,0,1,0,attfile]);
    session.commit;
  except
    session.rollback;
    raise;
  end;

  redirecturl := 'pasviewthread.php?tid='+inttostr(tid);
  result := '';
end;

function pasgetfile_27(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  bid,tid,sid,fileid,filesize: integer;
  filename,fileext,fullfilename,bbsname,contenttype: string;
  js: TJsonObject;
  ismember,ismanager,iscert: boolean;
begin
  result := '';
  delimitstring(query,'&',session.strings);
  tid := strtoint(session.strings.values['tid']);
  sid := strtoint(session.strings.values['sid']);
  session.query.fieldlist := 'i_bbs_id,c_files';
  session.query.tablelist := 'bbs_threads';
  session.query.condition := 'i_thread_id='+inttostr(tid)+' and i_seq='+inttostr(sid)+' and i_hide=0';
  session.query.open;
  if (session.query.eof) or (session.query.fields[1].asstring='') then exit;
  bid := session.query.fields[0].asinteger;
  delimitstring(session.query.fields[1].asstring,'/',session.strings);
  fileid := strtoint(session.strings[0]);
  filename := session.strings[1];
  checkbbsright(session,bid,ismanager,ismember,iscert);
  session.query.fieldlist := '*';
  session.query.tablelist := 'bbs_bulletins';
  session.query.condition := 'i_bbs_id='+inttostr(bid);
  session.query.open;
  bbsname := session.query.fieldbyname('c_name').asstring;
  if (session.query.fieldbyname('i_member').asinteger=1) and (not ismember) then begin
    result := bbsname+' 仅提供会员下载，需要注册会员请联系微信号: christopherli。';
    exit;
  end
  else if not iscert then begin
    result := '为便于论坛管理要求，请认证手机号后发帖。位置：手机微信-->PAS社区公众号-->我的信息-->短信确认。';
    exit;
  end;

  fileext := extractfileext(filename);
  contenttype := bizgethttpcontenttype(fileext);
  fullfilename := '/mnt/disk_raid/51pasupload/'+inttostr(fileid);
  if not fileexists(fullfilename) then exit;
  filesize := bizfilesize(fullfilename);
  try
    js := tjsonobject.create;
    js.Add('contenttype',contenttype);
    js.add('filename',filename);
    js.add('filesize',filesize);
    js.add('fullfilename',fullfilename);
    if (pos('text',contenttype)>0) or (pos('image/',contenttype)>0) or (fileext='.pdf') or (fileext='.doc')
       or (fileext='.xls') or (fileext='.docx') or (fileext='.xlsx') or (fileext='.ppt') or (fileext='.pptx') then
      js.add('displayonly',1)
    else
      js.add('displayonly',0);

    result := js.asjson;
  finally
    js.free;
  end;
end;

function pastestlongsqltext_28(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  s: string;
begin
  result := 'Hello world!';
  //writeln(result);
  //s := bizreadfile('/home/51pas/me_centos/ebizmis.src/editor.txt');
  //writeln(s);
  //session.insert('bbs_threads','i_bbs_id,i_thread_id,i_seq,c_text',[1,1,1,s]);
end;

end.

