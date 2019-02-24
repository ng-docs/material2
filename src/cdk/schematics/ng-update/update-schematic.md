# ng-update schematic

# ng-update 原理图（schematic）

**Note** The CDK ng-update schematic is the foundation for the Angular Material update
schematic. This is achieved by making the ng-update code for the CDK as abstract as possible.

**注意**：CDK ng-update 原理图是 Angular Material "更新"（update）原理图的基础。这是通过让 CDK 的 ng-update 代码尽可能抽象来实现的。

This means that this document also applies for the Angular Material `ng-update`.

这意味着本文档也适用于 Angular Material `ng-update`。

---

The `ng-update` schematic consists of multiple migration entry-points where every entry-point
targets a specific Angular CDK or Angular Material version.  

`ng-update` 原理图由多个迁移入口点组成，每个入口点都以一个特定的 Angular CDK 或 Angular Material 版本为目标。

As of right now, we have two migration entry-points that handle the breaking changes for the
given target version:  

到目前为止，我们有两个迁移入口点来处理指定目标版本的重大变更：

| Target Version | Description                        |
| -------------- | ---------------------------------- |
| 目标版本       | 说明                               |
| V6             | Upgrade from any version to v6.0.0 |
| V6             | 从任何版本升级到v6.0.0             |
| V7             | Upgrade from any version to v7.0.0 |
| V7             | 从任何版本升级到v7.0.0             |

Note that the migrations run *in order* if multiple versions are transitively targeted. For
example, consider an application which uses Angular Material v5.0.0. In case the developer runs
`ng update`, the Angular CLI **only** installs V7 and runs the V6 and V7 migrations in order.

注意，如果多个版本之间是可传递的，那么这些迁移就会*按顺序*运行。比如，在用 Angular Material v5.0.0 的应用时，如果开发人员运行了 `ng update`，那么 Angular CLI **只会**安装 V7，并按顺序进行 V6 和 V7 版本的迁移。

This shows that the we technically need to keep all migrations from V5 in this code base, because
the CLI usually only installs the latest version and expects all version migrations to be present.

这是为了说明为何我们在技术上需要在本代码库中保留所有的 V5 迁移，因为 CLI 通常只安装最新的版本，并期望其中包括所有版本的迁移。

## Update concept

## "更新"的概念

The goal of the update schematic is to automatically migrate code that is affected by breaking
changes of the target version. Most of the time, we can apply such automatic migrations, but
there are also a few breaking changes that cannot be migrated automatically.

"更新"原理图的目标是自动迁移那些被目标版本的破坏性变更影响到的代码。大多数情况下，我们可以使用这种自动迁移，但也有一些无法自动迁移的破坏性变更。

In that case, our goal should be to notify the developer about the breaking change that needs
developer attention.  

在这种情况下，我们的目标应该是让开发人员注意那些需要开发人员关注的破坏性变更。

## Transforming TypeScript files

## 转换 TypeScript 文件

In order to automatically migrate TypeScript source files, we take advantage of the `tslint`
which allows us to create custom rules that can:

为了自动迁移 TypeScript 的源文件，我们利用了`tslint`，它允许我们创建自定义规则：

* Easily `visit` specific types of TypeScript nodes (e.g. `visitClassDeclaration`)  

  轻松 `visit` 特定类型的 TypeScript 节点（例如 `visitClassDeclaration` ）

* Structure migrations based on the *upgrade data* or type of migration (different TSLint rules)  

  基于*升级数据*或迁移类型（另一些 TSLint 规则）进行结构迁移

* Easily apply replacements / fixes for specific TypeScript nodes.  

  轻松应用对特定 TypeScript 节点的替换/修复。

* Easily report breaking changes at TypeScript nodes that cannot be migrated automatically  

  轻松报告那些无法自动迁移的 TypeScript 节点的破坏性变更

* Double check for rule migrations (TSLint always runs rule again after migrations have been applied)  

  再次检查规则迁移（TSLint 总会在应用了迁移后再次运行规则）

There also other various concepts for transforming TypeScript source files, but most of them
don't provide a simple API for replacements and reporting. Read more about the possible
approaches below:

还有其他各种用于转换 TypeScript 源文件的概念，但是大多数概念都没有为替换和报告提供简单的API。对可能的方式作如下详细分析：

| Description                     | Evaluation                                                                                                                     |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| 说明                            | 评价                                                                                                                           |
| Regular Expressions             | Too brittle. No type checking possible. Regular Expression *can* be used in combination with some real AST walking             |
| 正则表达式                      | 太脆弱了。不能检查类型。正则表达式*可以*和一些真正的 AST walk 一起使用                                                             |
| TypeScript transforms (no emit) | This would be a good solution that avoids using TSLint. No simple API for reporting and visiting specific types of nodes       |
| TypeScript 转换（不报错）      | 当要避免使用 TSLint 时，这是一个好方案。但没有用于报告和访问特定类型节点的简单API                                          |
| Plain TypeScript AST            | This would be similar to the TypeScript transforms. Extra effort in creating the replacement API; reporting API; walking logic |
| 普通的 TypeScript AST            | 它和 TypeScript 转换类似。在创建替换 API、汇报 API、遍历逻辑时要付出额外的努力                                                       |

## Transforming CSS and HTML files

## 转换 CSS 和 HTML 文件

Since `TSLint` allows us to only visit TypeScript nodes, we can technically just apply migrations
for inline styles or templates which are part of the TypeScript AST. In our case, the update
schematic should also apply migrations for external templates or styles. In order to archive
this with TSLint, we have a customized implementation of a `TSLint.RuleWalker`. The custom
RuleWalker which is called `ComponentWalker` determines external templates and stylesheets from
the *component/directive* metadata.

由于 `TSLint` 只允许我们访问 TypeScript 节点，所以从技术上来说，我们可以直接应用内联样式或内联模板的迁移，因为它们是 TypeScript AST 的一部分。在我们的例子中，"更新"原理图也应该为外部模板或样式应用迁移。为了让 TSLint 也能处理它们，我们做了一个 TSLint.RuleWalker 的自定义实现。这个名为 `ComponentWalker` 的自定义 RuleWalker 会根据*组件/指令*的元数据来确定其外部模板和样式表。

The given resource files will then be wrapped inside of an in-memory TypeScript source file that
can be applied to the rule walker. This ensures that only referenced resource files will be
migrated and also allows us to take advantage of the simple replacement and reporting API from
TSLint.

然后，指定的资源文件将被封装在一个内存中的 TypeScript 源文件中，该文件可以应用到规则遍历器中。这样就可以确保只迁移被引用过的资源文件，并且还允许我们利用 TSLint 中的简单替换和报告 API。

This also makes the rule walker API consistent with the handling of inline resource files.    

这也使得此规则遍历 API 与对内联资源文件的处理保持一致。

```ts
// PSEUDO CODE
visitExternalTemplate(node: ts.SourceFile) {
  const parsedHtml = parse5.parse(node.getFullText());
  
  this._findOutdatedInputs(parsedHtml)
   .forEach(offsetStart => this._addExternalFailure(offsetStart, 'Outdated input', _myFix);}
```

### Upgrade data for target versions

### 升级目标版本的数据

The upgrade data for migrations is separated based on the target version. This is necessary in
order to allow migrations run sequentially. For example:  

迁移的升级数据是按照目标版本分开的。为了按顺序运行迁移，这是必要的。例如：

* In V6: `onChange` has been renamed to `changed`

  在 V6 中：`onChange` 已重命名为 `changed`

* In V7: `changed` has been renamed to `onValueChange`

  在 V7 中：`changed` 已重命名为 `onValueChange`

If we would not run the migrations in order, or don't separate the upgrade data, we would not be
able to properly handle the migrations for each target version. e.g. someone is on
5.0.0 and *only* wants to upgrade to 6.0.0. In that case he would end up with `onValueChange`
because the non-separated upgrade data would just include: *`onChange` => `onValueChange`*  

如果不按顺序运行迁移，或者不分开这些升级数据，我们就无法正确处理向每个目标版本的迁移。例如，某人在 5.0.0 上，只想升级到 6.0.0。在这种情况下，他最终得到 `onValueChange` 因为如果不分开它们，升级数据就只包括：*`onChange` => `onValueChange`*

Also besides separating the upgrade data based on the target version, we split the upgrade data
based on the type of code that is affected by these migrations:  

此外，除了按照目标版本分离升级数据之外，我们还要根据受这些迁移影响的代码类型拆分升级数据：

- See here: [src/lib/schematics/update/material/data](https://github.com/angular/material2/tree/master/src/lib/schematics/update/material/data)  

  看这里： [src/lib/schematics/update/material/data](https://github.com/angular/material2/tree/master/src/lib/schematics/update/material/data)

### Adding upgrade data

### 添加升级数据

Adding upgrade data is now a **mandatory** step before breaking changes should be merged
into `upstream`.  For simple and common breaking changes, there should be already an upgrade
data file that just needs the new change inserted.  

现在，添加升级数据是一个**强制性的**步骤，之后就应该把这些破坏性变更合并回 `upstream`。对于简单和常见的破坏性变更，应该已经有了一个升级数据文件，只需再插入新的变更即可。

In case there is no upgrade data for a breaking change, we need to evaluate if there should be
a single `misc` migration rule that is tied to that specific breaking change, or if we should
create a new migration rule in a more generic way.  

如果没有破坏性变更的升级数据，我们就要评估是否要写一个此破坏性变更专用的 `misc` 迁移规则，或者是否应该以更通用的方式创建一个新的迁移规则。

---

**Example**: Adding upgrade data for a property rename  
**Scenario**: In Angular Material V7.0.0, we rename `MatRipple#color` to `MatRipple#newColor`.

**示例**：为属性重命名添加升级数据  
**场景**：在 Angular Material V7.0.0 中，我们把 `MatRipple#color` 重命名为 `MatRipple#newColor` 。

First, look for an existing upgrade data file that covers similar breaking changes. In that case
an existing upgrade data file for `property-names` already exists. Insert the new breaking change
within the proper `VersionTarget`.  

首先，查找包含类似破坏性变更的现有升级数据文件。在这种情况下，`property-names` 的现有升级数据文件已经存在。在适当的 `VersionTarget` 中插入新的破坏性变更数据。

*src/lib/schematics/ng-update/material/data/property-names.ts*

```ts
export const propertyNames: VersionChanges<MaterialPropertyNameData> = {
  [TargetVersion.V7]: [
    {
      pr: '{PULL_REQUEST_LINK_FOR_BREAKING_CHANGE}',
      changes: [
        {
          replace: 'color',
          replaceWith: 'newColor',
          whitelist: {
            classes: ['MatRipple']
          }
        }
      ]
    }
  ],
   ...
};
```

Once the data is inserted into the upgrade data file, the update schematic will properly migrate
`MatRipple#color` to `MatRipple#newColor` if someone upgrades to Angular Material V7.0.0.  

把这些数据插入到升级数据文件中之后，如果有人要升级到 Angular Material V7.0.0，那么"更新"原理图就会把 `MatRipple#color` 正确地迁移到 `MatRipple#newColor`。

But that's not all. It's encouraged to add a test-case for the new migration data. In this case,
a test case already exists for the type of migration and we just need to add our breaking change
to it. Read more about adding a test case in the next section.  

但那还不是全部。我们鼓励为新的迁移数据添加一个测试用例。在这种情况下，已经存在一个针对迁移类型的测试用例了，我们只需要把我们的破坏性变更加入其中。欲知详情，请参阅下一节的"添加测试用例"。

### Adding a breaking change to a test case

### 为测试用例添加一个破坏性变更

Considering we added a breaking change to the update schematic, it's encouraged to add a proper
test case for the new change that has been added.   

由于我们已经在"更新"原理图中添加了一个破坏性变更，最好也为添加的这个新变更添加一个合适的测试用例。

In the scenario where a property from `MatRipple` has been renamed in V7, we don't need to create
a new test-case file because there is already a test case for the `property-names` upgrade data.
In that case, we just need to add the breaking change to the existing test case.  

在来自 `MatRipple` 的属性已经在 V7 中重命名的情况下，我们不需要创建一个新的测试用例文件，因为已经有了针对 `property-names` 升级数据的测试用例。这种情况下，我们只需要对现有的测试用例添加破坏性变更即可。

*src/lib/schematics/ng-update/test-cases/v7/property-names_input.ts*

```ts
...

/**
 * Mock definitions. This test case does not have access to @angular/material.
 */
class MatRipple {
  color: string;
}

/*
 * Actual test cases using the previously defined definitions.
 */
class A implements OnInit {
  constructor(private a: MatRipple) {}

  ngOnInit() {
    this.a.color = 'primary';
  }
}
```

*src/lib/schematics/ng-update/test-cases/v7/property-names_expected_output.ts*  

```ts
...

/**
 * Mock definitions. This test case does not have access to @angular/material.
 */
class MatRipple {
  color: string;
}

/*
 * Actual test cases using the previously defined definitions.   
 */
class A implements OnInit {
  constructor(private a: MatRipple) {}

  ngOnInit() {
    this.a.newColor = 'primary';
  }
}
```

**Note**: The `_input.ts` file will be just transformed by the V7 migrations and compared to
the `_expected_output.ts` file. This means that it's necessary to also include the no longer
valid mock declarations to the expected output file.

**注意** ：`_input.ts`文件只会被 V7 的迁移所转换，并与 `_expected_output.ts` 文件进行比较。这意味着还需要在预期的输出文件中包含已经失效的 mock 声明。

