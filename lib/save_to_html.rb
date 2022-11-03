require 'sanitize'

class SaveToHtml

  def initialize(content:, bypass_html: true, name: "index")
    @content = bypass_html ? Sanitize.fragment(content) : content
    @file_name = name + Time.now.to_s
  end


  def create
    File.open(@file_name + ".html", "w") do |f|
      f.write(template)
    end
  end
 
 private

  def template
"<!DOCTYPE html>
<html lang=\"en\">
  <head>
    <meta charset=\"utf-8\">
    <title>Тестовая страница</title>
  </head>
  <body>
    #{@content}
  </body>
</html>"
  end

end