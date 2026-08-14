# Knowledge Concept Card Skill

**Repository:** https://github.com/anyou2006-ux/knowledge-concept-card

将一个学科概念转化为可核验、可教学、可稳定排版的现代教材风格知识卡。当前内置英语词汇、C 语言、高中语文和高中数学四个学科配置。

## 功能

- 输入一个单词、代码概念、语文术语、数学知识点或题型。
- 自动匹配学科配置，或接受 `subject` 显式指定。
- 支持 `content-spec`、`card` 和 `card-and-html` 三种交付模式。
- 插图可由图像工具生成；IPA、公式、代码、古文等精确文字应由 HTML/CSS 或设计工具排版。

## 安装

从公开仓库克隆并安装：

```bash
git clone https://github.com/anyou2006-ux/knowledge-concept-card.git
cd knowledge-concept-card
sh ./scripts/install-local.sh
```

脚本创建以下软链接，不会覆盖同名文件或目录：

```text
~/.cola/skills/knowledge-concept-card
  -> /path/to/knowledge-concept-card
```

更新已有安装：

```bash
cd /path/to/knowledge-concept-card
git pull --ff-only origin main
sh ./scripts/install-local.sh
```

完成安装或更新后开启新对话。

## 使用

优先显式指定学科，避免跨学科术语歧义：

```text
subject: english-vocabulary
concept: resilience
level: senior-high
format: card-and-html
```

自然语言同样有效：

```text
给我做一张高一数学“二次函数图像平移”的教材知识卡，附可编辑 HTML。
```

### 输入字段

| 字段 | 必填 | 说明 |
| --- | --- | --- |
| `subject` | 否 | `english-vocabulary`、`c-language`、`high-school-chinese`、`high-school-math` |
| `concept` | 是 | 一个单词、短语、概念、定理、语法项、文本片段或题型 |
| `level` | 否 | 学习者阶段，如 `beginner`、`高一`、`senior-high` |
| `focus` | 否 | 考试、应用场景或难点 |
| `format` | 否 | `content-spec`、`card`、`card-and-html`；默认 `card` |

### 操作手册

每个学科配置一份操作手册（含输入、步骤、验收点与常见问题）：

- [英语词汇（样例 resilience）](examples/how-to-english-vocabulary.md)
- [C 语言（样例 pointer dereference）](examples/how-to-c-language.md)
- [高中语文（样例 借景抒情）](examples/how-to-high-school-chinese.md)
- [高中数学（样例 二次函数图像平移）](examples/how-to-high-school-math.md)

## 测试

运行零依赖结构测试：

```bash
sh ./scripts/validate-skill.sh
```

GitHub Actions 会对每次 push、pull request 和手动触发执行同一测试。结构测试不能替代学科事实审校；提交前仍应按 [examples/input-output.md](examples/input-output.md) 做人工验收。

## 扩展与发布

- [CONTRIBUTING.md](CONTRIBUTING.md)：新增学科与提交规范。
- [RELEASE.md](RELEASE.md)：GitHub 建仓、发布、安装、更新与版本标签说明。
- [LICENSE](LICENSE)：MIT License。

## English

**Knowledge Concept Card Skill** turns one learning concept into an accurate, teachable, modern textbook-style concept card. It includes profiles for English vocabulary, C, high-school Chinese, and high-school mathematics. Install locally with `sh ./scripts/install-local.sh`, start a new conversation, and use `format: card-and-html` when the final card contains dense text such as IPA, code, formulae, or quotations.
