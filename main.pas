unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, bizsrvclass,bizutils,bizserviceapi;

procedure initwebservice(p: PBizServerParam); cdecl;
function requestservice(loginstate: PBizloginState; cancache,pkgid, svcid: integer; const path, query, param: pchar; var returl: pchar; var errcode: integer; var error: pchar): pchar; cdecl;
procedure binaryrequestservice(loginstate: PBizloginState; cancache,pkgid, svcid: integer; const path, query, filename: pchar; var returl: pchar; var errcode: integer; var error: pchar); cdecl;
procedure initsession(loginstate: PBizloginState); cdecl;
procedure exitsession; cdecl;
procedure exitwebservice; cdecl;
function getfilename: pchar; cdecl;

implementation
uses
  bizpackage_1, // base service
  bizpackage_5; // 51pas

var
  packages: array[1..2] of TTmpPackageEntry = (
    (pkgid:1;service:@package_1;svccount:length(package_1);desc: 'Base package')
    ,(pkgid:5;service:@package_5;svccount:length(package_5);desc: '51pas package')
  );


procedure initwebservice(p: PBizServerParam); cdecl;
begin
  bizinitwebservice(p, @packages, length(packages));
end;

procedure initsession(loginstate: PBizloginState); cdecl;
begin
  bizinitsession(loginstate);
end;

procedure exitsession; cdecl;
begin
  bizexitsession;
end;

function requestservice(loginstate: PBizloginState; cancache, pkgid, svcid: integer; const path, query, param: pchar; var returl: pchar; var errcode: integer; var error: pchar): pchar; cdecl;
begin
  result := bizrequestservice(loginstate,cancache, pkgid, svcid,path, query, param, returl, errcode, error);
end;

procedure binaryrequestservice(loginstate: PBizloginState; cancache,pkgid, svcid: integer; const path, query, filename: pchar; var returl: pchar; var errcode: integer; var error: pchar); cdecl;
begin
  bizbinaryrequestservice(loginstate,cancache, pkgid, svcid,path, query, filename, returl, errcode, error);
end;

procedure exitwebservice; cdecl;
begin
  bizexitwebservice;
end;

function getfilename: pchar; cdecl;
begin
  result := bizgetfilename;
end;

end.

