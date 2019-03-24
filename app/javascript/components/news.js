const NewsAPI = require('newsapi');

const newsapi = new NewsAPI(process.env.NEWS_KEY);
const news = () => {
  newsapi.v2.topHeadlines({
    sources: 'le-monde,liberation,les-echos'
  }).then(response => {
    document.getElementById("title").innerText = response.articles[0].title;
    document.getElementById("description").innerText = response.articles[0].description;
    document.getElementById("news-img").src=response.articles[0].urlToImage;
    for (let i=1; i<response.articles.length; i++) {
      setTimeout( function timer(){
        document.getElementById("title").innerText = response.articles[i].title;
        document.getElementById("description").innerText = response.articles[i].description;
        document.getElementById("news-img").src=response.articles[i].urlToImage;
      }, i*15000 );
    }
    console.log(response);
  });
}

export { news };