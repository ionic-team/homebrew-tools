class IonicCloud < Formula
  desc "Command-line tools to use all of Ionic's cloud products"
  homepage "https://ionic.io/docs/appflow/cli/overview"
  version "0.3.8"
  license "Copyright (C) Drifty, Co - All Rights Reserved"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://cdn.ionic.io/ionic-cloud-cli/releases/0.3.8/ionic-cloud_Darwin_arm64"
      sha256 "843f8ec3dd2cce049a2fb73606dda6388be3f2e032bc763ef1216cd5802e28af"
    else
      url "https://cdn.ionic.io/ionic-cloud-cli/releases/0.3.8/ionic-cloud_Darwin_x86_64"
      sha256 "217edf45eaf58ba3474dc908bbb657c059b5382b3012c7c342fd8a2424a69161"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://cdn.ionic.io/ionic-cloud-cli/releases/0.3.8/ionic-cloud_Linux_arm64"
        sha256 "c357e82712f129d7d00531a5402b26511fc431c7345d3c3b6b2258730f70d4d8"
      else
        raise "Unsupported architecture"
      end
      elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://cdn.ionic.io/ionic-cloud-cli/releases/0.3.8/ionic-cloud_Linux_x86_64"
        sha256 "bf9d5b14b557c44520bc3f95c25c0ecf1c3311178f7851d4d21e63ccae7b9d4d"
      else
        url "https://cdn.ionic.io/ionic-cloud-cli/releases/0.3.8/ionic-cloud_Linux_i386"
        sha256 "8aa26386dbf3a533f6b79897c80d38fcbe004c8cb55201cdf3242b6aca91e38d"
      end
    else
      raise "Unsupported architecture"
    end
  else
    raise "Unsupported operating system"
  end
  def install
    bin.install Dir["ionic-cloud_*"].first => "ionic-cloud"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/ionic-cloud --version").chomp
  end
end
