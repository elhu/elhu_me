$(document).ready(function () {
    var username = "elhu";
    var count = "4";
    var format = "json";
    var url = "http://api.twitter.com/1/statuses/user_timeline/" + username + "." + format + "?callback=?&count=" + count;
    $.getJSON(url, function(tweets) {
        var txt = "<ul>";
        for (var i = 0; i < tweets.length - 1; i++) {
            txt += "<li class='tweet'>" +  tweets[i].text + "</li>";
        }
        txt += "<li>" +  tweets[i].text + "</li>";
        txt += "</ul>";
        $("#tweets").html(txt);
     });
});