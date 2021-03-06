var request = require('request'),
    cheerio = require("cheerio"),
    iconv = require('iconv-lite');

var boardName = process.argv[2];
var bbsurl = "";
if (boardName === "") {
    bbsurl = "https://bbs.byr.cn/rss/topten";
} else {
    bbsurl = "https://bbs.byr.cn/rss/board-" + boardName;
}
var tmp = "<?xml version=\"1.0\"?><items>";

request({
    url: bbsurl,
    encoding: null
}, function(err, res, body) {
    if (err) {
        console.log('err happens');
        return;
    }
    var gbkHtml = iconv.decode(body, 'gb2312')
    var $ = cheerio.load(gbkHtml, {
        decodeEntities: false,
        xmlMode: true
    });
    $('item').each(function(idx, element) {
        var el = $(element);
        var title = el.find("title").text(),
            link_url = el.find("link").text(),
            author = el.find("author").text(),
            index = idx + 1;
        if (index > 10) {
            return false;
        }
        tmp += "<item uid=\"top" + index + "\" arg=\"" + link_url + "\" valid=\"yes\" autocomplete=\"" + title + "\"><title>" + title + "</title><subtitle>" + author + "</subtitle><icon>icon.png</icon></item>";
    });
    tmp = tmp + "</items>";
    console.log(tmp);
});