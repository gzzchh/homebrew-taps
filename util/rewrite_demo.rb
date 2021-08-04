require 'parser/current'

class RemoveDo < Parser::TreeRewriter
  def on_while(node)
    # Check if the statement starts with "do"
    if node.location.begin.is?('do')
      remove(node.location.begin)
    end
  end
end

code = <<-EOF
while true do
  puts 'hello'
end
EOF

ast           = Parser::CurrentRuby.parse code
buffer        = Parser::Source::Buffer.new('(example)', source: code)
rewriter      = RemoveDo.new

# Rewrite the AST, returns a String with the new form.
puts rewriter.rewrite(buffer, ast)
