---
layout: post
title: Useless Web Application Idea
categories:
- development
---

Build a web application to determine the similarity of programming among CrossFit affilates.

## How?

1. Use Box information from [CrossFit](https://www.crossfit.com/affiliate-list)
2. Use [BTWB Atom](http://beyondthewhiteboard.com/gyms/293-snoridge-crossfit/wods.atom) feeds to get each box's WOD information
3. Use ["The Girls"](https://wodwell.com/wods/?category=5) and ["Heros"](https://wodwell.com/wods/?category=7) as a baseline to evaluate each WOD using [Sorensen-Dice Coefficient](http://joecode.com/til/2016/12/20/sorensen-dice.html)
4. Rank each box based on their 3 most similar "Girls" or "Heros"

## Extra Fun

* On each box summary randomly generate some [newage bullshit](https://github.com/sebpearce/bullshit) content about how great CrossFit is.
* Identify the primary [Instagram](https://www.instagram.com/nadiashatila/) account for each box in order to embed some color on each Box summary page.

## Why?

> To Dominate the World Wide Web!