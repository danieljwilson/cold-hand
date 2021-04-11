'use strict';

async function getArticleText() {
    const articleUrl = 'https://apandit42.github.io/datathon2021/ARTICLE.md';
    let resp = await fetch(articleUrl);
    let rawMarkDown = await resp.text();
    let converter = new showdown.Converter();
    let articleHtml = converter.makeHtml(rawMarkDown);
    let articleTag = document.querySelector('.article__body')
    articleTag.innerHTML = articleHtml;
}

getArticleText();