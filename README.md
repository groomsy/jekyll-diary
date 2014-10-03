jekyll-diary
=====

A Ruby CLI tool to help manage the process of creating drafts for your Jekyll blog and publishing them.

## Usage
### Create a Draft
```
$ jekyll-diary draft Some Draft Title
```
Running this command in the root of your Jekyll site will check to see if the `_drafts` directory exists. If it does not, it will create the directory first. Then it will create a new draft named `some-draft-title.md` with the following template:
```
---
layout: post
title: Some Draft Title
---

```