require 'json'

class Wings < Formula

  filename       = File.basename(__FILE__, File.extname(__FILE__,))
  git_repository = File.dirname(File.dirname(__FILE__))
  json_file      = File.read("#{git_repository}/versions/#{filename}.json")
  version_info   = JSON.parse(json_file)

  # 这里开始是 Formula 的部分
  desc("Pterodactyl Wings")
  homepage("")
  version(version_info["info"]["version"])
  url(version_info["info"]["linux"]["amd64"]["url"])
  sha256(version_info["info"]["linux"]["amd64"]["sha256"])
  license("MIT")

  def install
    bin.install "wings_linux_amd64" => "wings"
    # 下面都是为了拷贝版本信息
    filename       = File.basename(__FILE__, File.extname(__FILE__,))
    git_repository = File.dirname(File.dirname(__FILE__))
    # system("echo", "#{git_repository}")
    system("mkdir", "-p", "#{prefix}/versions")
    system("cp", "#{git_repository}/versions/#{filename}.json", "#{prefix}/versions")
  end

  test do
  end

  def caveats
    on_macos do
      "不支持 macOS"
    end
  end
end
