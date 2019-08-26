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
  