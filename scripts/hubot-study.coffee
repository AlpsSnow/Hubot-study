# Description:
#   Example scripts for study hubot.

module.exports = (robot) ->
  robot.hear /hello/i,(res)->
    res.send "hello,master"

  robot.respond /hi/i,(res)->
    res.reply "hi,master"

  robot.listen(
    (message)->
      console.log(message)
      if message.text is "test"
        true
      else
        false 
    (res)->
      res.send "This is a listen()"
  )
  robot.hear /ipconfig/i,(res)->
    child = require('child_process')
    bat = child.spawn('cmd.exe', ['/c', 'ipconfig'])
    bat.stdout.on('data', (data) ->
      console.log(iconv.decode(data, 'cp932'))
      res.send iconv.decode(data, 'cp932')
      )

    bat.stderr.on('data', (data) ->
      console.log(iconv.decode(data, 'cp932'))
      res.send iconv.decode(data, 'cp932')
      )

    bat.on('exit', (code) ->
      console.log("errcode: #{code}")
      res.send "errcode: #{code}"
      )  