# GitHub 发布手册

本项目的公开仓库：<https://github.com/anyou2006-ux/knowledge-concept-card>。

本手册将本地 Skill 变成一个可追踪、可协作的 GitHub 仓库。创建公开仓库和推送内容是对外发布行为，请在确认可见性、名称、许可证和署名后再执行。

## 0. 发布前清单

```bash
cd /path/to/knowledge-concept-card
./scripts/validate-skill.sh
```

确认以下事项：

- `README.md`、`LICENSE`、`CONTRIBUTING.md` 和本手册与实际行为一致。
- 不包含私密信息、账号令牌、未授权教材、试题答案或第三方插图。
- `SKILL.md` 的 `name`、仓库目录名和建议的 GitHub 仓库名均为 `knowledge-concept-card`。
- 公开仓库使用 MIT；若加入大量原创课程正文或受限材料，应先重新评估授权策略。

## 1. 安装 GitHub CLI（可选）

如果尚未安装 `gh`，可使用 Homebrew 安装：

```bash
brew install gh
gh auth login
gh auth status
```

登录时选择 `GitHub.com`，使用浏览器登录，并确认账号具备创建仓库权限。没有 Homebrew 或不希望安装 CLI 时，使用下面的网页流程。

## 2. 初始化并提交本地 Git 仓库

仅在项目尚未初始化 Git 时执行：

```bash
cd /path/to/knowledge-concept-card
git init
git symbolic-ref HEAD refs/heads/main
git add SKILL.md README.md CONTRIBUTING.md RELEASE.md LICENSE \
  references examples scripts .github .gitignore
git commit -m "feat: add multi-subject concept card skill"
git status
```

若 Git 提示没有作者身份，先在本机设置你的公开署名：

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

不要将访问令牌、密码或私钥写入 Git 配置、提交信息或仓库文件。

## 3. 使用 GitHub CLI 创建仓库

以下命令会创建并推送到**公开**仓库：

```bash
gh repo create knowledge-concept-card --public --source=. --remote=origin --push \
  --description "Create accurate, textbook-style concept cards across school subjects."
```

想先只限自己或协作者查看时，改用 `--private`。确认公开前，可以先用私有仓库完成 CI 检查和 README 预览，再在 GitHub 仓库设置中修改可见性。

发布后检查：

```bash
git remote -v
git status
gh repo view --web
```

## 4. 不使用 CLI 的网页流程

1. 在 GitHub 网页点击 **New repository**。
2. 仓库名填写 `knowledge-concept-card`，不要勾选“Add a README”，因为本地已经存在 README。
3. 选择 Public 或 Private，确认后创建。
4. 复制 GitHub 给出的仓库 HTTPS 地址。
5. 回到终端，添加远端并推送：

```bash
git remote add origin https://github.com/<your-account>/knowledge-concept-card.git
git push -u origin main
```

网页端可能要求使用 Personal Access Token 或 Git Credential Manager，而不是账户密码。不要把 Token 粘贴到项目文件中。

## 5. 已发布仓库的安装与更新

首次安装：

```bash
git clone https://github.com/anyou2006-ux/knowledge-concept-card.git
cd knowledge-concept-card
./scripts/install-local.sh
```

更新既有安装：

```bash
cd /path/to/knowledge-concept-card
git pull --ff-only origin main
./scripts/install-local.sh
```

安装脚本只创建或确认本地符号链接，不会覆盖冲突目标。完成安装或更新后开启新对话，以便加载更新后的 Skill。

## 6. 首个版本标签

在 GitHub Actions 绿色通过、README 链接可打开后，再建立版本标签：

```bash
git tag -a v0.1.0 -m "Initial multi-subject concept card skill"
git push origin v0.1.0
```

随后可在 GitHub 的 **Releases** 页面从标签 `v0.1.0` 创建 release，并简述：四个学科配置、公共内容契约、样例和结构测试。

## 7. 后续发布

建议遵循语义化版本：

- `PATCH`：文案修正、示例修复、非破坏性规则澄清。
- `MINOR`：新增学科配置、输出字段、兼容性功能。
- `MAJOR`：更改输入字段、输出契约或安装方式。

每次发布前运行：

```bash
./scripts/validate-skill.sh
git status
git log --oneline -5
```

## 8. 处理错误发布

不要重写其他人已使用的公开标签。发布后发现问题时，提交修复并发布下一个补丁版本，例如 `v0.1.1`。如果意外提交了密钥，应立即在对应服务中撤销密钥，并依照 GitHub 的敏感信息清理流程处理；单纯删除文件不足以让历史记录失效。

