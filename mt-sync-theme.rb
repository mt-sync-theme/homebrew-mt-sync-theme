require "formula"

HOMEBREW_MT_SYNC_THEME_VERSION='0.1.1'
class MtSyncTheme < Formula
  homepage "https://github.com/mt-sync-theme/mt-sync-theme"
  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.1/mt-sync-theme_v0.1.1_darwin_amd64.zip"
      sha1 "1932d3e4ebdd38f7b6df27e515db3be29cbc6c32"
    else
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.1/mt-sync-theme_v0.1.1_darwin_386.zip"
      sha1 "5fa7589275456b075edb78e1a7dd15905da1230a"
    end
  elsif OS.linux?
    if Hardware.is_64_bit?
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.1/mt-sync-theme_v0.1.1_linux_amd64.zip"
      sha1 "08af8cfa7b3d3b45f5989b5b5f267d0a82260d8d"
    else
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.1/mt-sync-theme_v0.1.1_linux_386.zip"
      sha1 "da9f40b7bb6526f5836c50b587ebbbadeb0d4244"
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
