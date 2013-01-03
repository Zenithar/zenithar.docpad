anEntry = (url, lastmod, freq) ->
  tag 'url', ->
    tag 'loc', "#{@site.url}#{url}"
    tag 'lastmod', lastmod
    tag 'changefreq', freq

text '<?xml version="1.0" encoding="utf-8"?>\n'
tag 'urlset', xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9', 'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance', 'xsi:schemaLocation':'http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd', ->
  anEntry '', @site.date.toISODateString(), 'weekly'
  siteDate = @site.date
  @getCollection('posts').forEach (document)->
    if document.get('encoding') != 'binary' and 0 is document.get('url').indexOf '/articles'
      anEntry document.get('url'), document.get('date').toISODateString(), 'never'
    else
      anEntry document.get('url'), siteDate.toISODateString(), 'weekly' 