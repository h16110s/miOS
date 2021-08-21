# miOS

ゼロからのOS入門

の内容をやってみた

[MikanOS](https://github.com/uchan-nos/mikanos-build.git)

参考リポジトリのクローン
```sh
git clone https://github.com/uchan-nos/mikanos-build.git
```

環境
qemuの実行以外はとりあえずコンテナ内で作業
```
docker build -t midev ./
docker run --rm --privileged --name miOS-dev -it -v $PWD:/root/dir midev 
```



# 参考文献
- ゼロからのOS自作入門, 内田公太 著, マイナビ出版, 2021