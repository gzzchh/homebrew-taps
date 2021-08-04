require 'parser/current'
# 设定一些参数
Parser::Builders::Default.emit_lambda = true
Parser::Builders::Default.emit_procarg0 = true
Parser::Builders::Default.emit_encoding = true
Parser::Builders::Default.emit_index = true
Parser::Builders::Default.emit_arg_inside_procarg0 = true
Parser::Builders::Default.emit_forward_arg = true
Parser::Builders::Default.emit_kwargs = true
Parser::Builders::Default.emit_match_pattern = true
parser = Parser::CurrentRuby.new

class GetHash < Parser::TreeRewriter
  def on_send(node)
    if node.location.selector.is?("sha256")
      puts("找到SHA256")
      # 用子节点取出后面的参数值,
      # 但这里是个数组,第一个为自身变量名 第二个为后面的东西
      puts(node.children[2].loc.expression)
      # 不知道为什么会去掉引号 还是加上比较好
      replace(node.children[2].loc.expression,"\"1234\"")
      p("修改SHA256")
    end
  end
end

source = File.read("../Formula/wings.rb")
ast = Parser::CurrentRuby.parse(source)
buffer = Parser::Source::Buffer.new('(example)', source: source)
rewriter = GetHash.new
# puts ast
puts rewriter.rewrite(buffer, ast)
# rewriter.rewrite(buffer, ast)

