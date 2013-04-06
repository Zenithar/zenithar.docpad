moment = require 'moment'
_ = require 'underscore'
hl = require 'highlight.js'

moment.lang('fr')

to =
  value: (it) ->
    return it() if _.isFunction( it )
    it

## for locally access
    
authors =
  'zenithar':
    name: 'Thibault NORMAND'
    email: 'me@zenithar.org'
    github: 'zenithar'
    twitter: 'zenithar'
    gravata: '2694a5501ec37eab0c6d4bf98c30303a'

# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

    # =================================
    # Template Data
    # These are variables that will be accessible via our templates
    # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

    templateData:

        # Specify some site properties
        site:
            # The production url of our website
            url: "http://blog.zenithar.org"

            # The default title of our website
            title: "Il existe moins bien mais c'est plus cher !"

            # The website description (for SEO)
            description: """
                Ancien ingénieur sécurité passionné, acteur dans le monde du logiciel 'libre'. Je suis en veille technologique permanente car toujours à la recherche du 'meilleur tournevis'.
                """

            # The website keywords (for SEO) separated by commas
            keywords: """
                zenithar,toulouse,java,security,engineer
                """

            # The website author's name
            author: "Thibault NORMAND"

            # The website author's email
            email: "me@zenithar.org"

            disqusShortName: "zenithar"

        # helpers
        helper:
          formatDate: (date)->
            moment( date ).format('YYYY MMM DD')

          genTags: (tag)->
            return '' if !tag

            tags = tag
            tags = tag.split ',' if _.isString tag

            _.map(tags, (name)->
              name = name.trim()
              """<a href="/site/tagmap.html##{name.toLowerCase()}" class="tag">#{name}</a>"""
            ).join ' '

          genAuthors: (name)->
            name = 'zenithar' unless name?

            names = name
            names = name.split ',' if _.isString name

            _.map(names, (name)->
              name = name.trim()
              author = authors[ name ]
              return to.value(author.page) if author.hasOwnProperty( 'page' )
              """<a href="https://twitter.com/#{author.twitter}/">#{author.name}</a>"""
            ).join ', '
            
          genTwitter: (names) ->
            ret = []
            names = "zenithar" unless names?

            names = names.split ','

            for name in names
              name = name.trim()

              if authors.hasOwnProperty name
                ret.push '@' + authors[ name ].twitter

            ret.join ' '

        # tools
        tool:
            '_': _
            summary: (contentRendered) ->
                splited = contentRendered.split(/<h[123456]>/)
                splited[0]

        # -----------------------------
        # Helper Functions

        # Get the prepared site/document title
        # Often we would like to specify particular formatting to our page's title
        # we can apply that formatting here
        getPreparedTitle: ->
            # if we have a document title, then we should use that and suffix the site's title onto it
            if @document.title
                "#{@document.title} | #{@site.title}"
            # if our document does not have it's own title, then we should just use the site's title
            else
                @site.title

        # Get the prepared site/document description
        getPreparedDescription: ->
            # if we have a document description, then we should use that, otherwise use the site's description
            @document.description or @site.description

        # Get the prepared site/document keywords
        getPreparedKeywords: ->
            # Merge the document keywords with the site keywords
            @site.keywords.concat(@document.tags or []).join(', ')

    # =================================
    # Collections
    # These are special collections that our website makes available to us

    collections:
        # For instance, this one will fetch in all documents that have pageOrder set within their meta data
        pages: (database) ->
            database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

        # This one, will fetch in all documents that have the tag "post" specified in their meta data
        posts: (database) ->
            database.findAllLive({relativeOutDirPath:'articles'}, [date:-1])


    # =================================
    # DocPad Events

    # Here we can define handlers for events that DocPad fires
    # You can find a full listing of events on the DocPad Wiki
    events:

        # Ammend our Template Data
        renderBefore: ({collection, templateData}, next) ->
            #sorting documents 
            collection.comparator = (model) ->
                -model.get('date').getTime()
            collection.sort()

            # Continue onto the next plugin
            next()

    # =================================
    # Plugins

    # Enabled Plugins
    enableUnlistedPlugins: true

    # Configure Plugins
    plugins:

        # Enable NIB in the Stylus Plugin
        stylus:
            useNib: true

        robotskirt:

          inline: (src, hash, houdini)->
            out = src

            #for people
            out = out.replace /(^|[ \t]+)@([a-zA-Z0-9]+)/g, (whole, m1, m2) ->
              hash m1 + '<a href="https://twitter.com/' + m2 + '">@' + m2 + '</a>'

            #for hash tag·
            out = out.replace /(^|[ \t]+)#([a-zA-Z0-9]+)/g, (whole, m1, m2) ->
              hash m1 + '<a href="/site/tagmap.html#' + m2 + '">#' + m2 + '</a>'
              
            out

}


# Export our DocPad Configuration
module.exports = docpadConfig