# Contributing

感谢你为知识概念卡补充学科、样例、规则或修订。这个项目的第一优先级是教学正确性，其次才是视觉风格。

## 提交前检查

1. 运行 `./scripts/validate-skill.sh`。
2. 用至少一个真实输入走读输出，确认定义、示例、条件和图解互相一致。
3. 确认新增内容不复制受版权保护的教材、试卷答案或插图，除非你拥有明确授权。
4. 将一个改动限制在一个清晰目标内，例如“新增 Python 配置”或“修正 C 指针的边界说明”。

## 新增学科配置

新增 `references/<subject>.md` 时，至少包括以下四个二级标题：

```markdown
## Required Content
## Teaching Notes
## Visual Pattern
## Card Layout
```

同时回答这些问题：

- 该学科的一张卡最小应该教会什么？
- 哪些前提、单位、条件、出处或运行边界不可省略？
- 哪一种图、流程、结构或对比最容易说明核心关系？
- 哪些常见误区会使卡片“看似正确但实际误导”？

不要把学科细则放入 `SKILL.md`。总入口只负责选择配置、统一工作流和输出质量，详细的教学规范应保存在相应的 `references/` 文件中。

## 样例要求

每个新学科至少追加：

- 两个正例：覆盖两类典型概念或难度。
- 一个易错反例：清楚描述不应遗漏的条件、边界或事实核验点。
- 一个视觉说明：指出图像应该解释什么，不把视觉当作装饰。

样例写入 `examples/input-output.md` 或在 `examples/<subject>.md` 新建文件。引用原文、代码或题目时，保留可核验的来源信息。

## 风格要求

- 主背景为白色或浅灰，正文以高对比深色呈现，橙色只承担强调含义。
- 禁止把密集文字、公式、代码或原文交给图像生成器拼写。
- 插图必须对应一个明确教学问题，例如“这个指针指向哪里？”或“平移后顶点如何变化？”。
- 句子尽量短，术语保持准确；不以空泛的“生动”“深刻”替代文本证据。

## Pull Request

PR 描述应包含：

```text
## What changed

## Why it improves learning accuracy or usability

## Validation
- [ ] ./scripts/validate-skill.sh
- [ ] Manual example reviewed
- [ ] No unlicensed third-party material added
```

维护者会优先审查事实准确性、可维护性、触发范围和对现有学科的影响。

