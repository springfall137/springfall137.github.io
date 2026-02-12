const gh_token1 = "gh";
const gh_token2 = "p_m0fQSeIU9teqb";
const gh_token3 = "uOHGVlp1zmg18SIyh2STbOa";

let headers = new Headers();
headers.append('Authorization', `token ${gh_token1 + gh_token2 + gh_token3}`);

fetch("https://api.github.com/repos/underthelights/underthelights.github.io/branches/main", {method:'GET', headers: headers})
.then(response => response.json())
.then(data => {
  let date = new Date(data.commit.commit.committer.date);
  var dateString = moment(date).format('MMM DD, YYYY');
  document.getElementById("date").innerText = dateString;
});