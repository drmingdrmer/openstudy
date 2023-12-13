#!/usr/bin/env python
# coding: utf-8

# Build md into html to put pinyin on top of character

import sys
import re


def build(md_fn):
    html_fn = md_fn.rsplit('.')[0] + '.html'

    with open(md_fn, 'r') as f:
        lines = f.readlines()

    title = ""
    img = ""
    html_lines = []

    for line in lines:
        line = line.strip()

        if line == "":
            continue

        if line == '---':
            break

        # extract title
        if line.startswith('#'):
            title = line.lstrip('#').strip()
            continue

        # extract img
        img_match = re.match(r'!\[\]\((.*)\)', line)
        if img_match is not None:
            img = img_match.groups()[0]
            continue

        # handle lines

        html_lines.append('<p>')

        line = re.sub(r'([，。])', r'\1()', line)

        line = re.sub(r'(\S*?)\((.*?)\)', r' <span>\2<br/>&#8203;\1&#8203;</span> ', line)
        html_lines.append(line)

        html_lines.append('</p>')




    with open(html_fn, 'w') as f:
        f.write('<link rel="stylesheet" type="text/css" href="story.css" />' + '\n')
        f.write('<img src="{}"/>'.format(img) + '\n')
        f.write('<h2>{}</h2>'.format(title) + '\n')

        for line in html_lines:
            f.write(line + '\n')


if __name__ == "__main__":
    fn = sys.argv[1]

    build(fn)
