require 'parser/current'

class GetHash < Parser::TreeRewriter
  def on_const(node)
    if node.location.name.is?("CheckUpdate")
      puts("找到升级信息")
    end
  end
end

source = File.read("../Formula/wings.rb")
ast = Parser::CurrentRuby.parse(source)
buffer = Parser::Source::Buffer.new('(example)', source: source)
rewriter = GetHash.new
# puts ast
# puts rewriter.rewrite(buffer, ast)
rewriter.rewrite(buffer, ast)


