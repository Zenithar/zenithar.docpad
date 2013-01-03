--- yaml
layout: default
---

article "#post.#{@document.class}", typeof: 'sioc:post', about: "#{@document.url}", lang: 'fr-fr', ->
	header ->
		h1 property: 'dcterms:title', "#{@document.title}"
	div property: 'sioc:content', -> "#{@content}"