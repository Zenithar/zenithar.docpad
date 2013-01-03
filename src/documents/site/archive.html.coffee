--- yaml
layout: 'default'
title: 'Archive'
---

helper=@helper

style rel: 'stylesheet', media: 'screen, projection', scoped: 'scoped', ->
  """
  .article_footer {
    margin-left: 10px;
  }
  """

h1 "Archives"

section ".archive", ->
  @getCollection('posts').forEach (document) ->
    if document.get('encoding') != 'binary' and 0 is document.get('url').indexOf '/posts'
      tagLinks = helper.genTags document.get('tags')
      authorLinks = helper.genAuthors document.get('author')
      
      div '.row-fluid', ->
        div '.span2', helper.formatDate( document.get('date') )
        div '.span10.archive-item', ->
          a href: document.get('url'), property: 'dc:title', ->
            strong "#{document.get('title')}"
          div '.article_footer .modern-font .small-font', -> 
            text " posted in #{tagLinks} by #{authorLinks}"
