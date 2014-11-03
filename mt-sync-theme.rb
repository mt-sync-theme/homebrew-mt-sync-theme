require "formula"

HOMEBREW_MT_SYNC_THEME_VERSION='0.1.0'
class MtSyncTheme < Formula
  homepage "https://github.com/mt-sync-theme/mt-sync-theme"
  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.0/mt-sync-theme_v0.1.0_darwin_amd64.zip"
      sha1 "97b182f7f6bd88613ad2c36dd08e91d86dc4e4fe"
    else
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.0/mt-sync-theme_v0.1.0_darwin_386.zip"
      sha1 "6682509d102d90683eba0d43706138af43854013"
    end
  elsif OS.linux?
    if Hardware.is_64_bit?
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.0/mt-sync-theme_v0.1.0_linux_amd64.zip"
      sha1 "fca25587c9355422fc83d67b43b797955f6e6692"
    else
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.0/mt-sync-theme_v0.1.0_linux_386.zip"
      sha1 "30bd7f95b81cde6b054d07c7cd2f782cd190a5e4"
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
