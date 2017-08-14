unit bizpackage_1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, math,bizsrvclass,bizutils,DOM, XMLRead,IdHTTP,IdSSLOpenSSL,
  fpJSON, jsonscanner, JSONParser,DB;

// package 1 webbaseservice
function test_1(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function login_2(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function receivewxmsg_3(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function testclient_4(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function login_5(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function openquery_6(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getdbfile_7(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getservertime_8(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getad_9(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function checktaskright_10(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getbulletin_11(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function execsql_12(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function exists_13(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getsequence_14(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function committrx_15(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function batchcreatecomp_16(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function verifyconfirmcode_17(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function deletecompany_18(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getclientcert_19(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function checkclientcert_20(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getglobalsequence_21(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function uploadfile_22(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function genewm_23(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function deletefile_24(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getparam_25(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function writeparam_26(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function writeparamex_27(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getparamex_28(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getbasefilelist_29(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function downloadfile_30(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getpwd_31(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function checkuuidlogin_32(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function getwxjsticket_33(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
function isremember_34(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  package_1: array[1..34] of TServiceEntry = (
    (svcid:1;serviceproc:@test_1;desc:'';isbinary: false)
    ,(svcid:2;serviceproc:@login_2;desc:'';isbinary: false)
    ,(svcid:3;serviceproc:@receivewxmsg_3;desc:'';isbinary: false)
    ,(svcid:4;serviceproc:@testclient_4;desc:'';isbinary: true)
    ,(svcid:5;serviceproc:@login_5;desc:'';isbinary: true)
    ,(svcid:6;serviceproc:@openquery_6;desc:'';isbinary: true)
    ,(svcid:7;serviceproc:@getdbfile_7;desc:'';isbinary: true)
    ,(svcid:8;serviceproc:@getservertime_8;desc:'';isbinary: true)
    ,(svcid:9;serviceproc:@getad_9;desc:'';isbinary: true)
    ,(svcid:10;serviceproc:@checktaskright_10;desc:'';isbinary: true)
    ,(svcid:11;serviceproc:@getbulletin_11;desc:'';isbinary: true)
    ,(svcid:12;serviceproc:@execsql_12;desc:'';isbinary: true)
    ,(svcid:13;serviceproc:@exists_13;desc:'';isbinary: true)
    ,(svcid:14;serviceproc:@getsequence_14;desc:'';isbinary: true)
    ,(svcid:15;serviceproc:@committrx_15;desc:'';isbinary: true)
    ,(svcid:16;serviceproc:@batchcreatecomp_16;desc:'';isbinary:true)
    ,(svcid:17;serviceproc:@verifyconfirmcode_17;desc:'';isbinary:true)
    ,(svcid:18;serviceproc:@deletecompany_18;desc:'';isbinary:true)
    ,(svcid:19;serviceproc:@getclientcert_19;desc:'';isbinary:true)
    ,(svcid:20;serviceproc:@checkclientcert_20;desc:'';isbinary:true)
    ,(svcid:21;serviceproc:@getglobalsequence_21;desc:'';isbinary:true)
    ,(svcid:22;serviceproc:@uploadfile_22;desc:'';isbinary:true)
    ,(svcid:23;serviceproc:@genewm_23;desc:'';isbinary:true)
    ,(svcid:24;serviceproc:@deletefile_24;desc:'';isbinary:true)
    ,(svcid:25;serviceproc:@getparam_25;desc:'';isbinary:true)
    ,(svcid:26;serviceproc:@writeparam_26;desc:'';isbinary:true)
    ,(svcid:27;serviceproc:@writeparamex_27;desc:'';isbinary:true)
    ,(svcid:28;serviceproc:@getparamex_28;desc:'';isbinary:true)
    ,(svcid:29;serviceproc:@getbasefilelist_29;desc:'';isbinary:true)
    ,(svcid:30;serviceproc:@downloadfile_30;desc:'';isbinary:true)
    ,(svcid:31;serviceproc:@getpwd_31;desc:'';isbinary:true)
    ,(svcid:32;serviceproc:@checkuuidlogin_32;desc:'';isbinary:true)
    ,(svcid:33;serviceproc:@getwxjsticket_33;desc:'';isbinary:true)
    ,(svcid:34;serviceproc:@isremember_34;desc:'';isbinary:true)
  );

  //p: TServiceEntry;
  //p1: function (session: TBizSession; appid: integer; const path,query,param: string; var retlen: integer): string;
implementation
function test_1(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
begin
  result := 'Hi, '+session.username+', today is '+formatdatetime('yyyy-mm-dd',now)+' 【<a href="logoff.php">退出</a>】!';
end;

function login_2(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  code,s,openid,logintype: string;
  idhttp1: tidhttp;
  IdSSLIOHandlerSocketOpenSSL1: tIdSSLIOHandlerSocketOpenSSL;
  strstream: tstringstream;
  js: TJsonObject;
  uid: integer;
  P : TJSONParser;
  D : TJSONData;
  v: variant;
  remember: integer;
begin
  bizloginfo(session, param);
  result := '';
  delimitstring(param,'^',session.strings);
  code := session.strings[1];
  if trim(code)='' then raise exception.create('cannot login');
  logintype := session.strings[0];
  bizloginfo(session,'code:'+code);
  v := now;
  if logintype='1' then begin
    js := nil;
    p := nil;
    d := nil;
    try
      idhttp1 := tidhttp.Create(nil);
      IdSSLIOHandlerSocketOpenSSL1 := tIdSSLIOHandlerSocketOpenSSL.Create(nil);
      strstream := tstringstream.Create('');
      idhttp1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
      s := 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='+session.wxappid+'&secret='+session.wxsecret+'&code='+code+'&grant_type=authorization_code';
      bizloginfo(session,'get openid:'+s);
      idhttp1.Get(s,strstream);
      s := strstream.datastring;
      bizloginfo(session,'get return :'+s);
      p := tjsonparser.create(s,[]);
      P.Options:=P.Options+[joStrict];
      js := tjsonobject(p.parse);

      openid := bizunquote(js.Get('openid',''));
      if trim(openid)='' then raise exception.create('cannot login');
      session.query.FieldList := '*';
      session.query.TableList := 'biz_wxid';
      session.query.Condition := 'c_wxid='''+openid+'''';
      session.QUERY.open;
      if not session.query.eof then begin
        session.loginstate^.islogin:=1;
        session.loginstate^.uid:=session.query.fieldbyname('i_user_id').asinteger;
        s := session.query.fieldbyname('c_name').asstring;
        strcopy(@session.loginstate^.username[1],pchar(s));
        strcopy(@session.loginstate^.wxid[1],pchar(openid));
        bizloginfo(session,'login successfully 1,wxid:'+openid+',uid:'+inttostr(session.query.fieldbyname('i_user_id').asinteger)+',username:'+s+',uuid:'+session.uuid);
        bizloginfo(session,'login state,wxid:'+session.wxid+',uid:'+inttostr(session.uid)+',username:'+session.username);
      end
      else raise exception.create('cannot login');
    finally
      freeandnil(p);
      IdSSLIOHandlerSocketOpenSSL1.Free;
      idhttp1.Free;
      strstream.free;
    end;
  end
  else if logintype='2' then begin
    session.query.fieldlist := '*';
    session.query.tablelist := 'biz_wxscan';
    session.query.condition := 'c_uuid='''+code+''' and d_time is not null';
    session.query.open;
    remember := session.query.fieldbyname('i_remember').asinteger;
    if (not session.query.eof) and ((now-session.query.fieldbyname('d_time').asdatetime)*24*60<=1) then begin
      uid := session.query.fieldbyname('i_user_id').asinteger;
      session.query.FieldList := '*';
      session.query.TableList := 'biz_wxid';
      session.query.Condition := 'i_user_id='+inttostr(uid);
      session.QUERY.open;

      session.loginstate^.islogin:=1;
      session.loginstate^.uid:=session.query.fieldbyname('i_user_id').asinteger;
      s := session.query.fieldbyname('c_name').asstring;
      strcopy(@session.loginstate^.username[1],pchar(s));
      strcopy(@session.loginstate^.wxid[1],pchar(openid));
      if remember=1 then begin
        session.insert('biz_remember','i_sys_id,i_user_id,c_token,d_last,d_remember',[appid,session.uid,code,v,v]);
      end;

      bizloginfo(session,'login successfully 2,wxid:'+openid+',uid:'+inttostr(session.query.fieldbyname('i_user_id').asinteger)+',username:'+s+',uuid:'+session.uuid);
      bizloginfo(session,'login state,wxid:'+session.wxid+',uid:'+inttostr(session.uid)+',username:'+session.username);
    end
    else begin
      raise exception.create('cannot login');
    end;
  end
  else if logintype='9' then begin
    session.query.fieldlist := 'i_user_id';
    session.query.tablelist := 'biz_remember';
    session.query.condition := 'i_sys_id='+inttostr(appid)+' and c_token='''+code+'''';
    session.query.open;
    uid := session.query.fieldbyname('i_user_id').asinteger;
    if not session.query.eof then begin
      session.update('biz_remember','d_last','i_sys_id='+inttostr(appid)+' and i_user_id='+inttostr(uid),[v]);
      session.query.FieldList := '*';
      session.query.TableList := 'biz_wxid';
      session.query.Condition := 'i_user_id='+inttostr(uid);
      session.QUERY.open;

      session.loginstate^.islogin:=1;
      session.loginstate^.uid:=session.query.fieldbyname('i_user_id').asinteger;
      s := session.query.fieldbyname('c_name').asstring;
      strcopy(@session.loginstate^.username[1],pchar(s));
      strcopy(@session.loginstate^.wxid[1],pchar(openid));
    end
    else begin
      raise exception.create('cannot login');
    end;

  end
  else begin
    raise exception.create('cannot login');
  end;
end;

procedure wxgetuserinfo(session: tbizsession; useropenid: string);
var
  idhttp1: tidhttp;
  IdSSLIOHandlerSocketOpenSSL1: tIdSSLIOHandlerSocketOpenSSL;
  strstream: tstringstream;
  js: TJsonObject;
  s,openid,nickname,sex,language,city,province,country,headimgurl: string;
  loctable: tbizlocaltable;
  url: string;
  userid: integer;
  langstr: string;
  P : TJSONParser;
begin
  js := nil;
  p := nil;
  try
    loctable := session.getlocaltable;
    idhttp1 := tidhttp.Create(nil);
    IdSSLIOHandlerSocketOpenSSL1 := tIdSSLIOHandlerSocketOpenSSL.Create(nil);
    strstream := tstringstream.Create('');
    idhttp1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    bizloginfo(session,'https://api.weixin.qq.com/cgi-bin/user/info?access_token='+session.wxaccesstoken+'&openid='+useropenid+'&lang=zh_CN');
    idhttp1.Get('https://api.weixin.qq.com/cgi-bin/user/info?access_token='+session.wxaccesstoken+'&openid='+useropenid+'&lang=zh_CN',strstream);
    s := strstream.datastring;
    bizloginfo(session,'get return :'+s);
    p := tjsonparser.create(s,[]);
    P.Options:=P.Options+[joStrict];
    js := tjsonobject(p.parse);
    openid := bizunquote(js.Get('openid',''));
    nickname := bizunquote(js.Get('nickname',''));
    sex := bizunquote(js.Get('sex'));
    language := bizunquote(js.Get('language',''));
    city := bizunquote(js.Get('city'));
    province := bizunquote(js.Get('province',''));
    country := bizunquote(js.Get('country',''));
    headimgurl := bizunquote(js.Get('headimgurl',''));

    if trim(useropenid)='' then tbizmessage.raiseerror(session.lang,0,1,'openid不能为空');
    bizloginfo(session,openid);
    session.query1.FieldList := '*';
    session.query1.TableList := 'biz_wxid';
    session.query1.Condition := 'c_wxid='''+useropenid+'''';
    session.QUERY1.open;
    session.QUERY1.duplicate(loctable);
    bizloginfo(session,'1');
    session.starttransaction;
    try
      if loctable.eof then begin
        userid := session.getglobalsequence(2000);
        bizloginfo(session,'2');
        loctable.Insert;
        bizloginfo(session,'21:'+inttostr(userid));
        loctable.FieldByName('i_user_id').AsInteger := userid;
        bizloginfo(session,'22');
        loctable.FieldByName('c_wxid').Asstring := useropenid;
        bizloginfo(session,'23');
        loctable.FieldByName('c_wxname').AsString := nickname;
        bizloginfo(session,'24');
        loctable.FieldByName('c_name').AsString := nickname;
        bizloginfo(session,'25');
        loctable.FieldByName('c_wxlang').AsString := language;
        bizloginfo(session,'3');
        loctable.FieldByName('i_wxsex').Asinteger := strtoint(sex);
        url := '';
        //loctable.FieldByName('c_wximg').AsString := url;
        loctable.FieldByName('c_wxcountry').AsString := country;
        loctable.FieldByName('c_wxsheng').AsString := province;
        loctable.FieldByName('c_wxcity').AsString := city;
        loctable.FieldByName('d_join').AsDateTime := now;
        loctable.FieldByName('d_leave').AsDateTime := 0;
        loctable.FieldByName('i_canchange').AsInteger := 3;
        loctable.FieldByName('i_subscript').AsInteger := 1;
        bizloginfo(session,'4');
        if language='en' then
          loctable.FieldByName('c_lang').AsString := 'en'
        else if language='zh_CN' then
          loctable.FieldByName('c_lang').AsString := 'zh'
        else if language='zh_TW' then
          loctable.FieldByName('c_lang').AsString := 'tr'
        else if language='ja' then
          loctable.FieldByName('c_lang').AsString := 'jp'
        else if language='ko' then
          loctable.FieldByName('c_lang').AsString := 'kr'
        else if language='fr' then
          loctable.FieldByName('c_lang').AsString := 'fr'
        else if language='de' then
          loctable.FieldByName('c_lang').AsString := 'de'
        else if language='ir' then
          loctable.FieldByName('c_lang').AsString := 'ir'
        else
          loctable.FieldByName('c_lang').AsString := 'en';

        loctable.FieldByName('c_lang').AsString := 'zh';
        bizloginfo(session,'5');
        loctable.Post;
        bizloginfo(session,'6');
      end
      else begin
        userid := loctable.FieldByName('i_user_id').AsInteger;
        loctable.edit;
        loctable.FieldByName('c_wxname').AsString := nickname;
        loctable.FieldByName('c_wxlang').AsString := language;
        loctable.FieldByName('i_wxsex').Asinteger := strtoint(sex);
        //url := tiduri.urldecode(headimgurl);
        url := '';
        //loctable.FieldByName('c_wximg').AsString := url;
        loctable.FieldByName('c_wxcountry').AsString := country;
        loctable.FieldByName('c_wxsheng').AsString := province;
        loctable.FieldByName('c_wxcity').AsString := city;
        loctable.FieldByName('d_join').AsDateTime := now;
        loctable.FieldByName('d_leave').AsDateTime := 0;
        if language='en' then
          loctable.FieldByName('c_lang').AsString := 'en'
        else if language='zh_CN' then
          loctable.FieldByName('c_lang').AsString := 'zh'
        else if language='zh_TW' then
          loctable.FieldByName('c_lang').AsString := 'tr'
        else if language='ja' then
          loctable.FieldByName('c_lang').AsString := 'jp'
        else if language='ko' then
          loctable.FieldByName('c_lang').AsString := 'kr'
        else if language='fr' then
          loctable.FieldByName('c_lang').AsString := 'fr'
        else if language='de' then
          loctable.FieldByName('c_lang').AsString := 'de'
        else if language='ir' then
          loctable.FieldByName('c_lang').AsString := 'ir'
        else
          loctable.FieldByName('c_lang').AsString := 'en';

        loctable.FieldByName('c_lang').AsString := 'zh';
        loctable.Post;
        session.Delete('biz_wxid','c_wxid='''+useropenid+'''');
      end;

      loctable.Edit;
      loctable.FieldByName('c_area').AsString := '北京';
      loctable.FieldByName('i_area').Asinteger := 91;
      loctable.post;

      langstr := loctable.FieldByName('c_lang').AsString;
      bizloginfo(session,'begore insert into biz_wxid');
      session.Insert(loctable,'biz_wxid','*');
      session.commit;
    except
      session.rollback;
      raise;
    end;
  finally
    freeandnil(p);
    IdSSLIOHandlerSocketOpenSSL1.Free;
    idhttp1.Free;
    strstream.free;
  end;

  session.setweblogin(useropenid,nickname,userid,langstr);
end;

function processnyj(session: tbizsession; const fromuser, content: string): string;
var
  i: integer;
  rq: tdatetime;
  pz,pzxz: string;
  j,k: Integer;
  v: variant;
  function getmarket(mkt: string): string;
  begin
    if pos('大洋路',mkt)>0 then result := '大洋路'
    else if pos('石门',mkt)>0 then result := '石门'
    else if pos('八里桥',mkt)>0 then result := '八里桥'
    else if pos('新发地',mkt)>0 then result := '新发地'
    else if pos('岳各庄',mkt)>0 then result := '岳各庄'
    else if pos('水屯',mkt)>0 then result := '水屯'
    else if pos('锦绣大地',mkt)>0 then result := '锦绣'
    else result := mkt;
  end;

  function displaydata(rq: tdatetime; pz: string): string;
  var
    vol,val: extended;
  begin
    //result := '(1)前一天 (2)后一天'+#$a+bizformatdatetime('yyyy-mm-dd',rq)+' '+pz+'（单位：元/公斤）';
    session.query.FieldList := '*';
    session.query.TableList := 'nyj_hq';
    session.query.Condition := 'd_date='+getsqldatetimetext(rq)+' and c_pz='''+pz+'''';
    session.query.Order := 'c_market';
    session.query.open;
    vol := 0;
    val := 0;
    while not session.query.eof do begin
      vol := vol+session.query.FieldByName('n_local').AsFloat+session.query.FieldByName('n_remote').AsFloat;
      val :=(session.query.FieldByName('n_local').AsFloat+session.query.FieldByName('n_remote').AsFloat)*session.query.FieldByName('n_avg').asfloat;
      session.query.next;
    end;

    result := bizformatdatetime('yyyy-mm-dd',rq)+' '+pz+'（单位：元/公斤）'+#$a+'市场名称';
    result := result+' '+'最高价';
    result := result+' '+'最低价';
    result := result+' '+'中间价';
    session.query.first;
    while not session.query.eof do begin
      result := result+#$a+fixedlen(getmarket(session.query.FieldByName('c_market').AsString),8)
        +' '+fixedlen(floattostr(bizround(session.query.FieldByName('n_max').asfloat,2)),6)
        +' '+fixedlen(floattostr(bizround(session.query.FieldByName('n_min').asfloat,2)),6)
        +' '+fixedlen(floattostr(bizround(session.query.FieldByName('n_avg').asfloat,2)),6);
      session.query.next;
    end;

    result := result+#$a+'----------------------'+#$a+'(1)前一天 (2)后一天';
    //consoleprint(applog,result);
  end;
begin
  result := '';
  session.query.FieldList := '*';
  session.query.TableList := 'nyj_wx';
  session.query.Condition := 'c_user='''+fromuser+'''';
  session.query.open();
  if session.query.eof then begin
    session.Insert('nyj_wx','c_user,i_curr,c_pz',[fromuser,0,'']);
  end;

  if content='' then begin
    result := '请输入品种！';
    exit;
  end;

  if content[1] in ['0'..'9'] then begin
    session.query.FieldList := '*';
    session.query.TableList := 'nyj_wx';
    session.query.Condition := 'c_user='''+fromuser+'''';
    session.query.open();
    if session.query.fieldbyname('i_curr').AsInteger=0 then begin
      result := '请输入品种！';
      exit;
    end
    // 选择品种
    else if session.query.FieldByName('i_curr').AsInteger=1 then begin
      i := pos('('+content[1]+')', session.query.FieldByName('c_pz').asstring);
      if i>0 then begin
        pz := '';
        pzxz := session.query.FieldByName('c_pz').asstring;
        k := length(pzxz);
        for j := i+3 to 100 do begin
          if j>k then break;
          if pzxz[j]=' ' then break;
          pz := pz+pzxz[j];
        end;

        session.query.FieldList := 'max(d_date)';
        session.query.TableList := 'nyj_hq';
        session.query.Condition := 'c_pz='''+pz+'''';
        session.query.open();
        rq := session.query.Fields[0].AsDateTime;
        v := rq;
        result := displaydata(rq,pz);
        session.Update('nyj_wx','d_date,c_pz,i_curr','c_user='''+fromuser+'''',[v,pz,2]);
      end
      else result := '请确认您要查询的农产品名称！';
    end
    // 1: 前一天，2：后一天
    else if session.query.FieldByName('i_curr').AsInteger=2 then begin
      pz := session.query.FieldByName('c_pz').asstring;
      rq := session.query.FieldByName('d_date').AsDateTime;
      if content[1]='1' then rq := rq-1
      else rq := rq+1;
      v := rq;
      result := displaydata(rq,pz);
      session.Update('nyj_wx','d_date,c_pz,i_curr','c_user='''+fromuser+'''',[v,pz,2]);
    end;

  end
  else begin
    session.query.FieldList := 'c_pz';
    session.query.TableList := 'nyj_pz';
    session.query.Order := 'c_pz';
    session.query.Condition := 'c_pz like ''%'+content+'%''';
    session.query.open();
    bizloginfo(session,'品种：'+inttostr(session.query.recordcount)+','+session.query.Condition);
    if session.query.RecordCount=0 then begin
      result := '请确认您要查询的农产品名称！';
      exit;
    end
    else if session.query.RecordCount=1 then begin
      pz := session.query.Fields[0].AsString;
      session.query.FieldList := 'max(d_date)';
      session.query.TableList := 'nyj_hq';
      session.query.Condition := 'c_pz='''+session.query.Fields[0].AsString+'''';
      session.query.open();
      rq := session.query.Fields[0].AsDateTime;
      v := rq;
      result := displaydata(rq,pz);
      session.Update('nyj_wx','d_date,c_pz,i_curr','c_user='''+fromuser+'''',[v,pz,2]);
    end
    else begin
      i := 0;
      while not session.query.eof do begin
        inc(i);
        if result='' then result := '('+inttostr(i)+')'+session.query.Fields[0].asstring
        else result := result+' '+'('+inttostr(i)+')'+session.query.Fields[0].asstring;
        session.query.next;
      end;

      session.Update('nyj_wx','c_pz,i_curr','c_user='''+fromuser+'''',[result,1]);
    end;
  end;
end;

function receivewxmsg_3(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  xml: TXMLDocument;
  node: TDOMNode;
  ss: tstringstream;
  fromuser,touser,content,eventname,welstr: string;
  i:integer;
begin
  //bizloginfo(session, 'path:'+path);
  //bizloginfo(session, 'query:'+query);
  //bizloginfo(session, 'param:'+param+','+inttostr(length(param)));
  //result := 'test';
  result := '';
  try
    try
      ss := tstringstream.create(param);
      ReadXMLFile(xml, ss);
      node := xml.DocumentElement.FindNode('FromUserName');
      if node<>nil then
        fromuser := node.TextContent
      else
        fromuser := '';

      node := xml.DocumentElement.FindNode('ToUserName');
      if node<>nil then
        touser := node.TextContent
      else
        touser := '';

      node := xml.DocumentElement.FindNode('Content');
      if node<>nil then
        content := node.TextContent
      else
        content := '';

      node := xml.DocumentElement.FindNode('Event');
      if node<>nil then
        eventname := node.TextContent
      else
        eventname := '';
    finally
      ss.free;
      xml.free;
    end;

    i := pos('<Content>',param);
    if i>0 then begin
      content := copy(param, i+9+9,1000);
      i := pos('</Content>',content);
      if i>0 then begin
        content := copy(content,1,i-1);
        content := stringreplace(content,'<!CDATA[','',[]);
        content := stringreplace(content,']]>','',[]);
      end
      else content := '';
    end;

    bizloginfo(session,'event:'+eventname+',content:'+content+',touser:'+touser+',fromuser:'+fromuser);
    if eventname='subscribe' then begin
      wxgetuserinfo(session,fromuser);
      bizloginfo(session,'after getuserinfo');
      if appid=2 then
        welstr := '感谢关注内蒙古电力市场公众号！'
      else
        welstr := '欢迎加入！';

      session.Update('biz_wxid','i_subscript','c_wxid='''+fromuser+'''',[1]);
      result := '<xml><ToUserName><![CDATA['
        +fromuser
        +']]></ToUserName><FromUserName><![CDATA['
        +touser
        +']]></FromUserName><CreateTime>'
        +inttostr(floor((now-encodedate(1970,1,1))*24*60*60))
        +'</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA['
        +welstr+']]></Content><FuncFlag>0<FuncFlag></xml>';
    end
    else if eventname='unsubscribe' then begin
      session.Update('biz_wxid','i_subscript','c_wxid='''+fromuser+'''',[0]);
    end
    else begin
      if appid=2 then begin
        welstr := 'test';
        result := '<xml><ToUserName><![CDATA['
          +fromuser
          +']]></ToUserName><FromUserName><![CDATA['
          +touser
          +']]></FromUserName><CreateTime>'
          +inttostr(floor((now-encodedate(1970,1,1))*24*60*60))
          +'</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA['
          +welstr+']]></Content><FuncFlag>0<FuncFlag></xml>';
      end
      else if appid=6 then begin
        welstr := processnyj(session,fromuser,content);
        result := '<xml><ToUserName><![CDATA['
          +fromuser
          +']]></ToUserName><FromUserName><![CDATA['
          +touser
          +']]></FromUserName><CreateTime>'
          +inttostr(floor((now-encodedate(1970,1,1))*24*60*60))
          +'</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA['
          +welstr+']]></Content><FuncFlag>0<FuncFlag></xml>';
      end
      else if appid=11 then begin
        //welstr := processnyj(session,fromuser,content);
        result := '<xml><ToUserName><![CDATA['
          +fromuser
          +']]></ToUserName><FromUserName><![CDATA['
          +touser
          +']]></FromUserName><CreateTime>'
          +inttostr(floor((now-encodedate(1970,1,1))*24*60*60))
          +'</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA['
          +welstr+']]></Content><FuncFlag>0<FuncFlag></xml>';
      end
      else
        result := '<xml><ToUserName><![CDATA['
          +fromuser
          +']]></ToUserName><FromUserName><![CDATA['
          +touser
          +']]></FromUserName><CreateTime>'
          +inttostr(floor((now-encodedate(1970,1,1))*24*60*60))
          +'</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA['
          +'您好！我是开发人员，欢迎加我微信Christopherli或电邮13801381127@139.com联系!]]></Content><FuncFlag>0<FuncFlag></xml>';
    end;
  except
    on e: exception do begin
      bizlogerror(session,'error:'+e.Message);
    end;
  end;

  bizloginfo(session,'end of 1-3,result:'+result);
end;

function testclient_4(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  lang: tbizlang;
  s: string;
begin
  s := session.readstring;
  lang := tbizlang(session.readint);
  bizloginfo(session,s+','+inttostr(integer(lang)));
  session.writeint(integer(lang));
  session.writestring('12345678901234567890');
  session.writeint(1);
  session.writedatetime(now);
  if session.variables['test']='' then session.variables['test'] := '1'
  else session.variables['test'] := inttostr(strtoint(session.variables['test'])+1);
  session.writestring(session.variables['test']);
  s := tbizmessage.getmsg(lang,1,$10,'ttt.txt');
  bizloginfo(session,s);
  session.writestring(s);
end;

function login_5(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  username,password: string;
  logintype: integer;
  lang: tbizlang;
  compid,needverify: integer;
begin
  logintype := session.readint;
  lang := tbizlang(session.readint);
  compid := session.readint;
  username := session.readstring;
  password := session.readstring;
  needverify := 0;
  if logintype=1 then
    session.login(lang,compid,username,password, needverify)
  else
    tbizmessage.raiseerror(lang, 0, 1);

  session.writeint(needverify);
  session.writeint(session.uid);
  session.writestring(session.compname);
  session.writestring(session.comptype);
  bizloginfo(session,'logintype:'+inttostr(logintype)+',compid: '+inttostr(compid)+', user: '+username+',uid:'+inttostr(session.uid));
end;

function openquery_6(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  FieldList,tablelist,condition,order,group,having: string;
  query1: tbizquery;
  openmode,limit,offset,reccount,i: integer;
  filename: string;
begin
  fieldlist := session.readstring;
  tablelist := session.readstring;
  condition := session.readstring;
  order := session.readstring;
  group := session.readstring;
  having := session.readstring;
  limit := session.readint; // 0 for read from begining
  if limit<0 then limit := 0;
  offset := session.readint; // 0 for read all
  if offset<0 then offset := 0;
  openmode := session.readint; // 0: struct+data,1:struct,2:data
  if condition='1=2' then limit := 1;
  query1 := session.getquery;
  //query1.FetchAll := true;
  query1.FieldList := fieldlist;
  query1.TableList := tablelist;
  query1.Condition := condition;
  query1.group := group;
  query1.Having := having;
  query1.Order := order;
  query1.limit := limit;
  query1.offset := offset;
  query1.open;
  filename := query1.savetofile;
  bizloginfo(session,query1.SQL.Text+','+filename+','+inttostr(query1.recordcount));
  session.writestring(filename);
end;

function getdbfile_7(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  filename: string;
  locpos,len: integer;
  filestream: tfilestream;
  eod: integer;
begin
  filename := bizstring(@serverparam^.tmppath[1])+session.readstring;
  locpos := session.readint;
  eod := 0;
  try
    filestream := tfilestream.Create(filename,fmOpenRead or fmShareDenyNone);
    if locpos>=filestream.size then exit;
    filestream.Position := locpos;
    len := filestream.size-locpos;
    if len>maxsendfileblock then len := maxsendfileblock
    else eod := 1;
    session.writeint(eod);
    session.writeint(len);
    session.writebuffer(filestream, len);
  finally
    filestream.free;
  end;

  if eod=1 then
    deletefile(filename);
end;

function getservertime_8(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
begin
  session.writedatetime(now);
end;

function getad_9(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  s: string;
begin
  session.query.FieldList := 'c_comp_name,i_status,c_lock_msg,i_fingerprint,c_comp_type';
  session.query.TableList := 'biz_company';
  session.query.Condition := 'i_comp_id='+inttostr(session.compid);
  session.query.open;
  if session.query.eof then
    raise tbizmessage.Create(1,'公司没有找到')
  else if session.query.Fields[1].AsInteger=1 then begin
    if session.query.Fields[2].AsString<>'' then raise tbizmessage.Create(1,'系统临时锁定：'+session.query.Fields[2].asstring)
    else raise tbizmessage.Create(1,'系统临时锁定，请联系管理员');
  end;
  s := '明润天成,http://www.ebizmis.com';
  //s := '';
  //,新浪财经,http://finance.sina.com.cn,搜狐财经,http://finance.sohu.com,QQ主页,http://www.qq.com';
    //+#$d#$a+'明润天成,http://www.ebizmis.com,盒子论坛,http://www.2ccc.com,PGSQL, http://www.postgresql.org'
    //+#$d#$a+'明润天成,http://www.ebizmis.com,盒子论坛,http://www.2ccc.com,PGSQL, http://www.postgresql.org';
  session.writestring(s);
  getbulletin_11(session,appid,path,query,param,redirecturl,retlen);
  session.query.FieldList := 'count(*)';
  session.query.TableList := 'biz_bbsdx';
  session.query.Condition := 'i_type=1 and i_comp_id1='+inttostr(session.compid)+' and i_user_id1='+inttostr(session.uid)+' and i_read=0';
  session.query.open();
  session.writeint(session.query.Fields[0].asinteger);
  session.writestring('bbstitle');
  session.writestring('bbsindustry');
  session.writestring('bbsbusiness');
end;

function checktaskright_10(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  path1,ugtable,righttable,s: string;
  sysid,folderid,funid,rights,i,filesize: integer;
  sysname, md5,foldername, funname,dllname,param1, assocfile: string;
  v: variant;
  found: boolean;
  str: tstringlist;
begin
  // input: taskpath(string)
  // output: dllname(string), md5(string)
  try
    str := tstringlist.create;
    path1 := session.readstring;
    dllname := '';
    delimitstring(path1, '/', str, true);
    //bizloginfo(session, path1+','+inttostr(str.count));
    if str.count>=1 then begin
      session.query.FieldList := 'i_sys_id';
      session.query.TableList := 'biz_system';
      session.query.Condition := 'c_name='''+str[0]+'''';
      session.query.open();
      if session.query.eof then raise tbizmessage.Create(1,'没有找到文件 '+path1);
      sysid := session.query.Fields[0].AsInteger;
      sysname := str[0];
    end
    else begin
      sysid := 0;
      sysname := '';
    end;

    foldername := '';
    folderid := 0;
    funname := '';
    funid := 0;
    if appid=7 then
      dllname := 'dwsjfb.dll'
    else
      dllname := 'bizhome.dll';

    param1 := '';
    //bizloginfo(session,'begin folder');
    if str.Count>1 then begin
      session.query.FieldList := 'i_folder_id';
      session.query.TableList := 'biz_folder';
      session.query.Condition := 'i_sys_id='+inttostr(sysid)+' and c_name='''+str[1]+'''';
      session.query.open();
      if session.query.eof then raise tbizmessage.Create(1,'没有找到文件 '+path1);
      foldername := str[1];
      folderid := session.query.Fields[0].AsInteger;
      dllname := 'bizfolder.dll';

      if str.Count>2 then begin
        session.query.FieldList := 'i_fun_id,c_dll,c_param,c_comp_type';
        session.query.TableList := 'biz_function';
        session.query.Condition := 'i_sys_id='+inttostr(sysid)+' and i_folder_id='+inttostr(folderid)+' and c_name='''+str[2]+'''';
        session.query.open();
        if session.query.eof then raise tbizmessage.Create(1,'没有找到文件 '+path1);
        if session.query.RecordCount=1 then begin
          funname := str[2];
          funid := session.query.Fields[0].AsInteger;
          dllname := lowercase(session.query.Fields[1].AsString);
          param1 := session.query.Fields[2].AsString;
        end
        else begin
          session.query.first;
          found := false;
          while not session.query.eof do begin
            if session.comptype=session.query.FieldByName('c_comp_type').asstring then begin
              funname := str[2];
              funid := session.query.Fields[0].AsInteger;
              dllname := lowercase(session.query.Fields[1].AsString);
              param1 := session.query.Fields[2].AsString;
              found := true;
              break;
            end;

            session.query.next;
          end;

          if not found then begin
            while not session.query.eof do begin
              if ''=trim(session.query.FieldByName('c_comp_type').asstring) then begin
                funname := str[2];
                funid := session.query.Fields[0].AsInteger;
                dllname := lowercase(session.query.Fields[1].AsString);
                param1 := session.query.Fields[2].AsString;
                found := true;
                break;
              end;

              session.query.next;
            end;
          end;
        end;
      end;
    end;

    //bizloginfo(session,'after folder');
    if session.uid=1 then rights := $ffffffff
    else if funid>0 then begin
      Session.Query.FieldList := 'i_right';
      Session.Query.TableList := session.getcomptable('funright');
      Session.Query.Condition := 'i_sys_id='+inttostr(session.appid)+' and i_folder_id='+inttostr(folderid)+' and i_fun_id='+inttostr(funid)+' and i_user_id='+inttostr(session.uid);
      Session.Query.Open;
      Rights := session.QUERY.fields[0].asinteger;
    end
    else rights := 0;

    //rights := 1;
    //bizloginfo(session,'check file');
    if fileexists(session.releasefilepath[appid]+dllname) then begin
      md5 := bizmd5file(session.releasefilepath[appid]+dllname);
      filesize := bizfilesize(session.releasefilepath[appid]+dllname);
    end
    else begin
      md5 := '';
      filesize := 0;
    end;

    //bizloginfo(session,'md5:'+md5+','+session.releasefilepath[appid]+dllname);
    //session.query.fieldlist := '*';
    //session.query.tablelist := 'biz_function';
    //session.query.condition := 'i_sys_id='+inttostr(session.appid)+' and c_dll='''+dllname+'''';
    //session.query.open;
    //if not session.query.eof then begin
    //  md5 := '';//session.query.FieldByName('c_dll').AsString+'='+session.query.FieldByName('c_md5').AsString+'='+session.query.FieldByName('i_filesize').Asstring;
    //  assocfile := '';//session.query.FieldByName('c_assoc_dll').AsString;
    //end
    //else
    //  assocfile := '';

    session.writestring(param1);
    session.writestring(dllname);
    session.writestring(md5);
    session.writeint(filesize);
    session.writeint(rights);
    session.writestring(sysname);
    session.writestring(foldername);
    session.writestring(funname);
    session.writeint(sysid);
    session.writeint(folderid);
    session.writeint(funid);
    v := now;
    if funid<>0 then begin
      try
        session.Insert('biz_auditlog','i_comp_id,d_time,i_user_id,i_sys_id,i_folder_id,i_func_id,c_username,c_function',
          [session.compid,v,session.uid,session.appid,folderid,funid,session.username,path1]);
      except
        v := now+1/3600/24;
        session.Insert('biz_auditlog','i_comp_id,d_time,i_user_id,i_sys_id,i_folder_id,i_func_id,c_username,c_function',
          [session.compid,v,session.uid,session.appid,folderid,funid,session.username,path1]);
      end;
    end;
  finally
    str.free;
  end;
end;

function getbulletin_11(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
begin
  session.query.FieldList := 'c_content,d_finish';
  session.query.TableList := 'biz_bulletin';
  session.query.Condition := 'i_sys_id='+inttostr(session.appid)+' and d_finish>'+getsqldatetimetext(now);
  session.query.Order := 'd_finish';
  session.query.limit := 1;
  session.query.open();
  session.writestring(session.query.Fields[0].asstring);
end;

function execsql_12(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  i,j: integer;
  needcommit: boolean;
  sql: ansistring;
begin
  i := session.readint;
  if not session.intransaction then begin
    session.starttransaction;
    needcommit := true;
  end
  else
    needcommit := false;

  try
    for j := 1 to i do begin
      sql := session.readstring;
      session.execsql(sql);
    end;

    if needcommit then
      session.commit;
  except
    if needcommit then
      session.rollback;

    raise;
  end;
end;

function exists_13(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  tablename,condition: string;
  query1: tbizquery;
begin
  tablename := session.readstring;
  condition := session.readstring;
  try
    query1 := session.getquery;
    query1.FieldList := '*';
    query1.Condition := condition;
    query1.tablelist := tablename;
    query1.limit := 0;
    query1.open();
    if not query1.eof then session.writeint(1)
    else session.writeint(0);
  finally
  end;
end;

function getsequence_14(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  seq,seqid: integer;
begin
  seqid := session.readint;
  seq := session.getsequence(seqid);
  session.writeint(seq);
end;

function committrx_15(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  sqlcount: integer;
  i: integer;
  s: string;
begin
  session.starttransaction;
  try
    sqlcount := session.readint;
    for i := 1 to sqlcount do begin
      s := session.readstring;
      session.execsql(s);
    end;

    session.commit;
  except
    session.rollback;
    raise;
  end;
end;

procedure inserttmpuser(session: tbizsession; compid: integer; email,confirm,password: string);
var
  pref,s: string;
  function getpassword: string;
  var
    buf: array[1..64] of char;
    s: ansistring;
    i: Integer;
  begin
    for i := 1 to length(password) do begin
      buf[i] := password[i];
    end;

    buf[length(password)+1] := #$0;
    for i := length(password)+2 to 64 do begin
      buf[i] := #$ff;
    end;

    bizencrypt($46d8d231,$8f7e51ac,@buf[1],64);
    result := chartostring(@buf[1],64);
  end;
begin
  s := 'insert into biz_tmpuser(i_comp_id,c_name,c_fullname,c_password,c_confirmcode,c_email)'
    +' values('+inttostr(compid)+',''admin'',''管理员'','+getsqltext(getpassword)+','+getsqltext(confirm)+','+getsqltext(email)+')';
  session.execsql(s);
end;

procedure initsubsystemdb(session: tbizsession);
var
  pref,s: string;
  i: Integer;
begin
  if session.compid=0 then
    pref := 'biz_'
  else
    pref := 'Z'+trim(format('%8x_',[session.compid]));

  case session.appid of
    2: //gl
      begin
        try
          session.execsql('drop table '+pref+'glremark');
        except
        end;

        s := 'CREATE TABLE '+pref+'glremark(I_BOOK_ID INT,'
	        +'C_REMARK VARCHAR(200),'
	        +'CONSTRAINT P_'+pref+'GLREMARK PRIMARY KEY(I_BOOK_ID,C_REMARK) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'gllog');
        except
        end;

        s := 'CREATE TABLE '+pref+'gllog(I_BOOK_ID INT,'
	        +'C_BOOK_NAME VARCHAR(100),'
	        +'I_YEAR INT,'
	        +'I_MONTH INT,'
	        +'D_PROCESS TIMESTAMP,'
	        +'C_PROCESS VARCHAR(50),'
	        +'CONSTRAINT P_'+pref+'GLLOG PRIMARY KEY(I_BOOK_ID,I_YEAR,I_MONTH) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'glcodehs');
        except
        end;

        s := 'CREATE TABLE '+pref+'glcodehs(I_KJZD_ID INT,'
	        +'C_CODE VARCHAR(20),'
	        +'C_HS VARCHAR(200),'
	        +'I_HSDC INT,'
          +'CONSTRAINT P_'+pref+'GLCODEHS PRIMARY KEY(I_KJZD_ID,C_CODE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'glvh');
        except
        end;

        s := 'CREATE TABLE '+pref+'glvh(I_BOOK_ID INT,'
        	+'I_VH_ID INT,'
        	+'I_YEARMONTH INT,'
        	+'I_VSEQ INT,'
        	+'D_DATE TIMESTAMP,'
        	+'C_REF_NO VARCHAR(32),'
        	+'I_EVTNO INT,'
        	+'I_REVVH_ID INT,'
        	+'I_REVERSED INT,'
        	+'C_MAKER VARCHAR(32),'
        	+'D_MAKER TIMESTAMP,'
        	+'C_CHECKER VARCHAR(32),'
        	+'D_CHECKER TIMESTAMP,'
        	+'C_POST VARCHAR(32),'
        	+'D_POST TIMESTAMP,'
        	+'C_CASHIER VARCHAR(32),'
        	+'C_STEP VARCHAR(10),'
        	+'I_ATTACH INT,'
        	+'I_TYPE INT,'
          +'I_TEMP_TYPE INT,'
          +'I_TEMP_ID INT,'
        	+'N_AMOUNT NUMERIC(18,2),'
          +'C_TEXT VARCHAR(500),'
          +'C_PIC VARCHAR(200),'
          +'CONSTRAINT P_'+pref+'GLVH PRIMARY KEY(I_VH_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        s := 'CREATE INDEX I01_'+pref+'GLVH ON '+pref+'GLVH(I_BOOK_ID,I_YEARMONTH,I_VSEQ) TABLESPACE '+session.getindextablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'glpic');
        except
        end;

        s := 'CREATE TABLE '+pref+'glpic(I_BOOK_ID INT,'
        	+'I_YEARMONTH INT,'
        	+'I_PIC_ID INT,'
        	+'I_SIZE INT,'
        	+'C_NAME VARCHAR(100),'
        	+'C_DESC VARCHAR(100),'
        	+'D_UPLOAD TIMESTAMP,'
        	+'I_VH_ID INT,'
        	+'I_VH_YEARMONTH INT,'
          +'CONSTRAINT P_'+pref+'GLPIC PRIMARY KEY(I_PIC_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        s := 'CREATE INDEX U01_'+pref+'GLPIC ON '+pref+'GLPIC(I_BOOK_ID,I_YEARMONTH,I_PIC_ID) TABLESPACE '+session.getindextablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'glvhitem');
        except
        end;

        s := 'CREATE TABLE '+pref+'glvhitem(I_BOOK_ID INT,'
        	+'I_VH_ID INT,'
        	+'I_YEARMONTH INT,'
        	+'D_DATE TIMESTAMP,'
        	+'I_VSEQ INT,'
        	+'I_ITEM_ID INT,'
        	+'I_SEQ INT,'
        	+'C_CODE VARCHAR(20),'
        	+'C_FULLNAME VARCHAR(200),'
        	+'I_DC INT,'
        	+'N_DR NUMERIC(18,2),'
        	+'N_CR NUMERIC(18,2),'
        	+'C_OTHER_REF VARCHAR(32),'
        	+'C_HS_INFO VARCHAR(200),'
        	+'C_REMARKS VARCHAR(200),'
        	+'C_CHEQUE VARCHAR(20),'
        	+'C_INVOICE VARCHAR(20),'
        	+'I_TYPE INT,'
	        +'C_HS_1 VARCHAR(50),'
	        +'C_HS_2 VARCHAR(50),'
	        +'C_HS_3 VARCHAR(50),'
	        +'C_HS_4 VARCHAR(50),'
	        +'C_HS_5 VARCHAR(50),'
	        +'C_HS_6 VARCHAR(50),'
	        +'C_HS_7 VARCHAR(50),'
	        +'C_HS_8 VARCHAR(50),'
	        +'C_HS_9 VARCHAR(50),'
	        +'C_HS_10 VARCHAR(50),'
	        +'C_HS_11 VARCHAR(50),'
	        +'C_HS_12 VARCHAR(50),'
	        +'C_HS_13 VARCHAR(50),'
	        +'C_HS_14 VARCHAR(50),'
          +'C_HS_15 VARCHAR(50),'
	        +'C_HS_16 VARCHAR(50),'
          +'CONSTRAINT P_'+pref+'GLVHITEM PRIMARY KEY(I_VH_ID,I_SEQ) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);
        s := 'CREATE INDEX I01_'+pref+'GLVHITEM ON '+pref+'GLVHITEM(I_BOOK_ID,D_DATE,I_VH_ID) TABLESPACE '+session.getindextablespace;
        session.execsql(s);
        s := 'CREATE INDEX I02_'+pref+'GLVHITEM ON '+pref+'GLVHITEM(I_BOOK_ID,I_YEARMONTH,I_VH_ID) TABLESPACE '+session.getindextablespace;
        session.execsql(s);
        s := 'CREATE INDEX I03_'+pref+'GLVHITEM ON '+pref+'GLVHITEM(I_BOOK_ID,I_TYPE,I_YEARMONTH,I_VH_ID) TABLESPACE '+session.getindextablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'glgdzc');
        except
        end;

        s := 'CREATE TABLE '+pref+'glgdzc(I_SUBCOMP_ID INT,'
	        +'C_REF_NO VARCHAR(20),'
	        +'I_TYPE INT,'
	        +'C_TYPE VARCHAR(50),'
	        +'C_NAME VARCHAR(100),'
	        +'C_DEPT VARCHAR(50),'
	        +'D_BUY TIMESTAMP,'
	        +'D_TRX TIMESTAMP,'
	        +'I_YEAR INT,'
	        +'I_MONTH INT,'
	        +'I_TOTALMONTH INT,'
	        +'N_PRICE NUMERIC(18,2),'
	        +'I_CZL INT,'
	        +'N_CZ NUMERIC(18,2),'
	        +'I_USEDMONTH INT,'
	        +'N_YZJ NUMERIC(18,2),'
	        +'N_VALUE NUMERIC(18,2),'
	        +'N_YUEZJ NUMERIC(18,2),'
	        +'I_STATUS INT,'
          +'CONSTRAINT P_'+pref+'GLGDZC PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'glgdzclog');
        except
        end;

        s := 'CREATE TABLE '+pref+'glgdzclog(I_SUBCOMP_ID INT,'
        	+'C_REF_NO VARCHAR(20),'
        	+'I_YEAR INT,'
        	+'I_MONTH INT,'
        	+'I_TYPE INT,'
        	+'C_TYPE VARCHAR(50),'
        	+'C_DEPT VARCHAR(50),'
        	+'N_PRICE NUMERIC(18,2),'
        	+'I_CZL INT,'
        	+'N_CZ NUMERIC(18,2),'
        	+'N_YZJ NUMERIC(18,2),'
        	+'N_VALUE NUMERIC(18,2),'
        	+'N_YUEZJ NUMERIC(18,2),'
        	+'N_CURRZJ NUMERIC(18,2),'
        	+'I_USEDMONTH INT,'
        	+'I_TOTALMONTH INT,'
          +'CONSTRAINT P_'+pref+'GLGDZCLOG PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO,I_YEAR,I_MONTH) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'gltemplate');
        except
        end;

        s := 'CREATE TABLE '+pref+'gltemplate(I_TEMP_ID INT,'
        	+'I_TYPE INT,'
        	+'C_FL VARCHAR(50),'
        	+'C_NAME VARCHAR(200),'
        	+'C_DESC VARCHAR(200),'
        	+'CONSTRAINT P_'+pref+'GLTEMPLATE PRIMARY KEY(I_TEMP_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'gltemplateitem');
        except
        end;

        s := 'CREATE TABLE '+pref+'gltemplateitem(I_TEMP_ID INT,'
        	+'I_SEQ INT,'
        	+'C_CODE VARCHAR(20),'
        	+'C_FULLNAME VARCHAR(200),'
        	+'C_REMARKS VARCHAR(200),'
        	+'I_DC INT,'
        	+'N_DR NUMERIC(18,2),'
        	+'N_CR NUMERIC(18,2),'
        	+'CONSTRAINT P_'+pref+'GLTEMPLATEITEM PRIMARY KEY(I_TEMP_ID,I_SEQ) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'gltemplateshortcut');
        except
        end;

        s := 'CREATE TABLE '+pref+'gltemplateshortcut(I_BOOK_ID INT,'
          +'I_VH_ID INT,'
          +'I_YEARMONTH INT,'
          +'I_VSEQ INT,'
          +'I_TEMP_ID INT,'
          +'C_NAME VARCHAR(200),'
          +'C_REMARKS VARCHAR(200),'
          +'C_TEXT VARCHAR(500),'
        	+'CONSTRAINT P_'+pref+'gltemplateshortcut PRIMARY KEY(I_BOOK_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'glbal');
        except
        end;

        s := 'CREATE TABLE '+pref+'glbal(I_BOOK_ID INT,'
        	+'I_YEAR INT,'
        	+'I_MONTH INT,'
        	+'C_CODE VARCHAR(20),'
        	+'I_INIT_DC INT,'
        	+'N_INIT NUMERIC(18,2),'
        	+'N_DR NUMERIC(18,2),'
        	+'N_CR NUMERIC(18,2),'
        	+'I_DC INT,'
        	+'N_BAL NUMERIC(18,2),'
        	+'CONSTRAINT P_'+pref+'GLBAL PRIMARY KEY(I_BOOK_ID,I_YEAR,I_MONTH,C_CODE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'glhsbal');
        except
        end;

        s := 'CREATE TABLE '+pref+'glhsbal(I_BOOK_ID INT,'
        	+'I_YEAR INT,'
        	+'I_MONTH INT,'
        	+'C_CODE VARCHAR(20),'
        	+'I_HS_ID INT,'
        	+'C_HS_CODE VARCHAR(12),'
        	+'C_HS VARCHAR(50),'
        	+'I_INIT_DC INT,'
        	+'N_INIT NUMERIC(18,2),'
        	+'N_DR NUMERIC(18,2),'
        	+'N_CR NUMERIC(18,2),'
        	+'I_DC INT,'
        	+'N_BAL NUMERIC(18,2),'
        	+'CONSTRAINT P_'+pref+'GLHSBAL PRIMARY KEY(I_BOOK_ID,I_YEAR,I_MONTH,C_CODE,I_HS_ID,C_HS) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);
      end;
    3:
      begin
        try
          session.execsql('drop table '+pref+'ncphqzt');
        except
        end;

        s := 'CREATE TABLE '+pref+'NCPHQZT(I_COMP_ID INT,'
	        +'I_SUBCOMP_ID INT,'
	        +'D_DATE TIMESTAMP,'
	        +'D_TIME TIMESTAMP,'
	        +'C_USER VARCHAR(50),'
	        +'C_DW VARCHAR(50),'
	        +'I_STATUS INT,'
	        +'CONSTRAINT P_'+pref+'NCPHQZT PRIMARY KEY(I_COMP_ID,I_SUBCOMP_ID,D_DATE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'ncphq');
        except
        end;

        s := 'CREATE TABLE '+pref+'NCPHQ(I_COMP_ID INT,'
          +'I_SUBCOMP_ID INT,'
          +'D_DATE TIMESTAMP,'
          +'I_PZ_ID INT,'
          +'I_FL INT,'
          +'C_PZ VARCHAR(50),'
          +'I_SEQ INT,'
          +'N_MAX NUMERIC(8,2),'
          +'N_MIN NUMERIC(8,2),'
          +'N_AVG NUMERIC(8,2),'
          +'N_BD NUMERIC(10,2),'
          +'N_WD NUMERIC(10,2),'
          +'N_SSL NUMERIC(10,2),'
          +'C_ZCD VARCHAR(100),'
          +'CONSTRAINT P_'+pref+'NCPHQ PRIMARY KEY(I_COMP_ID,I_SUBCOMP_ID,D_DATE,I_PZ_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);
        s := 'CREATE UNIQUE INDEX U01_'+pref+'NCPHQ ON '+pref+'NCPHQ(I_COMP_ID,I_SUBCOMP_ID,D_DATE,I_FL,I_SEQ)';
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'ncpbspz');
        except
        end;

        s := 'CREATE TABLE '+pref+'NCPBSPZ(I_COMP_ID INT,'
	        +'I_SUBCOMP_ID INT,'
	        +'I_FL INT,'
	        +'I_PZ_ID INT,'
	        +'I_SEQ INT,'
	        +'C_PZ VARCHAR(50),'
	        +'CONSTRAINT P_'+pref+'NCPBSPZ PRIMARY KEY(I_COMP_ID,I_SUBCOMP_ID,I_PZ_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'ncpxspz');
        except
        end;

        s := 'CREATE TABLE '+pref+'NCPXSPZ(I_COMP_ID INT,'
          +'I_FL INT,'
          +'I_PZ_ID INT,'
          +'I_SEQ INT,'
          +'C_PZ VARCHAR(50),'
          +'CONSTRAINT P_'+pref+'NCPXSPZ PRIMARY KEY(I_COMP_ID,I_PZ_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'NCPSELECTPZ');
        except
        end;

        s := 'CREATE TABLE '+pref+'NCPSELECTPZ(I_SELECT_ID INT,'
          +'C_NAME VARCHAR(100),'
          +'M_SELECT TEXT,'
          +'CONSTRAINT P_'+pref+'NCPSELECTPZ PRIMARY KEY(I_SELECT_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);
      end;
    4: //fengdian
      begin
        // from 8
        try
          session.execsql('drop table '+pref+'FDXIANLU');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDXIANLU(I_SUBCOMP_ID INT,'
          +'I_SEQ INT,'
	        +'C_NAME VARCHAR(50),'
          +'CONSTRAINT P_'+pref+'FDXIANLU PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'FDFENGJI');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDFENGJI(I_SUBCOMP_ID INT,'
	        +'I_FJ_ID INT,'
	        +'C_NAME VARCHAR(50),'
	        +'C_BRAND VARCHAR(50),'
	        +'C_ID VARCHAR(50),'
	        +'C_POSITION VARCHAR(50),'
	        +'C_DJ VARCHAR(50),'
	        +'C_WD VARCHAR(50),'
	        +'C_XL1 VARCHAR(50),'
	        +'C_XL2 VARCHAR(50),'
	        +'N_RL NUMERIC(10,2),'
	        +'D_TOUYONG TIMESTAMP,'
	        +'C_GLFJ1 VARCHAR(50),'
	        +'C_GLFJ2 VARCHAR(50),'
	        +'C_GLFJ3 VARCHAR(50),'
	        +'I_GLQX INT,'
	        +'C_STATUS VARCHAR(10),'
          +'CONSTRAINT P_'+pref+'FDFENGJI PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'FDGLQX');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDGLQX(I_SUBCOMP_ID INT,'
          +'I_FJ_ID INT,'
          +'N_FS1 NUMERIC(10,3),'
          +'N_FS2 NUMERIC(10,3),'
          +'N_JZFS NUMERIC(10,3),'
          +'N_GL NUMERIC(10,3),'
          +'CONSTRAINT P_'+pref+'FDGLQX PRIMARY KEY(I_SUBCOMP_ID,I_FJ_ID,N_FS1,N_FS2) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        s := 'CREATE TABLE '+pref+'FDFJQX(I_SUBCOMP_ID INT,'
          +'I_FJ_ID INT,'
	        +'D_DATE TIMESTAMP,'
          +'N_FS1 NUMERIC(10,3),'
          +'N_FS2 NUMERIC(10,3),'
          +'N_GL NUMERIC(10,3),'
          +'N_GLSJ NUMERIC(18,3),'
	        +'N_SJ NUMERIC(18,3),'
          +'CONSTRAINT P_'+pref+'FDFJQX PRIMARY KEY(I_SUBCOMP_ID,I_FJ_ID,D_DATE,N_FS1,N_FS2) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'FDRB');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDRB(I_SUBCOMP_ID INT,'
          +'I_FJ_ID INT,'
          +'C_FDFJ VARCHAR(10),'
          +'C_NAME VARCHAR(50),'
          +'D_DATE TIMESTAMP,'
          +'N_FDL NUMERIC(15,3),'// --MWh
          +'N_XHDL NUMERIC(15,2),'// --kWh
          +'N_ZDYG NUMERIC(15,2),'// -- kW
          +'C_ZDYG_SJ VARCHAR(20),'
          +'N_ZXYG NUMERIC(15,2),'// -- kW
          +'C_ZXYG_SJ VARCHAR(20),'
          +'N_ZJFS NUMERIC(15,2),'// --m/s*s
          +'N_ZJFSSJ INT,'// -- s
          +'N_PJFS NUMERIC(6,2),'// --m/s
          +'N_ZDFS NUMERIC(6,2),'// --m/s
          +'C_ZDFS_SJ VARCHAR(20),'
          +'N_ZXFS NUMERIC(6,2),'// --m/s
          +'C_ZXFS_SJ VARCHAR(20),'
          +'N_ZJWD NUMERIC(15,2),'// --度*s
          +'N_ZJWDSJ INT,'// -- s
          +'N_PJWD NUMERIC(6,2),'
          +'N_ZDWD NUMERIC(6,2),'
          +'C_ZDWD_SJ VARCHAR(20),'
          +'N_ZXWD NUMERIC(6,2),'
          +'C_ZXWD_SJ VARCHAR(20),'

          +'N_GZSJ NUMERIC(15,2),'// --h
          +'N_WHSJ NUMERIC(15,2),'// --h
          +'N_XDSJ NUMERIC(15,2),'// --h
          +'N_FDSJ NUMERIC(15,2),'// --h
          +'N_XTZCSJ NUMERIC(15,2),'// --h

          +'N_KYL NUMERIC(6,2),'// --% (总发电时间+维护时间+限电时间)/(总发电时间+维护时间+故障时间+限电时间)
          +'N_QFL NUMERIC(6,2),'// --% 弃风率
          +'N_LYXS NUMERIC(15,2),'// --h
          +'N_QFDL NUMERIC(15,3),'//
          +'N_GZQFDL NUMERIC(15,3),'//
          +'N_WHQFDL NUMERIC(15,3),'//
          +'N_XDQFDL NUMERIC(15,3),'//
          +'CONSTRAINT P_'+pref+'FDRB PRIMARY KEY(D_DATE,I_SUBCOMP_ID,I_FJ_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'FDQX');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDQX(I_SUBCOMP_ID INT,'
          +'D_DATE TIMESTAMP,';

        for i := 1 to 288 do begin
          s := s+'N_'+inttostr(i)+' NUMERIC(10,2),I_'+inttostr(i)+' INT,';
        end;

        s := s +'CONSTRAINT P_'+pref+'FDQX PRIMARY KEY(I_SUBCOMP_ID,D_DATE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);
        // end
        try
          session.execsql('drop table '+pref+'bpbjlog');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJLOG(I_SUBCOMP_ID INT,'
	        +'C_SUBCOMP_NAME VARCHAR(100),'
	        +'I_YEAR INT,'
	        +'I_MONTH INT,'
	        +'D_PROCESS TIMESTAMP,'
      	  +'C_PROCESS VARCHAR(50),'
        +'CONSTRAINT P_'+pref+'BPBJLOG PRIMARY KEY(I_SUBCOMP_ID,I_YEAR,I_MONTH) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjyyjlog');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJYYJLOG(I_SUBCOMP_ID INT,'
	        +'I_SEQ INT,'
          +'M_LINE TEXT,'
          +'CONSTRAINT P_'+pref+'BPBJYYJLOG PRIMARY KEY(I_SUBCOMP_ID,I_SEQ) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjcode');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJCODE(C_CODE VARCHAR(20),'
	        +'C_PARENT_CODE VARCHAR(20),'
	        +'I_LEVEL INT,'
	        +'I_TYPE INT,'
	        +'C_NAME VARCHAR(50),'
	        +'C_PYNAME VARCHAR(30),'
	        +'C_XH VARCHAR(50),'
	        +'C_PYXH VARCHAR(30),'
	        +'C_FL VARCHAR(50),'
	        +'C_FOLDER VARCHAR(50),'
	        +'C_FULLFOLDER VARCHAR(200),'
	        +'C_UNIT VARCHAR(10),'
          +'N_HJCZ NUMERIC(12,2),'
          +'CONSTRAINT P_'+pref+'BPBJCODE PRIMARY KEY(C_CODE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjcodeprop');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJCODEPROP(I_SUBCOMP_ID INT,'
	        +'C_CODE VARCHAR(50),'
	        +'C_PLACE VARCHAR(100),'
	        +'I_WARNING INT,'
          +'CONSTRAINT P_'+pref+'BPBJCODEPROP PRIMARY KEY(I_SUBCOMP_ID,C_CODE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjbal');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJBAL(I_SUBCOMP_ID INT,'
	        +'C_CODE VARCHAR(50),'
	        +'I_YEAR INT,'
	        +'I_MONTH INT,'
	        +'I_COUNT INT,'
	        +'N_PRICE NUMERIC(14,6),'
	        +'N_AMOUNT NUMERIC(14,2),'
	        +'I_FX_COUNT INT,'
	        +'N_FX_PRICE NUMERIC(14,6),'
	        +'N_FX_AMOUNT NUMERIC(14,2),'
	        +'I_HJ_COUNT INT,'
	        +'N_HJ_PRICE NUMERIC(14,6),'
	        +'N_HJ_AMOUNT NUMERIC(14,2),'
	        +'I_CURR_COUNT INT,'
	        +'N_CURR_PRICE NUMERIC(14,6),'
	        +'N_CURR_AMOUNT NUMERIC(14,2),'
	        +'I_CURRFX_COUNT INT,'
	        +'N_CURRFX_PRICE NUMERIC(14,6),'
	        +'N_CURRFX_AMOUNT NUMERIC(14,2),'
	        +'I_CURRHJ_COUNT INT,'
	        +'N_CURRHJ_PRICE NUMERIC(14,6),'
	        +'N_CURRHJ_AMOUNT NUMERIC(14,2),'
          +'CONSTRAINT P_'+pref+'BPBJBAL PRIMARY KEY(I_SUBCOMP_ID,C_CODE,I_YEAR,I_MONTH) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjdd');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJDD(C_REF_NO VARCHAR(20),'
          +'C_PROVIDER VARCHAR(50),'
        	+'I_DEST_SUBCOMP INT,'
          +'C_DEST_SUBCOMP VARCHAR(100),'
	        +'C_REMARKS VARCHAR(100),'
	        +'N_AMOUNT NUMERIC(14,2),'
          +'N_RKAMOUNT NUMERIC(14,2),'
	        +'D_TRX TIMESTAMP,'
	        +'D_SAVE TIMESTAMP,'
          +'C_SAVE VARCHAR(50),'
          +'CONSTRAINT P_'+pref+'BPBJDD PRIMARY KEY(C_REF_NO) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjddmx');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJDDMX(C_REF_NO VARCHAR(20),'
	        +'I_SEQ INT,'
	        +'C_PRODCODE VARCHAR(20),'
	        +'C_PRODNAME VARCHAR(50),'
	        +'C_PRODXH VARCHAR(50),'
	        +'C_PRODUNIT VARCHAR(10),'
	        +'I_COUNT INT,'
	        +'N_PRICE NUMERIC(14,6),'
	        +'N_AMOUNT NUMERIC(14,2),'
	        +'C_REMARKS VARCHAR(100),'
	        +'I_RKCOUNT INT,'
	        +'N_RKAMOUNT NUMERIC(14,2),'
          +'CONSTRAINT P_'+pref+'BPBJDDMX PRIMARY KEY(C_REF_NO,C_PRODCODE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjck');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJCK(I_SUBCOMP_ID INT,'
	        +'C_SUBCOMP_NAME VARCHAR(100),'
	        +'C_REF_NO VARCHAR(20),'
	        +'I_THEIR_SUBCOMP INT,'
	        +'C_THEIR_SUBCOMP VARCHAR(100),'
	        +'C_THEIR_REFNO VARCHAR(20),'
	        +'C_TYPE VARCHAR(20),'
          +'C_PROVIDER VARCHAR(50),'
          +'C_DEPT VARCHAR(50),'
          +'I_DEST_SUBCOMP INT,'
          +'C_DEST_SUBCOMP VARCHAR(100),'
          +'C_DEST_DEVICE VARCHAR(50),'
          +'C_SBZT VARCHAR(10),'
	        +'I_PROV_BOOK INT,'
	        +'C_REMARKS VARCHAR(100),'
	        +'C_MBSB VARCHAR(50),'
	        +'C_STEP VARCHAR(10),'
	        +'N_AMOUNT NUMERIC(14,2),'
	        +'D_TRX TIMESTAMP,'
	        +'D_SAVE TIMESTAMP,'
          +'C_SAVE VARCHAR(50),'
	        +'D_CHECK TIMESTAMP,'
	        +'C_CHECK VARCHAR(50),'
          +'CONSTRAINT P_'+pref+'BPBJCK PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjckmx');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJCKMX(I_SUBCOMP_ID INT,'
	        +'C_REF_NO VARCHAR(20),'
	        +'I_SEQ INT,'
	        +'C_PRODCODE VARCHAR(20),'
	        +'C_PRODNAME VARCHAR(50),'
	        +'C_PRODXH VARCHAR(50),'
	        +'C_PRODUNIT VARCHAR(10),'
	        +'I_COUNT INT,'
	        +'N_PRICE NUMERIC(14,6),'
	        +'N_AMOUNT NUMERIC(14,2),'
	        +'C_REMARKS VARCHAR(100),'
          +'CONSTRAINT P_'+pref+'BPBJCKMX PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO,C_PRODCODE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjrk');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJRK(I_SUBCOMP_ID INT,'
	        +'C_SUBCOMP_NAME VARCHAR(100),'
	        +'C_REF_NO VARCHAR(20),'
	        +'I_THEIR_SUBCOMP INT,'
	        +'C_THEIR_SUBCOMP VARCHAR(100),'
	        +'C_THEIR_REFNO VARCHAR(20),'
	        +'C_TYPE VARCHAR(20),'
	        +'C_STEP VARCHAR(10),'
          +'C_PROVIDER VARCHAR(50),'
          +'I_PROV_BOOK INT,'
	        +'C_REMARKS VARCHAR(100),'
	        +'N_AMOUNT NUMERIC(14,2),'
	        +'N_SHUI NUMERIC(14,2),'
	        +'D_TRX TIMESTAMP,'
	        +'D_SAVE TIMESTAMP,'
          +'C_SAVE VARCHAR(50),'
	        +'D_CHECK TIMESTAMP,'
	        +'C_CHECK VARCHAR(50),'
          +'CONSTRAINT P_'+pref+'BPBJRK PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjrkmx');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJRKMX(I_SUBCOMP_ID INT,'
	        +'C_REF_NO VARCHAR(20),'
	        +'I_SEQ INT,'
	        +'C_PRODCODE VARCHAR(20),'
	        +'C_PRODNAME VARCHAR(50),'
	        +'C_PRODXH VARCHAR(50),'
	        +'C_PRODUNIT VARCHAR(10),'
	        +'I_COUNT INT,'
	        +'N_PRICE NUMERIC(14,6),'
	        +'N_AMOUNT NUMERIC(14,2),'
	        +'N_SHUI NUMERIC(14,2),'
	        +'C_REMARKS VARCHAR(100),'
          +'CONSTRAINT P_'+pref+'BPBJRKMX PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO,C_PRODCODE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjpd');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJPD(I_SUBCOMP_ID INT,'
	        +'C_SUBCOMP_NAME VARCHAR(100),'
	        +'C_REF_NO VARCHAR(20),'
	        +'C_TYPE VARCHAR(20),'
	        +'C_SBZT VARCHAR(10),'
	        +'C_STEP VARCHAR(10),'
	        +'C_REMARKS VARCHAR(100),'
	        +'N_AMOUNT NUMERIC(14,2),'
	        +'D_TRX TIMESTAMP,'
	        +'D_SAVE TIMESTAMP,'
          +'C_SAVE VARCHAR(50),'
	        +'D_CHECK TIMESTAMP,'
	        +'C_CHECK VARCHAR(50),'
          +'CONSTRAINT P_'+pref+'BPBJPD PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjpdmx');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJPDMX(I_SUBCOMP_ID INT,'
	        +'C_REF_NO VARCHAR(20),'
	        +'I_SEQ INT,'
	        +'C_PRODCODE VARCHAR(20),'
	        +'C_PRODNAME VARCHAR(50),'
	        +'C_PRODXH VARCHAR(50),'
	        +'C_PRODUNIT VARCHAR(10),'
	        +'I_COUNT INT,'
	        +'N_PRICE NUMERIC(14,6),'
	        +'N_AMOUNT NUMERIC(14,2),'
	        +'C_REMARKS VARCHAR(100),'
          +'CONSTRAINT P_'+pref+'BPBJPDMX PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO,C_PRODCODE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjprovtz');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJPROVTZ(I_SUBCOMP_ID INT,'
          +'C_SUBCOMP_NAME VARCHAR(100),'
          +'C_REF_NO VARCHAR(20),'
          +'C_TYPE VARCHAR(20),'
          +'C_STEP VARCHAR(10),'
          +'C_PROVIDER VARCHAR(50),'
          +'C_REMARKS VARCHAR(100),'
          +'N_AMOUNT NUMERIC(14,2),'
          +'D_TRX TIMESTAMP,'
          +'D_SAVE TIMESTAMP,'
          +'C_SAVE VARCHAR(50),'
          +'D_CHECK TIMESTAMP,'
          +'C_CHECK VARCHAR(50),'
          +'CONSTRAINT P_'+pref+'BPBJPROVTZ PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjprovls');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJPROVLS(I_SUBCOMP_ID INT,'
	        +'C_SUBCOMP_NAME VARCHAR(100),'
	        +'C_MODULE VARCHAR(20),'
	        +'C_BUSINESS VARCHAR(20),'
	        +'C_REF_NO VARCHAR(20),'
	        +'C_THEIR_REFNO VARCHAR(20),'
          +'C_PROVIDER VARCHAR(50),'
	        +'C_REMARKS VARCHAR(100),'
	        +'D_TRX TIMESTAMP,'
	        +'D_CHECK TIMESTAMP,'
	        +'C_TYPE VARCHAR(10),'
	        +'N_AMOUNT NUMERIC(14,2),'
          +'CONSTRAINT P_'+pref+'BPBJPROVLS PRIMARY KEY(I_SUBCOMP_ID,C_PROVIDER,C_REF_NO,C_TYPE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'bpbjprovbal');
        except
        end;

        s := 'CREATE TABLE '+pref+'BPBJPROVBAL(I_SUBCOMP_ID INT,'
          +'C_PROVIDER VARCHAR(50),'
	        +'I_YEAR INT,'
	        +'I_MONTH INT,'
          +'N_INIT_PAYABLE NUMERIC(14,2),'
          +'N_INIT_PAY NUMERIC(14,2),'
          +'N_INIT_BAL NUMERIC(14,2),'
          +'N_CURR_PAYABLE NUMERIC(14,2),'
          +'N_CURR_PAY NUMERIC(14,2),'
          +'N_CURR_BAL NUMERIC(14,2),'
          +'CONSTRAINT P_'+pref+'BPBJPROVBAL PRIMARY KEY(I_SUBCOMP_ID,C_PROVIDER,I_YEAR,I_MONTH) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

      end;
    6: //gtd
      begin
        try
          session.execsql('drop table '+pref+'gtdtask');
        except
        end;

        s := 'CREATE TABLE '+pref+'GTDTASK(I_TASK_ID INT,'
          +'C_DEPT VARCHAR(30),'
          +'I_TYPE INT,I_SEQ INT,I_STATUS INT,I_PARENT_ID INT,I_LEVEL INT,'
          +'C_TITLE VARCHAR(100),M_CONTENT TEXT,D_PLAN_START TIMESTAMP,D_PLAN_FINISH TIMESTAMP,'
          +'D_START TIMESTAMP,D_FINISH TIMESTAMP,C_FZR1 VARCHAR(30),C_FZR2 VARCHAR(30),C_CYR VARCHAR(200),'
          +'C_PJR VARCHAR(30),M_COMMENT TEXT,D_CREATE TIMESTAMP,C_CREATE VARCHAR(30),D_MODIFY TIMESTAMP,'
          +'C_MODIFY VARCHAR(30),'
          +'CONSTRAINT P_'+pref+'GTDTASK PRIMARY KEY(I_TASK_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);
        s := 'CREATE UNIQUE INDEX U01_'+pref+'GTDTASK ON '+pref+'GTDTASK(C_DEPT,I_PARENT_ID,I_TASK_ID)';
        session.execsql(s);
      end;
    8:  //fdyy
      begin
        try
          session.execsql('drop table '+pref+'FDXIANLU');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDXIANLU(I_SUBCOMP_ID INT,'
          +'I_SEQ INT,'
	        +'C_NAME VARCHAR(50),'
          +'CONSTRAINT P_'+pref+'FDXIANLU PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'FDFENGJI');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDFENGJI(I_SUBCOMP_ID INT,'
	        +'I_FJ_ID INT,'
	        +'C_NAME VARCHAR(50),'
	        +'C_BRAND VARCHAR(50),'
	        +'C_ID VARCHAR(50),'
	        +'C_POSITION VARCHAR(50),'
	        +'C_DJ VARCHAR(50),'
	        +'C_WD VARCHAR(50),'
	        +'C_XL1 VARCHAR(50),'
	        +'C_XL2 VARCHAR(50),'
	        +'C_XIANGMU VARCHAR(30),'
	        +'N_RL NUMERIC(10,2),'
	        +'D_TOUYONG TIMESTAMP,'
	        +'C_GLFJ1 VARCHAR(50),'
	        +'C_GLFJ2 VARCHAR(50),'
	        +'C_GLFJ3 VARCHAR(50),'
	        +'I_GLQX INT,'
	        +'C_STATUS VARCHAR(10),'
	        +'C_ASSOCFJ1 VARCHAR(20),'
	        +'C_ASSOCFJ2 VARCHAR(20),'
          +'CONSTRAINT P_'+pref+'FDFENGJI PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'FDGLQX');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDGLQX(I_SUBCOMP_ID INT,'
          +'I_FJ_ID INT,'
          +'N_FS1 NUMERIC(10,3),'
          +'N_FS2 NUMERIC(10,3),'
          +'N_JZFS NUMERIC(10,3),'
          +'N_GL NUMERIC(10,3),'
    	    +'C_FS2 VARCHAR(10),'
          +'CONSTRAINT P_'+pref+'FDGLQX PRIMARY KEY(I_SUBCOMP_ID,I_FJ_ID,N_FS1,N_FS2) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'FDBGFJ');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDBGFJ(I_SUBCOMP_ID INT,'
	        +'C_XL VARCHAR(50),'
	        +'I_FJ_ID1 INT,'
	        +'C_FJ1 VARCHAR(30),'
	        +'I_FJ_ID2 INT,'
	        +'C_FJ2 VARCHAR(30),'
	        +'I_FJ_ID3 INT,'
	        +'C_FJ3 VARCHAR(30),'
	        +'I_FJ_ID4 INT,'
	        +'C_FJ4 VARCHAR(30),'
	        +'I_FJ_ID5 INT,'
	        +'C_FJ5 VARCHAR(30),'
          +'CONSTRAINT P_'+pref+'FDBGFJ PRIMARY KEY(I_SUBCOMP_ID,C_XL) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'processlog');
        except
        end;

        s := 'CREATE TABLE '+pref+'processlog(I_SUBCOMP_ID INT,'
          +'i_prc_id int,'
          +'d_time timestamp,'
          +'d_begin timestamp,'
          +'d_end timestamp,'
          +'i_prc int,'
          +'i_status int,'
          +'c_type varchar(30),'
          +'CONSTRAINT P_'+pref+'processlog PRIMARY KEY(I_SUBCOMP_ID,i_prc_id) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'FDFJQX');
        except
        end;


        s := 'CREATE TABLE '+pref+'FDFJQX(I_SUBCOMP_ID INT,'
          +'I_FJ_ID INT,'
	        +'D_DATE TIMESTAMP,'
          +'N_FS1 NUMERIC(10,3),'
          +'N_FS2 NUMERIC(10,3),'
          +'N_GL NUMERIC(10,3),'
          +'N_GLSJ NUMERIC(18,3),'
	        +'N_SJ NUMERIC(18,3),'
          +'CONSTRAINT P_'+pref+'FDFJQX PRIMARY KEY(I_SUBCOMP_ID,I_FJ_ID,D_DATE,N_FS1,N_FS2) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);
        {
        try
          session.execsql('drop table '+pref+'FDTINGYUN');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDTINGYUN(I_SUBCOMP_ID INT,'
          +'C_REF_NO VARCHAR(20),'
          +'C_DESC VARCHAR(500),'
          +'D_START TIMESTAMP,'
          +'D_END TIMESTAMP,'
          +'I_FJ_ID INT,'
          +'N_RL NUMERIC(10,2),'
          +'C_FJ_NAME VARCHAR(50),'
          +'C_LX VARCHAR(50),'
          +'D_TRX TIMESTAMP,'
          +'D_SAVE TIMESTAMP,'
          +'C_SAVE VARCHAR(50),'
          +'D_CHECK TIMESTAMP,'
          +'C_CHECK VARCHAR(50),'
          +'C_STEP VARCHAR(10),'
          +'CONSTRAINT P_'+pref+'FDTINGYUN PRIMARY KEY(I_SUBCOMP_ID,C_REF_NO) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);
        }

        try
          session.execsql('drop table '+pref+'FDRB');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDRB(I_SUBCOMP_ID INT,'
          +'I_FJ_ID INT,'
          +'C_FDFJ VARCHAR(10),'
          +'C_NAME VARCHAR(50),'
          +'D_DATE TIMESTAMP,'
          +'N_FDL NUMERIC(15,3),'// --MWh
          +'N_XHDL NUMERIC(15,2),'// --kWh
          +'N_ZDYG NUMERIC(15,2),'// -- kW
          +'C_ZDYG_SJ VARCHAR(20),'
          +'N_ZXYG NUMERIC(15,2),'// -- kW
          +'C_ZXYG_SJ VARCHAR(20),'
          +'N_ZJFS NUMERIC(15,2),'// --m/s*s
          +'N_ZJFSSJ INT,'// -- s
          +'N_PJFS NUMERIC(6,2),'// --m/s
          +'N_ZDFS NUMERIC(6,2),'// --m/s
          +'C_ZDFS_SJ VARCHAR(20),'
          +'N_ZXFS NUMERIC(6,2),'// --m/s
          +'C_ZXFS_SJ VARCHAR(20),'
          +'N_ZJWD NUMERIC(15,2),'// --度*s
          +'N_ZJWDSJ INT,'// -- s
          +'N_PJWD NUMERIC(6,2),'
          +'N_ZDWD NUMERIC(6,2),'
          +'C_ZDWD_SJ VARCHAR(20),'
          +'N_ZXWD NUMERIC(6,2),'
          +'C_ZXWD_SJ VARCHAR(20),'

          +'N_GZSJ NUMERIC(15,2),'// --h
          +'N_WHSJ NUMERIC(15,2),'// --h
          +'N_XDSJ NUMERIC(15,2),'// --h
          +'N_FDSJ NUMERIC(15,2),'// --h
          +'N_XTZCSJ NUMERIC(15,2),'// --h

          +'N_KYL NUMERIC(6,2),'// --% (总发电时间+维护时间+限电时间)/(总发电时间+维护时间+故障时间+限电时间)
          +'N_QFL NUMERIC(6,2),'// --% 弃风率
          +'N_LYXS NUMERIC(15,2),'// --h
          +'N_QFDL NUMERIC(15,3),'//
          +'N_GZQFDL NUMERIC(15,3),'//
          +'N_WHQFDL NUMERIC(15,3),'//
          +'N_XDQFDL NUMERIC(15,3),'//
          +'CONSTRAINT P_'+pref+'FDRB PRIMARY KEY(D_DATE,I_SUBCOMP_ID,I_FJ_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);

        try
          session.execsql('drop table '+pref+'FDQX');
        except
        end;

        s := 'CREATE TABLE '+pref+'FDQX(I_SUBCOMP_ID INT,'
          +'D_DATE TIMESTAMP,';

        for i := 1 to 288 do begin
          s := s+'N_'+inttostr(i)+' NUMERIC(10,2),I_'+inttostr(i)+' INT,';
        end;

        s := s +'CONSTRAINT P_'+pref+'FDQX PRIMARY KEY(I_SUBCOMP_ID,D_DATE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
        session.execsql(s);
      end;
  end;
end;

procedure initcompdb(session: tbizsession; compid: integer);//; compid: integer; email,confirm,password: string);
var
  pref,s: string;
  orgid: integer;
begin
  orgid := session.compid;
  try
    session.compid := compid;
    pref := 'Z'+trim(format('%8x_',[session.compid]));
    try
      session.execsql('drop table '+pref+'subcompany');
    except
    end;

    s := 'CREATE TABLE '+pref+'SUBCOMPANY(I_SUBCOMP_ID INT,'
      +'C_NAME VARCHAR(50),'
      +'C_PRINTNAME VARCHAR(300),'
      +'C_SHENG VARCHAR(20),'
      +'C_DIQU VARCHAR(20),'
      +'C_XIAN VARCHAR(20),'
	    +'CONSTRAINT P_'+pref+'SUBCOMPANY PRIMARY KEY(C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'application');
    except
    end;

    s := 'CREATE TABLE '+pref+'APPLICATION(I_APP_ID INT,'
      +'I_INIT INT,'
	    +'CONSTRAINT P_'+pref+'APPLICATION PRIMARY KEY(I_APP_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'loginip');
    except
    end;

    s := 'CREATE TABLE '+pref+'LOGINIP(I_COMP_ID INT,'
      +'D_TIME TIMESTAMP,'
      +'I_SEQ INT,'
      +'I_USER_ID INT,'
      +'C_USERNAME VARCHAR(60),'
      +'C_IP VARCHAR(50),'
      +'C_COUNTRY VARCHAR(60),'
      +'C_SHENG VARCHAR(60),'
      +'C_CITY VARCHAR(60),'
      +'C_COUNTY VARCHAR(60),'
      +'C_ISP VARCHAR(60),'
      +'C_MAC VARCHAR(30),'
	    +'C_OSVER VARCHAR(200),'
	    +'CONSTRAINT P_'+pref+'LOGINIP PRIMARY KEY(I_COMP_ID,D_TIME,I_SEQ) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'subsystem');
    except
    end;

    s := 'CREATE TABLE '+pref+'SUBSYSTEM(I_COMP_ID INT,'
      +'I_SUBCOMP_ID INT,'
	    +'I_TYPE INT,'
      +'I_KJZD_ID INT,'
      +'C_NAME VARCHAR(50),'
      +'C_PRINTNAME VARCHAR(300),'
	    +'I_CALC INT,'
	    +'C_CCY VARCHAR(3),'
	    +'I_STARTYEAR INT,'
	    +'I_STARTMONTH INT,'
	    +'I_YEAR INT,'
	    +'I_MONTH INT,'
	    +'I_STATUS INT,'
	    +'C_STATUS VARCHAR(100),'
      +'D_EXPIRE TIMESTAMP,'
      +'I_LOCKED INT,'
	    +'I_TRIAL INT,'
	    +'D_CREATE TIMESTAMP,'
	    +'D_MODIFY TIMESTAMP,'
	    +'C_MODIFY VARCHAR(50),'
      +'N_AVAILABLE NUMERIC(18,2),'
      +'C_INDUSTRY VARCHAR(50),'
      +'I_LIMIT1 INT,'
      +'I_LIMIT2 INT,'
      +'I_LIMIT3 INT,'
      +'I_LIMIT4 INT,'
      +'I_LIMIT5 INT,'
      +'I_CHECKGDZC INT,'
      +'C_CN VARCHAR(30),'
      +'C_ZD VARCHAR(30),'
      +'C_SH VARCHAR(30),'
      +'C_JZ VARCHAR(30),'
	    +'CONSTRAINT P_'+pref+'SUBSYSTEM PRIMARY KEY(I_COMP_ID,I_SUBCOMP_ID,I_TYPE) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    {
    try
      session.execsql('drop table '+pref+'syslog');
    except
    end;

    s := 'CREATE TABLE '+pref+'SYSLOG(I_SUBCOMP_ID INT,'
	    +'I_SYS_ID INT,'
	    +'I_YEAR INT,'
	    +'I_MONTH INT,'
	    +'I_OP INT,'
      +'D_PROCESS TIMESTAMP,'
	    +'C_USER VARCHAR(50),'
	    +'CONSTRAINT P_'+pref+'SYSLOG PRIMARY KEY(I_SUBCOMP_ID,I_SYS_ID,I_YEAR,I_MONTH) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);
    }
    try
      session.execsql('drop table '+pref+'param');
    except
    end;

    s := 'CREATE TABLE '+pref+'PARAM(C_PARAM_FL VARCHAR(50),'
      +'C_PARAM_NAME VARCHAR(50),'
      +'C_VALUE VARCHAR(100),'
      +'I_COPY INT,'
	    +'CONSTRAINT P_'+pref+'PARAM PRIMARY KEY(C_PARAM_FL,C_PARAM_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);
    session.execsql('insert into '+pref+'param(c_param_fl,c_param_name,c_value,i_copy) select'
      +' c_param_fl,c_param_name,c_value,i_copy from biz_param where i_copy=1');

    try
      session.execsql('drop table '+pref+'subcompparam');
    except
    end;

    s := 'CREATE TABLE '+pref+'SUBCOMPPARAM(I_SUBCOMP_ID INT,'
      +'C_PARAM_FL VARCHAR(50),'
      +'C_PARAM_NAME VARCHAR(50),'
      +'C_VALUE VARCHAR(100),'
	    +'CONSTRAINT P_'+pref+'SUBCOMPPARAM PRIMARY KEY(I_SUBCOMP_ID,C_PARAM_FL,C_PARAM_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'user');
    except
    end;

    s := 'CREATE TABLE '+pref+'USER(I_USER_ID INT,'
      +'I_TYPE INT,'
      +'C_NAME VARCHAR(60),'
      +'C_FULLNAME VARCHAR(60),'
	    +'C_PASSWORD VARCHAR(128),'
	    +'C_CONFIRMCODE VARCHAR(6),'
	    +'C_EMAIL VARCHAR(50),'
	    +'C_MOBILE VARCHAR(50),'
	    +'C_QQ VARCHAR(30),'
	    +'I_FINGERPRINT INT,'
	    +'C_FINGERPRINT VARCHAR(4000),'
	    +'C_FINGERPRINT1 VARCHAR(4000),'
	    +'CONSTRAINT P_'+pref+'USER PRIMARY KEY(I_USER_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    s := 'insert into '+pref+'user(i_user_id,i_type,c_name,c_fullname,c_password,c_confirmcode,c_email)'
      +' select 1,0,c_name,c_fullname,c_password,c_confirmcode,c_email from biz_tmpuser where i_comp_id='+inttostr(session.compid);
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'department');
    except
    end;

    s := 'CREATE TABLE '+pref+'DEPARTMENT(I_SUBCOMP_ID INT,'
      +'I_SEQ INT,'
	    +'C_NAME VARCHAR(50),'
      +'M_MEMO TEXT,'
	    +'CONSTRAINT P_'+pref+'DEPARTMENT PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'provider');
    except
    end;

    s := 'CREATE TABLE '+pref+'PROVIDER(I_SUBCOMP_ID INT,'
      +'I_SEQ INT,'
	    +'C_NAME VARCHAR(50),'
      +'M_MEMO TEXT,'
	    +'CONSTRAINT P_'+pref+'PROVIDER PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'employee');
    except
    end;

    s := 'CREATE TABLE '+pref+'EMPLOYEE(I_SUBCOMP_ID INT,'
      +'I_SEQ INT,'
	    +'C_NAME VARCHAR(50),'
	    +'C_DEPT VARCHAR(50),'
	    +'C_POS VARCHAR(50),'
	    +'CONSTRAINT P_'+pref+'EMPLOYEE PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'customer');
    except
    end;

    s := 'CREATE TABLE '+pref+'CUSTOMER(I_SUBCOMP_ID INT,'
      +'I_SEQ INT,'
	    +'C_NAME VARCHAR(50),'
      +'M_MEMO TEXT,'
	    +'CONSTRAINT P_'+pref+'CUSTOMER PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'bank');
    except
    end;

    s := 'CREATE TABLE '+pref+'BANK(I_SUBCOMP_ID INT,'
      +'I_SEQ INT,'
	    +'C_NAME VARCHAR(50),'
      +'M_MEMO TEXT,'
	    +'CONSTRAINT P_'+pref+'BANK PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'contract');
    except
    end;

    s := 'CREATE TABLE '+pref+'CONTRACT(I_SUBCOMP_ID INT,'
      +'I_SEQ INT,'
	    +'C_NAME VARCHAR(50),'
      +'M_MEMO TEXT,'
	    +'CONSTRAINT P_'+pref+'CONTRACT PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'project');
    except
    end;

    s := 'CREATE TABLE '+pref+'PROJECT(I_SUBCOMP_ID INT,'
      +'I_SEQ INT,'
	    +'C_NAME VARCHAR(50),'
      +'M_MEMO TEXT,'
	    +'CONSTRAINT P_'+pref+'PROJECT PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'common');
    except
    end;

    s := 'CREATE TABLE '+pref+'PRODUCT(I_SUBCOMP_ID INT,'
      +'I_SEQ INT,'
	    +'C_NAME VARCHAR(50),'
      +'M_MEMO TEXT,'
	    +'CONSTRAINT P_'+pref+'PRODUCT PRIMARY KEY(I_SUBCOMP_ID,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'common');
    except
    end;

    s := 'CREATE TABLE '+pref+'COMMON(I_SUBCOMP_ID INT,'
      +'I_SEQ INT,'
	    +'C_DATANAME VARCHAR(50),'
	    +'C_NAME VARCHAR(50),'
      +'I_COPY INT,'
      +'M_MEMO TEXT,'
	    +'CONSTRAINT P_'+pref+'COMMON PRIMARY KEY(I_SUBCOMP_ID,C_DATANAME,C_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);
    session.execsql('insert into '+pref+'common(i_subcomp_id,i_seq,c_dataname,c_name,i_copy,m_memo) select i_subcomp_id,i_seq,c_dataname,c_name,i_copy,m_memo '
      +'from biz_common where i_copy=1');
    try
      session.execsql('drop table '+pref+'sequence');
    except
    end;

    s := 'CREATE TABLE '+pref+'SEQUENCE(I_ID INT,'
	    +'I_USED INT,'
	    +'C_DSEC VARCHAR(60),'
	    +'CONSTRAINT P_'+pref+'SEQUENCE PRIMARY KEY(I_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'subcompright');
    except
    end;

    s := 'CREATE TABLE '+pref+'SUBCOMPRIGHT(I_SYS_ID INT,'
      +'I_SUBCOMP_ID INT,'
	    +'I_USER_ID INT,'
	    +'I_RIGHT INT,'
	    +'CONSTRAINT P_'+pref+'SUBCOMPRIGHT PRIMARY KEY(I_SYS_ID,I_SUBCOMP_ID,I_USER_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'funright');
    except
    end;

    s := 'CREATE TABLE '+pref+'FUNRIGHT(I_SYS_ID INT,'
      +'I_FOLDER_ID INT,'
      +'I_FUN_ID INT,'
	    +'I_USER_ID INT,'
	    +'I_RIGHT INT,'
	    +'CONSTRAINT P_'+pref+'FUNRIGHT PRIMARY KEY(I_SYS_ID,I_FOLDER_ID,I_FUN_ID,I_USER_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'folderright');
    except
    end;

    s := 'CREATE TABLE '+pref+'FOLDERRIGHT(I_SYS_ID INT,'
      +'I_FOLDER_ID INT,'
	    +'I_USER_ID INT,'
	    +'I_RIGHT INT,'
	    +'CONSTRAINT P_'+pref+'FOLDERRIGHT PRIMARY KEY(I_SYS_ID,I_FOLDER_ID,I_USER_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);

    try
      session.execsql('drop table '+pref+'systemright');
    except
    end;

    s := 'CREATE TABLE '+pref+'SYSTEMRIGHT(I_SYS_ID INT,'
	    +'I_USER_ID INT,'
	    +'I_RIGHT INT,'
	    +'CONSTRAINT P_'+pref+'SYSTEMRIGHT PRIMARY KEY(I_SYS_ID,I_USER_ID) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);
  finally
    session.compid := orgid;
  end;
end;

procedure initsubsystem(session: tbizsession; compid,subsysid: integer); stdcall;
var
  s: string;
  orgid: integer;
begin
  orgid := session.compid;
  try
    session.compid := compid;
    initsubsystemdb(session);
    try
      session.Delete(session.getcomptable('application'),'i_app_id='+inttostr(session.appid));
    except
    end;
    try
      s := 'insert into '+session.getcomptable('application')+'(i_app_id,i_init) values('+inttostr(session.appid)+',1)';
      session.execsql(s);
    except
    end;
  finally
    session.compid := orgid;
  end;
end;

procedure regonecompany(session: tbizsession; const compnum, compname,comptype: string); stdcall;
var
  i,j: integer;
  s: string;
  v: variant;
begin
  try
    if compnum='' then begin
      i := session.startcompid;
      if i=0 then i := 60000;

      while true do begin
        s := inttostr(i);
        while pos('4',s)>0 do begin
          inc(i);
          s := inttostr(i);
        end;

        session.query.FieldList := 'i_comp_id';
        session.query.TableList := 'biz_company';
        session.query.Condition := 'i_comp_id='+inttostr(i);
        session.query.open();
        if session.query.eof then break;
        i := i+1;
      end;
    end
    else begin
      i := strtoint(compnum);
      session.query.FieldList := 'i_comp_id';
      session.query.TableList := 'biz_company';
      session.query.Condition := 'i_comp_id='+inttostr(i);
      session.query.open();
      if not session.query.eof then tbizmessage.raiseerror(session.lang,0,1,'公司编号'+inttostr(i)+'已经存在');
    end;

    v := now;
    s := inttostr(i);
    session.starttransaction;
    try
      session.insert('biz_company','i_comp_id,c_comp_name,c_comp_prefix,i_status,c_confirmcode,d_register,c_email,c_sheng,c_lxr,c_dh,i_used,i_client_type,c_mainpath,c_comp_type',
        [i,compname,'Z'+trim(format('%8x_',[i])),2,s,v,'','','','',1,1,'',comptype]);
      inserttmpuser(session,i,'',s,inttostr(i));
      session.commit;
    except
      session.rollback;
      raise;
    end;
  finally
  end;

  initcompdb(session,i);
end;

function batchcreatecomp_16(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  s,s1,s2,s3: string;
  i: Integer;
  j: integer;
begin
  s := session.readstring;
  s := stringreplace(s, #$d#$a,'@',[rfreplaceall]);
  delimitstring(s,'@',session.strings);
  for i := 0 to session.strings.Count-1 do begin
    s := session.strings[i];
    delimitstring(s,',',session.strings1);
    if session.strings1.Count<=1 then continue
    else if session.strings1.Count>=3 then begin
      s3 := session.strings1[0]; //编号
      s1 := session.strings1[1]; //厂站名称
      s2 := session.strings1[2]; //类型
    end
    else begin
      s3 := '';
      s1 := session.strings1[0];
      s2 := session.strings1[1];
    end;

    regonecompany(session,s3,s1,s2);
  end;
end;

function verifyconfirmcode_17(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  lang: tbizlang;
  compid,username,password,confirm: string;
  usertableexists: boolean;
begin
  compid := session.readstring;
  confirm := session.readstring;
  session.compid := strtoint(compid);
  usertableexists := false;
  username := 'ADMIN';
  try
    session.query.FieldList := '*';
    session.query.TableList := session.getcomptable('user');
    session.query.Condition := 'upper(c_name)='''+username+'''';
    session.query.open;
    usertableexists := true;
  except
    session.query.FieldList := '*';
    session.query.TableList := 'biz_tmpuser';
    session.query.Condition := 'i_comp_id='+inttostr(session.compid);
    session.query.open;
  end;

  if session.query.FieldByName('c_confirmcode').AsString<>confirm then
    tbizmessage.raiseerror(session.lang,0,1,'确认码不正确')
  else begin
    //if server.locknewcomp then
    //  session.Update('biz_company','c_confirmcode,i_status','i_comp_id='+compid,['',1])
    //else
      session.Update('biz_company','c_confirmcode,i_status','i_comp_id='+compid,['',7]);

    if usertableexists then
      session.Update(session.getcomptable('user'),'c_confirmcode','upper(c_name)='''+username+'''',['']);

    session.Delete('biz_tmpuser','i_comp_id='+inttostr(session.compid));
  end;
end;

function deletecompany_18(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  compid: integer;
  s: string;
  function getcomptable(const tablename: string): string;
  begin
    result := 'Z'+trim(format('%8x_',[compid]))+tablename;
  end;
  procedure droptable(tablename: string);
  begin
    try
      session.execsql('drop table '+tablename);
    except
    end;
  end;
begin
  compid := session.readint;
  session.query.FieldList := 'i_status';
  session.query.TableList := 'biz_company';
  session.query.Condition := 'i_comp_id='+inttostr(compid);
  session.query.open;
  if session.query.eof then
    tbizmessage.raiseerror(session.lang,0,1,'公司没有找到');

  s := trim(format('%8x',[compid]));
  session.query.fieldlist := 'relname';
  session.query.tablelist := 'pg_class';
  session.query.condition := 'relname like ''z'+lowercase(s)+'%'' and relkind=''r''';
  session.query.open;
  while not session.query.eof do begin
    droptable(session.query.fields[0].asstring);
    session.query.next;
  end;
  {
  droptable('subcompany');
  droptable('subsystem');
  droptable('param');
  droptable('user');
  droptable('department');
  droptable('provider');
  droptable('common');
  droptable('sequence');
  droptable('subcompright');
  droptable('funright');
  droptable('folderright');
  droptable('systemright');
  droptable('bpbjlog');
  droptable('bpbjyyjlog');
  droptable('bpbjcode');
  droptable('bpbjcodeprop');
  droptable('bpbjbal');
  droptable('bpbjdd');
  droptable('bpbjddmx');
  droptable('bpbjck');
  droptable('bpbjckmx');
  droptable('bpbjrk');
  droptable('bpbjrkmx');
  droptable('bpbjpd');
  droptable('bpbjpdmx');
  droptable('ppbjprovtz');
  droptable('bpbjprovls');
  droptable('bpbjprovbal');
  }
  session.delete('biz_company','i_comp_id='+inttostr(compid));
  session.delete('biz_subsystem','i_comp_id='+inttostr(compid));
  session.Delete('biz_tmpuser','i_comp_id='+inttostr(compid));
  session.delete('biz_loginip','i_comp_id='+inttostr(compid));
end;

function getclientcert_19(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  compid,uid,i,j,appid1: integer;
  s: string;
  dt: tdatetime;
  data: array[1..1024] of char;
  v: variant;
  apphost: string;
begin
  apphost := session.readstring;
  apphost := lowercase(apphost);
  appid1 := session.readint;
  compid := session.readint;
  uid := session.readint;
  s := session.readstring;
  dt := standardstrtodatetime(s);
  v := floor(now);
  s := inttostr(appid1)+','+inttostr(compid)+','+inttostr(uid)+','+formatdatetime('yyyy-mm-dd',dt)+','+formatdatetime('yyyy-mm-dd',v)+','+apphost;
  strcopy(@data[1],pchar(s));
  j := length(s)+1;
  data[j] := #$0;
  randomize;
  for i := j+1 to 1024 do begin
    data[i] := chr(random(255));
  end;

  bizencrypt($46235231,$732e510c,@data[1],1024);
  session.writelenbuffer(@data[1],1024);
end;

function checkclientcert_20(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  data: array[1..1036] of byte;
  appid1,uid,compid,repcompid,uid1: integer;
  s: string;
  dt,validdate: tdatetime;
  apphost: string;
begin
  apphost := session.readstring;
  apphost := lowercase(apphost);
  appid1 := session.readint;
  compid := session.readint;
  uid := session.readint;
  // after login successfully, only 0 compid key can replace as other company
  repcompid := session.readint;
  session.readlenbuffer(@data[1],1036);
  // 1036: compid(4)+uid(4)+appid(4)+1024
  if (compid<>pinteger(@data[1])^) or ((uid<>pinteger(@data[5])^) and (pinteger(@data[5])^<>0)) or (appid1<>pinteger(@data[9])^)
     or (session.compid<>compid) or ((session.uid<>uid) and (uid<>0)) or (appid<>appid1) then
    raise exception.create('证书数据错误');
    
  bizdecrypt($46235231,$732e510c,@data[13],1024);
  s := bizstring(@data[13]);
  bizloginfo(session,s);
  delimitstring(s,',',session.strings);
  if session.strings.count=6 then begin
    if session.strings[5]<>apphost then raise exception.create('证书数据错误');
  end
  else begin
    if apphost<>'http://www.weiqibuluo.com' then raise exception.create('证书数据错误');
  end;

  appid1 := strtoint(session.strings[0]);
  compid := strtoint(session.strings[1]);
  uid1 := strtoint(session.strings[2]);
  dt := standardstrtodatetime(session.strings[3]);
  validdate := standardstrtodatetime(session.strings[4]);
  if dt<date then raise exception.create('证书已经过期');
  if (appid<>appid1) or (session.compid<>compid) or ((session.uid<>uid1) and (uid1<>0)) then raise exception.create('证书数据错误');
  session.query.fieldlist := 'd_cavalidfrom';
  session.query.tablelist := 'biz_company';
  session.query.condition := 'i_comp_id='+inttostr(compid);
  session.query.open;
  if session.query.eof then raise exception.create('没有找到公司编号');
  if validdate<floor(session.query.fields[0].asdatetime) then raise exception.create('证书已经过期');

  if (compid=0) and (uid=1) and (repcompid>0) then begin
    session.compid := repcompid;
    session.query.fieldlist := 'c_comp_name';
    session.query.tablelist := 'biz_company';
    session.query.condition := 'i_comp_id='+inttostr(repcompid);
    session.query.open;
    if session.query.eof then raise exception.create('没有找到公司编号');
    session.compname := session.query.fields[0].asstring;
    session.loginstate^.compid := repcompid;
    session.writestring(session.compname);
  end
  else session.writestring('');
end;

function getglobalsequence_21(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  seq,seqid: integer;
begin
  seqid := session.readint;
  seq := session.getglobalsequence(seqid);
  session.writeint(seq);
end;

function uploadfile_22(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  filetype: integer;
  destfilename,filepath: string;
  seq,len: integer;
  buff: array[1..8192] of ansichar;
begin
  filetype := session.readint;
  destfilename := session.readstring;
  seq := session.readint;
  len := session.readlenbuffer(@buff[1],8192);
  case filetype of
    7:
      begin
        filepath := '/mnt/disk_raid/dwsjfile/';
      end;
    8:
      begin
        filepath := session.releasefilepath[appid];
      end
    else
      tbizmessage.raiseerror(session.lang,0,1,'filetype invalid');
  end;

  bizloginfo(session,'uploadfile: '+inttostr(filetype)+','+filepath+destfilename);
  if seq=1 then
    deletefile(filepath+destfilename);

  bizappendfile(seq, filepath+destfilename, @buff[1], len);
end;

function genewm_23(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  filename: string;
  url: string;
  buff: array[1..8192] of ansichar;
  i,readed,tot: integer;
  filestream: tfilestream;
begin
  filename := bizstring(@serverparam^.tmppath[1])+biztempname+'.png';
  url := session.readstring;
  bizqrencodepic(url,filename,350);
  try
    filestream := tfilestream.Create(filename,fmopenread);
    session.writeint(filestream.size);
    readed := 0;
    tot := filestream.size;
    while true do begin
      i := filestream.Read(buff,8192);
      session.writebuffer(@buff[1],i);
      readed := readed+i;
      if readed>=tot then break;
    end;
  finally
    filestream.free;
  end;

  //deletefile(filename);
end;

function deletefile_24(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  filetype: integer;
  filename,filepath: string;
begin
  filetype := session.readint;
  filename := session.readstring;
  case filetype of
    7:
      begin
        filepath := '/mnt/disk_raid/dwsjfile/';
      end;
    else
      tbizmessage.raiseerror(session.lang,0,1,'filetype invalid');
  end;

  deletefile(filepath+filename);
end;

function getparam_25(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  paramfl, paramname: string;
begin
  paramfl := session.readstring;
  paramname := session.readstring;
  session.query.FieldList := 'c_value';
  session.query.TableList := session.getcomptable('param');
  session.query.Condition := 'c_param_fl='''+paramfl+''' and c_param_name='''+paramname+'''';
  session.query.open;
  paramname := trim(session.query.Fields[0].AsString);
  session.writestring(paramname);
end;

function writeparam_26(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  paramfl,paramname,paramvalue: string;
begin
  paramfl := trim(session.readstring);
  paramname := trim(session.readstring);
  paramvalue := trim(session.readstring);
  session.query.FieldList := 'c_value';
  session.query.TableList := session.getcomptable('param');
  session.query.Condition := 'c_param_fl='''+paramfl+''' and c_param_name='''+paramname+'''';
  session.query.open;
  if session.query.eof then session.Insert(session.getcomptable('param'),'c_param_fl,c_param_name,c_value',[paramfl,paramname,paramvalue])
  else session.Update(session.getcomptable('param'),'c_value','c_param_fl='''+paramfl+''' and c_param_name='''+paramname+'''',[paramvalue]);
end;

function writeparamex_27(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  paramfl,paramname,paramvalue: string;
  subcomp: integer;
begin
  subcomp := session.readint;
  paramfl := trim(session.readstring);
  paramname := trim(session.readstring);
  paramvalue := trim(session.readstring);
  session.query.FieldList := 'c_value';
  session.query.TableList := session.getcomptable('subcompparam');
  session.query.Condition := 'i_subcomp_id='+inttostr(subcomp)+' and c_param_fl='''+paramfl+''' and c_param_name='''+paramname+'''';
  session.query.open;
  if session.query.eof then session.Insert(session.getcomptable('subcompparam'),'i_subcomp_id,c_param_fl,c_param_name,c_value',[subcomp,paramfl,paramname,paramvalue])
  else session.Update(session.getcomptable('subcompparam'),'c_value','i_subcomp_id='+inttostr(subcomp)+' and c_param_fl='''+paramfl+''' and c_param_name='''+paramname+'''',[paramvalue]);
end;

function getparamex_28(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  s,paramfl, paramname: string;
  subcomp: integer;
begin
  subcomp := session.readint;
  paramfl := session.readstring;
  paramname := session.readstring;
  session.query.FieldList := 'c_value';
  session.query.TableList := session.getcomptable('subcompparam');
  session.query.Condition := 'i_subcomp_id='+inttostr(subcomp)+' and c_param_fl='''+paramfl+''' and c_param_name='''+paramname+'''';
  try
    session.query.open;
  except
    s := 'CREATE TABLE '+session.getcomptable('subcompparam')+'(I_SUBCOMP_ID INT,'
      +'C_PARAM_FL VARCHAR(50),'
      +'C_PARAM_NAME VARCHAR(50),'
      +'C_VALUE VARCHAR(100),'
      +'CONSTRAINT P_'+session.getcomptable('subcompparam')+' PRIMARY KEY(I_SUBCOMP_ID,C_PARAM_FL,C_PARAM_NAME) USING INDEX TABLESPACE '+session.getindextablespace+') TABLESPACE '+session.getdatatablespace;
    session.execsql(s);
    session.query.FieldList := 'c_value';
    session.query.TableList := session.getcomptable('subcompparam');
    session.query.Condition := 'i_subcomp_id='+inttostr(subcomp)+' and c_param_fl='''+paramfl+''' and c_param_name='''+paramname+'''';
    session.query.open();
  end;

  paramname := trim(session.query.Fields[0].AsString);
  session.writestring(paramname);
end;

function getbasefilelist_29(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  loctable: tbizlocaltable;
  filetype: integer;
  query1: tbizquery;
  releasefilepath,filename: string;
begin
  filetype := session.readint;

  case filetype of
    0:
      begin
        loctable := session.getlocaltable;
        query1 := session.getquery;
        loctable.FieldDefs.Add('c_catalog',ftstring, 50);
        loctable.FieldDefs.Add('c_filename',ftstring, 50);
        loctable.FieldDefs.Add('d_filetime',ftdatetime, 0);
        loctable.FieldDefs.Add('i_filesize',ftinteger, 0);
        loctable.createlocaltable('c_catalog;c_filename',true);
        query1.FieldList := '*';
        query1.TableList := 'biz_basefile';
        query1.open;
        while not query1.eof do  begin
          filename := session.releasefilepath[appid]+query1.FieldByName('c_dll').AsString;
          loctable.Insert;
          loctable.FieldByName('c_filename').AsString := query1.FieldByName('c_dll').AsString;
          loctable.FieldByName('c_catalog').AsString := query1.FieldByName('c_catalog').AsString;
          if fileexists(filename) then begin
            loctable.FieldByName('d_filetime').Asdatetime := bizfiletime(filename);
            loctable.FieldByName('i_filesize').Asinteger := bizfilesize(filename);
            //loctable.FieldByName('c_md5').AsString := bizmd5file(filename);
          end;

          loctable.Post;
          query1.next;
        end;
      end;
    1:
      begin
        loctable := session.getlocaltable;
        query1 := session.getquery;
        loctable.FieldDefs.Add('c_catalog',ftstring, 50);
        loctable.FieldDefs.Add('c_assoc_dll',ftstring, 200);
        loctable.FieldDefs.Add('c_filename',ftstring, 50);
        loctable.FieldDefs.Add('d_filetime',ftdatetime, 0);
        loctable.FieldDefs.Add('i_filesize',ftinteger, 0);
        loctable.createlocaltable('c_catalog;c_filename',true);
        query1.FieldList := '*';
        query1.TableList := 'biz_funcfile';
        query1.open;
        while not query1.eof do  begin
          filename := session.releasefilepath[appid]+query1.FieldByName('c_dll').AsString;
          loctable.Insert;
          loctable.FieldByName('c_filename').AsString := query1.FieldByName('c_dll').AsString;
          loctable.FieldByName('c_catalog').AsString := query1.FieldByName('c_catalog').AsString;
          if fileexists(filename) then begin
            loctable.FieldByName('d_filetime').Asdatetime := bizfiletime(filename);
            loctable.FieldByName('i_filesize').Asinteger := bizfilesize(filename);
            //loctable.FieldByName('c_md5').AsString := bizmd5file(filename);
          end;

          loctable.Post;
          query1.next;
        end;
      end;
    2:
      begin

      end;
  end;

  filename := loctable.savetofile;
  session.writestring(filename);
  session.writestring('c_catalog;c_filename');
end;

function downloadfile_30(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  filetype,filesize: integer;
  filename,fullfilename: string;
  startpos, len: integer;
  endfile: integer;
  remotemd5,localmd5: string;
  filestream: tfilestream;
  buf: array[1..8196] of char;
begin
  remotemd5:='';
  localmd5 :='';
  filetype := session.readint; // 8: release file
  filename := session.readstring;
  startpos := session.readint;
  if startpos=0 then begin
    remotemd5 := session.readstring;
  end;

  len := session.readint;
  case filetype of
    8:
      begin
        fullfilename := session.releasefilepath[appid]+lowercase(filename);
      end;
    else
      raise tbizmessage.Create(999,'文件类型错误，可能是网络断线缘故，请重新尝试');
  end;

  localmd5 := bizmd5file(fullfilename);
  if (not fileexists(fullfilename)) or ((startpos=0) and (remotemd5=localmd5)) then begin
    session.writeint(1);
    session.writeint(0);
    exit;
  end
  else begin
    filesize := bizfilesize(fullfilename);
    if startpos+len>=filesize then begin
      endfile := 1;
      len := filesize-startpos;
    end
    else
      endfile := 0;

    session.writeint(endfile);
    if endfile=1 then
      session.writeint(filesize-startpos)
    else
      session.writeint(len);
  end;

  if startpos=0 then
    session.writestring(localmd5);

  session.writeint(len);
  try
    filestream := tfilestream.create(fullfilename,fmOpenRead or fmShareDenyNone);
    filestream.Seek(startpos,SoFromBeginning);
    session.writebuffer(filestream,len);
  finally
    filestream.free;
  end;
end;

function getpwd_31(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
var
  compid: integer;
  s: string;
  function getpassword(val: string): string;
  var
    buf: array[1..64] of byte;
    s: ansistring;
    i: Integer;
  begin
    stringtochar(val,@buf[1],64);
    bizdecrypt($46d8d231,$8f7e51ac,@buf[1],64);
    bizstring(result,@buf[1]);
  end;
begin
  compid := session.readint;
  session.query.FieldList := 'c_password';
  if compid=0 then
    session.query.TableList := 'biz_user'
  else
    session.query.TableList := 'Z'+trim(format('%8x_',[compid]))+'user';

  session.query.Condition := 'c_name=''admin''';
  session.query.open;
  s := getpassword(session.query.Fields[0].AsString);
  session.writestring(s);
end;

function checkuuidlogin_32(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
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

function getwxjsticket_33(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
begin
  result := session.wxjsticket;
end;

function isremember_34(session: TBizSession; appid: integer; const path,query,param: string; var redirecturl: string; var retlen: integer): string;
begin
  result := '';
  session.query.fieldlist := 'i_user_id';
  session.query.tablelist := 'biz_remember';
  session.query.condition := 'i_sys_id='+inttostr(appid)+' and c_token='''+param+''' and i_user_id='+inttostr(session.uid);
  session.query.open;
  if not session.query.eof then result := '1';
end;

end.

