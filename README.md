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
