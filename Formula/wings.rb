require 'json'

class Wings < Formula

  # 确定我的文件名 不包含扩展名
  filename = File.basename(__FILE__, File.extname(__FILE__,))
  # 确定仓库目录,其实就是向上跳转两次
  git_repository = File.dirname(File.dirname(__FILE__))
  # 确定版本信息文件
  json_file    = File.read("#{git_repository}/versions/#{filename}.json")
  version_info = JSON.parse(json_file)

  # 这里开始是 Formula 的部分
  desc "Pterodactyl Wings"
  homepage ""
  version(version_info["info"]["version"])
  url(version_info["info"]["linux"]["amd64"]["url"])
  sha256(version_info["info"]["linux"]["amd64"]["sha256"])
  license("MIT")

  def install
    filename       = File.basename(__FILE__, File.extname(__FILE__,))
    git_repository = File.dirname(File.dirname(__FILE__))
    # 在这一步,路径仍然是仓库路径
    system("echo", "#{git_repository}")
    # system("echo", "#{prefix}/version")
    # system("echo", "#{git_repository}/versions/#{filename}.json")
    bin.install "wings_linux_amd64" => "wings"
    # 安装版本信息
    system("mkdir", "-p", "#{prefix}/versions")
    system("cp", "#{git_repository}/versions/#{filename}.json", "#{prefix}/versions")
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test wings_linux_amd`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end

  def caveats
    on_macos do
      "不支持 macOS"
    end
  end
end
