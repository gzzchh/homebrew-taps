class GetHash < Parser::Rewriter
  def on_var(node)
    if node.location.selector.eql?("sha256")
      remove(node.loc.selector)
      # replace(node.location.begin,"123")
      puts("找到SHA256")
    end
  end
end