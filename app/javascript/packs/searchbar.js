const endpoint = "https://notacine-dvpt.herokuapp.com/movies.json"

movies = [];

fetch(endpoint)
    .then(data => data.json())
    .then(data => movies=data);


function findMatches(wordToMatch, movies) {
  return movies.filter(movie => {
    regex = new RegExp(wordToMatch, "gi");
    return movie.title.match(regex);
  })
}

function displayMatches(){
  matchArray = findMatches(this.value, movies);
  html = matchArray.map(movie => {
    regex = new RegExp(this.value, "gi");
    title = movie.title.replace(regex, `<span class="hl">${this.value}</span>`)
    return `<li><span class="autocomplete">${title}</span></li>`
  }).slice(0,5).join("");
  document.getElementById("search-results").classList.toggle("show-search", !!html.length)
  suggestions.innerHTML = html;
}

searchInput = document.querySelector("#search");
suggestions = document.querySelector("#search-results");

searchInput.addEventListener("change", displayMatches);
searchInput.addEventListener("keyup", displayMatches);
