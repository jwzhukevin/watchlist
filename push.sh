#!/bin/bash

# 添加所有文件到暂存区
git add .


# 获取源码仓库信息（显式指定源码目录，避免跨文件系统问题）
SOURCE_REPO_DIR="/mnt/d/Flask/learn/watchlist"
COMMIT_HASH=$(git -C "$SOURCE_REPO_DIR" rev-parse --short HEAD)
BRANCH_NAME=$(git -C "$SOURCE_REPO_DIR" rev-parse --abbrev-ref HEAD)
REPO_NAME=$(basename "$SOURCE_REPO_DIR")
TIMESTAMP=$(date +'%Y-%m-%d %H:%M:%S')

# 提交到部署仓库
git commit -m "Deploy: ${REPO_NAME}@${BRANCH_NAME}:${COMMIT_HASH} (${TIMESTAMP})"

# 推送
git push
