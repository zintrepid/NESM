
version       = "0.4.5"
author        = "xomachine (Fomichev Dmitriy)"
description   = "NESM stands for Nim's Easy Serialization Macro. The macro allowing generation of serialization functions by one line of code!"
license       = "MIT"
skipDirs      = @["tests", "demos"]

requires "nim >= 0.14.2"

task tests, "Run autotests":
  let test_files = listFiles("tests")
  for target in ["c"]:
    echo "== Testing target " & target & " =="
    for file in test_files:
      exec("nim " & target & " --run -d:nimOldCaseObjects -d:debug -o:tmpfile -p:" & thisDir() & " " & file)
      rmFile("tmpfile")

task docs, "Build documentation":
  exec("nim doc2 -p:" & thisDir() &
    " -o:index.html nesm.nim")
