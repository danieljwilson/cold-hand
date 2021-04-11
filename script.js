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

const tsChart = toastui.Chart;

function makeVisOne() {
    const el = document.getElementById('vis1');
    const data = {
        categories: ['All', 'Public Four Year (60%)', 'Private Nonprofit Four Year (27%)', 'For Profit (9%)'],
        series: [
            {
                name: 'No Debt',
                data: [29, 31, 28, 13]
            },
            {
                name: '$1 to $9,999',
                data: [11, 11, 9, 7]
            },
            {
                name: '$10,000 to $19,999',
                data: [13, 14, 12, 8]
            },
            {
                name: '$20,000 to $29,999',
                data: [17, 18, 19, 11]
            },
            {
                name: '$30,000 to $39,999',
                data: [12, 12, 12, 14]
            },
            {
                name: '$40,000 to $49,999',
                data: [8, 6, 8, 15]
            },
            {
                name: '$50,000 or more',
                data: [11, 7, 12, 32]
            }
        ]
    };
    const options = {};
    const chart1 = tsChart.barChart({el, data, options});
}

makeVisOne();