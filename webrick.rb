 # webrick.rb
require 'webrick'

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})

server.mount_proc("/time") do |req, res|
  body = "<html><body>#{Time.now}</body></html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_get") do |req, res|
  h = req.query
  # puts h
  body = "<html>
            <head>
              <meta charset='utf-8'>
            </head>
            <body>
              クエリパラメータは#{h}です。<br>
              こんにちは#{h['user_name']}さん。あなたの年齢は#{h['age']}ですね。
            </body>
          </html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_post") do |req, res|
  h = req.query
  # puts h
  body = "<html>
            <head>
              <meta charset='utf-8'>
            </head>
            <body>
              クエリパラメータは#{h}です。<br>
              こんにちは#{h['user_name']}さん。あなたの年齢は#{h['age']}ですね。
            </body>
          </html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.start
