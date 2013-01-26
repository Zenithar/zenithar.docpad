module.exports = (BasePlugin) ->

    class BootstrapAlertPlugin extends BasePlugin
        name: 'bootstrapalert'
    
        renderAlert = (opts, next) ->
            {content} = opts
            opts.content = content.replace /\[info\](.*)\[\/info\]/g, (whole, m1) ->
                return '<div class="alert alert-info">' + m1 + '</div>'
            return next()

        renderDocument: (opts, next) ->
            {extension, file} = opts
            if file.type is 'document' and extension is 'html'
                renderAlert opts,next
            else
                return next()