#!/usr/local/bin/lua

function pwd()
  os.execute("chmod +x pwd.sh")
  os.execute("./pwd.sh")
  pwdop = readData("~/where")
  SetupDir = tostring(pwdop[1]).."/"
  print(SetupDir)
  sleep(0.5)
  print(SetupDir)
  sleep(0.5)
  print(SetupDir)
  sleep(5)
  os.execute("rm ~/where")
end

function requiring()
  local name = require(SetupDir.."libs/luafun.lua");
  local name = require(SetupDir.."libs/write.lua");
end

local clock = os.clock
function sleep(n)
   local t0 = clock() -- time since program/script started
   while clock() - t0 <= n do end
end

--Configuration
debugmode = false
import = {}

-- Logic

function LuaSelect()
if debugmode == true then
 print("HLibLua: "..HLibLua)
 print("LFSLibLua: "..LFSLibLua)
end
 if HLibLua == "y" then
      LuaHeroSU()
   else
      if LFSLibLua == "y" then
         LuaLFSSU()
      else
         LuaSU()
      end
   end
end
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function readData(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

function ConfigGet()
   configFile = SetupDir.."config.txt"
   config = readData(configFile)
   startCodeDirLua = config[1]
   startCodeDirHTML = config[2]
   startCodeDirShellScript = config[4]
   startCodeDirJava = config[3]
   startCodeDirLove = config[5]
   HLibLua = config[6]
   LFSLibLua = config[7]
   AssetFolderAdd = config[8]
   HLibLove = config[9]
   HLibLoveandAssetFolderAdd = config[10]
end

function importsfun()
  if imports == "yes" then
     io.write("How many imports do you need: ")
     importsnum = io.read("*number")
     print(importsnum)
     for i=1,importsnum do
           sleep(0.2)
           io.write("What is the import: ")
           import[i] = io.read()
     end
     JavaSU()
  else
    if imports == "no" then
      JavaSU()
    end
  end
end

function LoveSelect()
 if AssetFolderAdd == "y" then
   dir = "mkdir "..codeDir.."Assets/"
   os.execute(dir)
   ProBar("Setting Up Love Assets Folder in "..codeDir, 0.02)
   LoveSU()
 else
   if HLibLove == "y" then
     HLibLoveSU()
   else
     if HLibLoveandAssetFolderAdd == "y" then
       dir = "mkdir "..codeDir.."Assets/"
       os.execute(dir)
       ProBar("Setting Up Love Assets Folder in "..codeDir, 0.02)
       HLibLoveSU()
     else
       LoveSU()
     end
   end
 end
end
function Select()
  clear()
  ConfigGet()
  io.write("Code Language: ")
  CL = io.read()
  if CL == "Lua" then
    io.write("Code File Name: ")
    codeDir = startCodeDirLua..io.read()..".lua"
    LuaSelect()
  else
    if CL == "HTML" then
      io.write("Code File Name: ")
      codeDir = startCodeDirHTML..io.read()..".html"
      HTMLSU()
    else
      if CL == "Java" then
        if debugmode == true then
          CodeDir = startCodeDirJava.."Debug"..os.time()
          print("PathProjectFolder: "..CodeDir)
        else
          io.write("Code Project Name: ")
          codeDir = startCodeDirJava..io.read().."/"
          dir = "mkdir "..codeDir
          os.execute(dir)
          io.write("Code Class Name: ")
          JClass = io.read()
          JClassFile = codeDir..JClass..".java"
          io.write("Do you want to add any imports (yes/no)? ")
          imports = io.read()
          importsfun()
        end
      else
        if CL == "ShellScript" then
          io.write("Code File Name: ")
          codeDir = startCodeDirShellScript..io.read()..".sh"
          SHSU()
        else
          if CL == "Love" then
              io.write("Code Project Name: ")
              codeDir = startCodeDirLove..io.read().."/"
              dir = "mkdir "..codeDir
              os.execute(dir)
              LoveSelect()
          else
            if CL == "Exit" then
            else
              print()
              print("Invalid Language")
              sleep(1)
              Select()
            end
          end
        end
      end
    end
  end
end
pwd()
requiring()
Select()
