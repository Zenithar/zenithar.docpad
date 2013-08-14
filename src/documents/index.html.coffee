--- 
layout: 'default'
date: '2000-1-1'
---
div style: 'display:none', -> h1 'Zenithar.org'

div '.row.hidden-sm.well', style: 'padding: 5px; margin-top: 15px;', ->
  div '.header', style: 'background-color: #000; text-align: center;', ->
    img '.img-responsive', src: '/images/header.png'

# Articles
section '.content.articles', ->
  i = 0
  @getCollection('posts').forEach (document) ->
    if document.get('encoding') != 'binary' and 0 is document.get('url').indexOf '/articles'
      i++
      if i > 10
        return
      article '.articles-item', style: 'padding-bottom: 1em;', ->
        # Date & Title
        div '.row.title', ->
          div '.col-lg-2.muted.modern-font.small-font', ->
            span property: 'dc:created', ->
              @helper.formatDate( document.get('date') ) + ' &raquo;'
          div '.col-lg-10', ->
            a '.index-article-title', href: document.get('url'), -> document.get('title')
        # Author & Info
        div '.row.subtitle', ->
          div '.col-offset-2.col-lg-10.modern-font.small-font.muted', ->
            text @partial 'article-footer.html.coffee', { document: document, helper: @helper }
        if i > 3
          return
        # First paragraph
        div '.row.hidden-sm.content', ->
          div '.col-offset-2.col-lg-10', ->
            if document.get('contentRenderedWithoutLayouts')
              text '<br/>'
              text @tool.summary document.get('contentRenderedWithoutLayouts')
            p -> a '.btn', href: document.get('url'), 'Suite &raquo;'

  div '.row', -> p '.col-offset-2.col-lg-10', -> a '.btn.btn-small.info.right', href: '/site/archive.html', 'Archives &raquo;'