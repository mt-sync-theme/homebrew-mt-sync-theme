require "formula"

HOMEBREW_MT_SYNC_THEME_VERSION='0.1.5'
class MtSyncTheme < Formula
  homepage "https://github.com/mt-sync-theme/mt-sync-theme"

  if OS.mac?
    if Hardware.is_64_bit?
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.5/mt-sync-theme_v0.1.5_darwin_amd64.zip"
      sha1 "6ff89d0e76cefeaf29abb3294fd9a0a57be9d919"
    else
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.5/mt-sync-theme_v0.1.5_darwin_386.zip"
      sha1 "a3fae885537b24f0541ee8da61884087e6189ad9"
    end
  elsif OS.linux?
    if Hardware.is_64_bit?
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.5/mt-sync-theme_v0.1.5_linux_amd64.zip"
      sha1 "282f6ce2c8391ab4e1d5bb92447d3aad7da985df"
    else
      url "https://github.com/mt-sync-theme/mt-sync-theme/releases/download/v0.1.5/mt-sync-theme_v0.1.5_linux_386.zip"
      sha1 "772fa8d37ee86cd2553c1722c09939aef7c8f183"
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
