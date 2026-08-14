# 操作手册：英语词汇知识卡（样例：resilience）

对应验收样例：[input-output.md](input-output.md) #1。本手册说明如何用
`knowledge-concept-card` 生成一张英语词汇知识卡，并核对输出质量。

## 适用场景

- 生成单个单词、搭配、习语、短语动词的知识卡
- 备考（高考/雅思/托福）词汇复习、教材单元词汇讲解
- 需要 IPA、词性、中英释义、例句、搭配、记忆锚一体的学习卡

## 输入方式

结构化调用（推荐，避免歧义）：

```text
subject: english-vocabulary
concept: resilience
level: senior-high
focus: 高考阅读理解与写作
format: card-and-html
```

自然语言同样有效：

```text
给我做一张高三英语 resilience 的知识卡，附可编辑 HTML，重点放在“恢复力”这个义项。
```

## 操作步骤

1. 确认 `subject: english-vocabulary`，否则按单词自动推断学科。
2. 提供 `concept`（必填）：一个单词或短语，不要一次给多个词。
3. 可选 `level`（如 `beginner`、`senior-high`）与 `focus`（考试、场景、难点）。
4. 选择 `format`：`content-spec`（内容+排版说明）、`card`（+插图提示词）、
   `card-and-html`（+自包含 HTML，推荐用于 IPA/例句密集场景）。
5. 检查输出的 IPA 拼写、词性、释义顺序、例句是否自然，再用于教学。

## 期望输出与验收

| 验收点 | 通过标准 |
| --- | --- |
| IPA | UK/US 音标齐全，重音正确（resilience: /rɪˈzɪliəns/） |
| 词性 | 标注 noun，必要时说明可数性 |
| 释义 | 中文按常用度排序，英文释义非循环解释 |
| 例句 | 一个自然句子 + 忠实中文翻译，体现“恢复”义 |
| 搭配 | 2–4 个：`emotional resilience`、`build resilience` 等 |
| 同反义词 | 仅当意义、语域、用法接近时才给；无直接反义词时留空 |
| 记忆锚 | 诚实有效，且与定义/规则明确区分 |
| 视觉 | 具体场景线稿（如幼苗回弹），headword 不在插图中 |
| 排版 | IPA 与例句为确定性排字文本，不交给图像生成 |

## 常见问题

- **一词多义**：默认覆盖最常用义项；如需特定义项，在 `focus` 中说明。
- **反义词缺失**：属正常（如 resilience 无单一直接反义词），不要硬凑。
- **格式建议**：含 IPA 的卡片优先 `card-and-html`，避免图像模型拼错音标。

