--- 
layout: 'default'
date: '2000-1-1'
---
div style: 'display:none', -> h1 'Zenithar.org'

# Articles
section '.content.articles', ->
  i = 0
  @getCollection('posts').forEach (document) ->
    if document.get('encoding') != 'binary' and 0 is document.get('url').indexOf '/posts'
      i++
      if i > 10
        return
      article '.articles-item', style: 'padding-bottom: 1em;', ->
        # Date & Title
        div '.row', ->
          div '.span2.muted.modern-font.small-font', ->
            span property: 'dc:created', ->
              @helper.formatDate( document.get('date') ) + ' &raquo;'
          div '.span10', ->
            a '.index-article-title', href: document.get('url'), -> document.get('title')
        # Author & Info
        div '.row', ->
          div '.offset2.span10.modern-font.small-font.muted', ->
            text @layout 'article-footer', document
        if i > 3
          return
        # First paragraph
        div '.row.hidden-phone', ->
          div '.offset2.span10', ->
            if document.get('contentRenderedWithoutLayouts')
              text '<br/>'
              text @tool.summary document.get('contentRenderedWithoutLayouts')
            p -> a '.btn.btn-mini.pull-right', href: document.get('url'), 'Suite &raquo;'

  div '.row', -> p '.offset2.span10', -> a '.btn.btn-mini.info.right', href: '/site/archive.html', 'Archives &raquo;'