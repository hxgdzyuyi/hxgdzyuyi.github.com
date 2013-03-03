---
title: "Git 102"
date: 2013/02/15
tags: code
seo: Git 101
---
## Git 102: -w, --prune, git-log

为什么是102？
---
因为 102 比 101 还多 1, 纯粹是因为 102 比较容易做 seo 啦。

1. `w` 参数。

  参数 `w` 可以搭配 `git-diff` 和 `git-blame` 使用, o(∩∩)o 。

  ``` bash
    git diff -w (--ignore-all-space) # 可以在 diff 的时候忽略掉对于 whitespace 的修改
    git blame -w
      # 我觉得比起 diff 来说 blame 的这个参数更加的让我喜爱。
      # 功能也是屏蔽 whitespace 的修改, 免的很多时候 blame 到无意义的 commit
  ```

2. 快速的删除 github 上本地已经删除的分支。

  ``` bash
    git push --prune [<repository> [<refspec>...]]
      # prune 就是 “修剪” 的意思， 这条命令会删除 remote 端上本地已经删掉的分支
    git push --mirror [<repository> [<refspec>...]]
      # 类似的命令 不过功能是让 remote 的仓库和本地同步
  ```

3. 查看每个分支的未提交的第一条commit [[link]](http://jfoucher.com/2012/04/github-tricks-from-stackoverflow.html)

  ``` bash
    git log --branches --not --remotes --decorate --oneline
      # --not --remotes 查看未提交的信息 --not --remotes=*/master 所有远端master分支中不存在的 commit
      # --simplify-by-decoration 属于 git-log 的 History Simplification 方面的参数，显示代表选中分支和 tag 的 commit 信息
      # --decorate 显示分支名
      # --online 显示一行commit
  ```

4. 见过的比较好的 git-hook。
  - 提交 commit 前自动运行 jshint [[link]](https://github.com/adamrisser/JSHint-pre-commit-git-hook)
  - checkout 的时候会自动运行 bundle [[link]](https://github.com/cypher/dotfiles/blob/master/git-hooks/bundle-when-checkout.sh)
