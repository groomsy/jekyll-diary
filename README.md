jekyll-diary
=====

A Ruby CLI tool to help manage the process of creating drafts for your Jekyll blog and publishing them. This tool assumes that your Jekyll blog is in a Git repository and pushing a post to the remote origin will automatically publish it (i.e. Jekyll with Github Pages).

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

### Publish a Draft
```
$ jekyll-diary publish some-draft-title.md
```
Running this command in the root of your Jekyll site will check to see if it can find the mentioned draft (you can either just specify the draft filename or the filepath, i.e. `_drafts/some-draft-title.md`). If it finds the draft, the draft will be moved from the `_drafts` director to the `_posts` directory and the filename will be prefixed with the current date in `YYYY-mm-dd` format. After this, the change will be committed and pushed to the remote origin.
