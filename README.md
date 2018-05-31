# Homebrew Puppet

A tap for [Puppet](https://puppet.com) OSX packages

## How do I install these packages?

```
brew cask install puppetlabs/puppet/<package>
```

### Bolt

To install [Bolt](https://github.com/puppetlabs/bolt) with brew run

```
brew cask install puppetlabs/puppet/puppet-bolt
```

This will install bolt to `/opt/puppetlabs/bin/bolt`, so to use bolt add `/opt/puppetlabs/bin` to your path

```
export PATH=$PATH:/opt/puppetlabs/bin
```

### PDK

To install [PDK](https://github.com/puppetlabs/pdk) with brew:

```
brew cask install puppetlabs/puppet/pdk
```

This will install PDK into `/opt/puppetlabs/pdk` and add an entry into `/etc/paths.d` to add PDK to your
shell's PATH, however you may have to relaunch your terminal session before `pdk` can be found on your PATH.

If you use ZShell (zsh), you will have to take additional steps before `pdk` can be found on your PATH, see
the [PDK Troubleshooting](https://puppet.com/docs/pdk/1.x/pdk_troubleshooting.html#pdk-not-in-zshell-path-on-mac-os-x) docs
to learn more.
