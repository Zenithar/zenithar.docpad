authorLinks = @helper.genAuthors @document.get('author')
tagLinks = @helper.genTags @document.get('tags')

span "&nbsp; par #{authorLinks}"
text " | #{tagLinks} | "
span """<a href="#{@document.get('url')}#disqus_thread" data-disqus-identifier="#{@document.get('url')}"></a>"""