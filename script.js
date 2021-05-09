'use strict';

let setInnerHTML = function(elm, html) {
    elm.innerHTML = html;
    Array.from(elm.querySelectorAll("script")).forEach( oldScript => {
      const newScript = document.createElement("script");
      Array.from(oldScript.attributes)
        .forEach( attr => newScript.setAttribute(attr.name, attr.value) );
      newScript.appendChild(document.createTextNode(oldScript.innerHTML));
      oldScript.parentNode.replaceChild(newScript, oldScript);
    });
};

function applyVis() {
    const v0Html = '<div class="flourish-embed flourish-chart" data-src="visualisation/5894229"><script src="https://public.flourish.studio/resources/embed.js"></script></div>';
    const vel0 = document.getElementById('vis0');
    setInnerHTML(vel0, v0Html);

    const v1Html = `<div class="flourish-embed flourish-chart" data-src="visualisation/5894910"><script src="https://public.flourish.studio/resources/embed.js"></script></div>`;
    const vel1 = document.getElementById('vis1');
    setInnerHTML(vel1, v1Html);
    // vel1.innerHTML = v1Html;

    const v2Html = `<div class="flourish-embed flourish-chart" data-src="visualisation/6096181"><script src="https://public.flourish.studio/resources/embed.js"></script></div>`;
    const vel2 = document.getElementById('vis2');
    // vel2.innerHTML = v2Html;
    setInnerHTML(vel2, v2Html);

    const v3Html = `<div class="flourish-embed flourish-scatter" data-src="visualisation/5820490"><script src="https://public.flourish.studio/resources/embed.js"></script></div>`;
    const vel3 = document.getElementById('vis3');
    vel3.innerHTML = v3Html;

    const v4Html = `<div class="flourish-embed flourish-chart" data-src="visualisation/5821145"><script src="https://public.flourish.studio/resources/embed.js"></script></div>`;
    const vel4 = document.getElementById('vis4');
    vel4.innerHTML = v4Html;
    
    const v5Html = `<div class="flourish-embed flourish-chart" data-src="visualisation/5820737"><script src="https://public.flourish.studio/resources/embed.js"></script></div>`;
    const vel5 = document.getElementById('vis5');
    vel5.innerHTML = v5Html;
    
    const v6Html = `<div class="flourish-embed flourish-table" data-src="visualisation/5820751"><script src="https://public.flourish.studio/resources/embed.js"></script></div>`;
    const vel6 = document.getElementById('vis6');
    vel6.innerHTML = v6Html;
}

async function getArticleText() {
    const articleUrl = 'https://danieljwilson.github.io/cold-hand/ARTICLE.md';
    let resp = await fetch(articleUrl);
    let rawMarkDown = await resp.text();
    let converter = new showdown.Converter();
    let articleHtml = converter.makeHtml(rawMarkDown);
    let articleTag = document.querySelector('.article__body')
    articleTag.innerHTML = articleHtml;
    applyVis();
}

getArticleText();

