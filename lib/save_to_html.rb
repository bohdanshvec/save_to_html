class SaveToHtml

  def initialize(content, bypass_html = false, name = "index")
    @content = content
    @name = name
    @tag = bypass_html ? "script" : "p"
  end

  def create
    File.open(@name + ".html", "w") do |f|
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
    <#{@tag}>#{@content}</#{@tag}>
  </body>
</html>"
  end

end