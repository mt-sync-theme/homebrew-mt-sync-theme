require "formula"

HOMEBREW_MT_SYNC_THEME_VERSION='0.1.4'
class MtSyncTheme < Formula
  homepage "https://github.com/mt-sync-theme/mt-sync-theme"

  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.4/mt-sync-theme_v0.1.4_darwin_amd64.zip"
      sha1 "13aae8fb168fabcbd54d086d18437cc5e2be9464"
    else
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.4/mt-sync-theme_v0.1.4_darwin_386.zip"
      sha1 "cab41e05322dd1f65a90964951ecdfa31f580db6"
    end
  elsif OS.linux?
    if Hardware.is_64_bit?
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.4/mt-sync-theme_v0.1.4_linux_amd64.zip"
      sha1 "9c4a07127a6f62e05bdc43c77ebe6bd323b8cce2"
    else
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.4/mt-sync-theme_v0.1.4_linux_386.zip"
      sha1 "9abd7385c875907406944e17d204bdb412e02e80"
    end
  end

  version HOMEBREW_MT_SYNC_THEME_VERSION
  head 'https://github.com/mt-sync-theme/mt-sync-theme.git', :branch => 'master'

  if build.head?
    depends_on 'go' => :build
    depends_on 'hg' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath
      mkdir_p buildpath/'src/github.com/mt-sync-theme'
      ln_s buildpath, buildpath/'src/github.com/mt-sync-theme/mt-sync-theme'
      system 'go', 'get'
      system 'go', 'build'
    end
    bin.install 'mt-sync-theme'
  end
end
