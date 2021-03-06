doctype 5
html lang: 'fr', ->
  head ->
    comment 'Meta'
    meta charset: 'utf-8'
    meta 'http-equiv': 'X-UA-Compatible', content: 'IE=edge,chrome=1'
    meta 'http-equiv': 'content-type', content: 'text/html; charset=utf-8'
    meta name: 'viewport', content: 'width=device-width, initial-scale=1'

    if @document.meta.layout is 'post' or @document.meta.layout is 'author'
      #document has own title, articles or authors
      title "Zenithar.org - #{@document.meta.title}"
      meta name: 'description', content: @getPreparedDescription()
      meta name: 'keywords', content: @getPreparedKeywords()
      meta name: 'author', content: 'Thibault NORMAND'
    else
      #document has not own title, not articles or authors
      title "Zenithar.org - #{@site.title}"
      meta name: 'description', content: @getPreparedDescription()
      meta name: 'keywords', content: @getPreparedKeywords()
      meta name: 'author', content: 'Thibault NORMAND'


    comment 'Icons'
    link rel: 'shortcut icon', href: 'images/favicon.ico'
    link rel: 'apple-touch-icon', href: 'images/apple-touch-icon.png'
    link rel: 'apple-touch-icon', sizes: '72x72', href: 'images/apple-touch-icon-72x72.png'
    link rel: 'apple-touch-icon', sizes: '114x114', href: 'images/apple-touch-icon-114x114.png'

    link rel: 'alternate', type: 'application/atom+xml', title: "Zenithar.org &raquo; Feed", href: 'http://feeds.feedburner.com/ZenitharOrg'

    comment 'Shims: IE6-8 support of HTML5 elements'
    comment '[if lt IE 9]>\n        <script async src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>\n    <![endif]'
    comment 'Styles'

    link rel: 'stylesheet', href: '//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/css/bootstrap.min.css', media: 'screen, projection'
    link rel: 'stylesheet', href: '/styles/style.css', media: 'screen, projection'
    link rel: 'stylesheet', href: '/styles/markdown.css', media: 'screen, projection'
    link rel: 'stylesheet', href: 'http://yandex.st/highlightjs/7.3/styles/github.min.css', media: 'screen, projection'
    
    #link rel: 'stylesheet', href: '/styles/print.css', media: 'print'

    #text @blocks.styles.join('')

    comment 'Scripts'

    script src: '//cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js'
    script src: '//cdnjs.cloudflare.com/ajax/libs/respond.js/1.2.0/respond.min.js'
    script src: '//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js'
    script src: "//connect.facebook.net/fr_FR/all.js#xfbml=1"
    script src: '//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/js/bootstrap.min.js'

    #text @blocks.scripts.join('')

  body ->
    comment 'Topbar'
    div '.navbar.navbar-static-top', ->
      div '.container', ->
        button '.navbar-toggle', 'type':'button', 'data-toggle':'collapse', 'data-target':'.navbar-responsive-collapse', ->
          span '.icon-bar', ''
          span '.icon-bar', ''
          span '.icon-bar', ''

        a '.navbar-brand', href: '/', 'Zenithar.org'

        div '.nav-collapse.collapse.navbar-responsive-collapse', ->
          ul '.nav.navbar-nav', ->
            li -> a href: '/site/tagmap.html', 'Tagmap'
            li -> a href: '/site/archive.html', 'Archives'
            li -> a href: 'http://zenithar.org', rel: 'me', 'CV'
            li -> a href: 'http://feeds.feedburner.com/ZenitharOrg', ->
              img src: '/images/rss_32.png', style: 'width: 24px'

          form '#search-form.navbar-form.pull-right', action: 'http://google.com/search', method: 'get', ->
            input type: 'hidden', name: 'q', value: 'site:www.zenithar.org'
            input '#search-query.form-control', type: 'text', name: 'q', results: '0', placeholder: 'Search'

    comment 'Markup'
    div '.container', ->
      div ->
        @content

    footer '.footer', ->
      div '.container', ->
        div '.row', ->
          p 'Copyright &copy; 2005-2013 Thibault NORMAND, motorisé par <a href="https://github.com/balupton/docpad">Docpad</a>, versionné par <a href="https://github.com/Zenithar/zenithar.docpad">Github</a>.'

    comment 'DISQUS'
    script ->
      """
      var disqus_shortname = '#{@site.disqusShortName}';
      (function () {
          var s = document.createElement('script'); s.async = true;
          s.type = 'text/javascript';
          s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
          (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
      }());
      """

    comment 'GA'
    script ->
      """
      if( '#{@site.url}' === 'http://' + window.location.hostname ) {
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-8114245-1']);
        _gaq.push(['_trackPageview']);

        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
      }
      """