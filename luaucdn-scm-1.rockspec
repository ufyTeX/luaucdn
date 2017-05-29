package = "luaucdn"
version = "scm-1"
source = {
   url = "git+https://github.com/deepakjois/luaucdn",
}
description = {
   summary = "Lua bindings for ucdn",
   homepage = "https://github.com/deepakjois/luaucdn",
   license = "MIT",
   maintainer = "Deepak Jois <deepak.jois@gmail.com>"
}
dependencies = {
   "lua >= 5.2"
}
build = {
   type = "builtin",
   modules = {
      luaucdn = {
         "src/luaucdn/ucdn.c",
         "src/luaucdn/luaucdn.c"
      },
      ucdn = "src/ucdn.lua"
   }
}
