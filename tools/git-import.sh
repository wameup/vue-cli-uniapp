echo "=== Enter a << org/repo >> to add as submodule, or << leave blank >> for no change):" 
read -p ">>> " SubRepo
if [ $SubRepo ]
then
  git submodule add https://git.faronear.org/$SubRepo src ## 注意，不能用 ln -s 来链接外部项目到 src! vue-cli 不会对链接目录进行 babel 转译，导致 npm run serve 无法识别 ES6 写法，无法编译通过
  cd src && npm run boot && cd ..
  npm run serve
fi
