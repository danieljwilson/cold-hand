'use strict';

const articleUrl = 'https://apandit42.github.io/datathon2021/ARTICLE.md'

let markdowntext;

fetch(articleUrl)
    .then(res => res.text())
    .then(text => {
        markdowntext = text;
    });

let converter = new showdown.Converter();

let html = converter.makeHtml(markdowntext);

document.querySelector('.article').innerHTML = html;