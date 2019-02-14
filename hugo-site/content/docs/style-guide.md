+++
title = "Style Guide"
menutitle = "Style Guide"
description = "Documentation Contributions: Formatting and Quickstart Guide"
pre = "<i class='fa fa-font'></i>	"
+++

## Summary

Welcome to Project Trident!

This document is designed to unify the style of documentation contributions to Project Trident.
It outlines the tools needed for documentation and elements of style for the project.
The goal is to encourage contribution to the project by providing reference materials and guidelines, lowering the barriers to entry for new contributors.

### Quickstart

Contributors are encouraged to reference this style guide when writing Trident documentation.
Documentation Pull Requests are quickly reviewed for relevancy to the project, then merged.
Trident documentation will be periodically reviewed and edited to conform to this style guide.

All documentation is stored as Markdown files in the [trident-website](https://github.com/project-trident/trident-website/tree/master/hugo-site/content) repository on GitHub.
These files are published to http://www.project-trident.org as articles.

All articles must begin with a header block with a few specific elements:
```
+++
title = "Article Title"
menutitle = "Article title in website sidebar"
description = "Brief description of article. Appears on the website."
pre = "<i class='fa fa-font'></i>	"
+++
```
Every documentation file needs an introduction section explaining the goal of the document and a summary of the most useful procedure.

Trident Basic Style Elements:

| **Element**                                | **Markup**                                                          | **Example**                                                                                                                                          |
|--------------------------------------------|---------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Headings                                   | `#, ##, ###, ####, #####`                                           | ``` # Title of Document ## Main Section of Document ```                                                                                              |
| Empty space around paragraphs and elements | `Enter` key.                                                        | ``` # Example Section  Text for the example section.  New paragraph for the example. Ending this paragraph and section.  # Next Example Section  ``` |
| Links                                      | `[link text](www.full-link.com)`                                    | The `[Trident website](https://www.project-trident.org)`                                                                                             |
| Lists                                      | `1. OR #. OR - `                                                    | ``` 1. Enumerated list.    #. Autonumbered list.  - Unordered list. ```                                                                              |
| Images                                     | `![Text](URL)`                                                      | `![Project Trident](https://github.com/project-trident/trident-website/tree/master/hugo-site/static/images/logo.svg)`                                |
| Graphical Interface Item                   | \*\*Bold Text that Matches the Item Name Exactly\*\*                  | `**Insight** file manager`                                                                                                                           |
| Examples or an exact string to type        | One backtick (\`) for inline text. Three backticks (\`\`\`) for blocks. | "Open a terminal and type \`ls\`" becomes "Open a terminal and type `ls`" |
| Markdown Escape Character                  | \\                                                                   | `Use a backtick (\\`).`                                                                                                                               |

The rest of this document provides more details about Trident documentation tools and more guidelines for writing style.

## Documentation Tools and Publishing Process

This section outlines the tools that Trident uses to build and publish its documentation.

### Documentation Tools

Project Trident uses the [Hugo](https://gohugo.io/) site generator to create the [Project Trident](http://project-trident.org/) website.
The website is created from files stored in the [trident-website](https://github.com/project-trident/trident-website/tree/master/hugo-site) repository.
Documentation articles are written with the [Markdown](https://daringfireball.net/projects/markdown/) syntax.
The online GitHub web editor can be used to write and test Markdown files.
There is no requirement to download or use a text editing program.

### Publishing Process

All documentation articles are contained in the [/hugo-site/content](https://github.com/project-trident/trident-website/tree/master/hugo-site/content) directory of the [trident-website](https://github.com/project-trident/trident-website/tree/master/hugo-site) repository.
Adding a new file or editing an existing article will trigger rebuilding the website.
The website updates every <period of time>.

## Text Style

The following sections explain the different standards that Trident applies to documentation contributions.
These sections have a "top-down" approach, starting with universal elements that are applied to every file and zooming in to describe specific markup to use for text elements.

### Standard Elements for a Documentation File

Every Markdown file needs to include several elements:

- Date of last revision. Contributions to a file need to update this element.
- An introduction section that explains the goal of the document.
- A quickstart or summary section that provides very brief instruction to accomplish the most common or sought for task.
- Every document is to be written in English.
- Text is to be active, simplistic, and as brief as possible. This is to avoid confusing the reader and make translations simpler.
- Use empty lines to separate elements and text paragraphs.
- Sentences begin on a new line.

### Images and Tables

Store images in the [/static/images](https://github.com/project-trident/trident-website/tree/master/hugo-site/static/images) subdirectory of the hugo-site.
Create images as *.png* files and name them according to a descending order of description: `trident-installer-disk.png`
Image syntax in a Markdown file is `![image name(https://github.com/project-trident/trident-website/tree/master/hugo-site/static/images/exampleimage.png)`.

Table syntax is complex, but there are many [markdown table generators](https://www.tablesgenerator.com/markdown_tables) online to simplify creating tables.
Example table:

```
| Column 1 | Column 2 |
| -------- | -------- |
| Row 1    | Cell2    |
| R2, C3   | R2, C4   |
```

### Text Style

- Write in [complete sentences](https://www.le.ac.uk/oerresources/ssds/grammarguides/page_02.htm) with proper capitalization and punctuation.
- Use the [Oxford comma](https://en.oxforddictionaries.com/explore/what-is-the-oxford-comma/): `item 1, item 2, and item 3`
- Avoid contractions: ~~can't~~ > *cannot*
- Use [title case](https://experience.sap.com/files/guidelines/References/text_cap.htm) when appropriate: `# Title of a Document`, `Person Name`, and `Image Title or Caption`.
- Define an abbreviation before using it later in the document: `Use a hard drive with at least 100 Gibibytes (GiB) of space.`
- Always give proper attribution when quoting another document or person: `"You lose." - Calvin Coolidge`

### Typography

[Markdown syntax](https://daringfireball.net/projects/markdown/syntax) is very simple.

Here is a simple list of Markdown syntax elements provided by [markdownguide.org](https://www.markdownguide.org/cheat-sheet)

```
Headings: # H1
          ## H2
          ### H3

Bold: **bold text**

Italic: *italicized text*

Blockquote: > blockquote

Ordered List: 1. First item
              2. Second item
              3. Third item

Unordered List: - First item
                - Second item
                - Third item

Code: `code`

Horizontal Rule: ---

Link: [title](https://www.example.com)

Image: ![alt text](image.jpg)

Table:
       | Syntax | Description |
       | ----------- | ----------- |
       | Header | Title |
       | Paragraph | Text |

Fenced Code Block:
                   ```
                   {
                     "firstName": "John",
                     "lastName": "Smith",
                     "age": 25
                   }
                   ```

Footnote:	Here's a sentence with a footnote. [^1]

          [^1]: This is the footnote.

Heading ID: ### My Great Heading {#custom-id}

Strikethrough: ~~The world is flat.~~

Task List: - [x] Write the press release
           - [ ] Update the website
           - [ ] Contact the media
```

Here is specific syntax usage used by Project Trident:

- Emphasis: `*italic*`
- Name of a Specific Item: `**bold**`
- Examples: Inline \`code blocks\`

## Translations

Translation system is still to be determined.
Update this section when the translation system is finalized.

Translation files are stored in <link to translation files>.
<define any required tools to process or build translations, or make recommendations>
