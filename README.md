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

### Puppet Agent

To install the very latest [Puppet Agent](https://github.com/puppetlabs/puppet-agent) with brew:

```
brew cask install puppetlabs/puppet/puppet-agent
```

Additionally we maintain versioned casks for each collection
- `puppetlabs/puppet/puppet-agent-5`
- `puppetlabs/puppet/puppet-agent-6`

## Migrating from pre-tap installations

If you previously installed the PDK or Bolt from homebrew before this tap existed, you will see errors about the keg not existing or the cask already being installed.

To remedy that, simply add the `puppetlabs/puppet` tap after updating homebrew:

```
brew update
brew tap puppetlabs/puppet
```

After tapping, you can refer to the packages by their short name when interacting with them. For example:

```
brew cask upgrade pdk
```

## Updating versions

When new versions of packages are shipped, you can use a Rake task to update the Cask to the latest version and SHAs

```
rake 'brew:cask[puppet-bolt]'
```

To update the versioned casks - for example `puppet-agent-5` - include the collection as a 2nd argument
```
rake 'brew:cask[puppet-agent,5]'
```

You can test updated Cask files with
```
brew cask install Casks/puppet-bolt.rb --force
```
