# Homebrew Puppet

A tap for [Puppet](https://puppet.com) macOS packages

- [How do I install these packages?](#how-do-i-install-these-packages)
  - [Bolt](#bolt)
  - [PE Client Tools](#pe-client-tools)
  - [PDK](#pdk)
  - [Puppet Agent](#puppet-agent)
  - [Wash](#wash)
  - [Relay](#relay)
- [Migrating from pre-tap installations](#migrating-from-pre-tap-installations)
- [Updating versions](#updating-versions)
  - [Updating pe-client-tools](#updating-pe-client-tools)

## How do I install these packages?

```bash
brew install --cask puppetlabs/puppet/<package>
```

### Bolt

To install [Bolt](https://github.com/puppetlabs/bolt) with brew run

```bash
brew install --cask puppetlabs/puppet/puppet-bolt
```

This will install bolt to `/opt/puppetlabs/bin/bolt`, so to use bolt add `/opt/puppetlabs/bin` to your path

```bash
export PATH=$PATH:/opt/puppetlabs/bin
```

#### Installing Bolt 2.x

To install Bolt 2.x, run

```bash
brew tap puppetlabs/puppet
brew install puppet-bolt@2
```

### PE Client Tools

To install the latest version of [PE Client Tools](https://puppet.com/docs/pe/latest/installing_pe_client_tools.html) run

```bash
brew install puppetlabs/puppet/pe-client-tools
```

To install the client tools for PE 2021, run

```bash
brew install puppetlabs/puppet/pe-client-tools
```

This will install the standalone commands from pe-client-tools to `/opt/puppetlabs/bin` so you'll need to have `/opt/puppetlabs/bin` in your path. All the commands are also available via a puppet face if you have the puppet-agent installed too.

### PDK

To install [PDK](https://github.com/puppetlabs/pdk) with brew:

```bash
brew install --cask puppetlabs/puppet/pdk
```

This will install PDK into `/opt/puppetlabs/pdk` and add an entry into `/etc/paths.d` to add PDK to your
shell's PATH, however you may have to relaunch your terminal session before `pdk` can be found on your PATH.

If you use ZShell (zsh), you will have to take additional steps before `pdk` can be found on your PATH, see
the [PDK Troubleshooting](https://puppet.com/docs/pdk/1.x/pdk_troubleshooting.html#pdk-not-in-zshell-path-on-mac-os-x) docs
to learn more.

#### Installing PDK 1.x

To install the latest PDK 1.x release, run

```bash
brew tap puppetlabs/puppet
brew install pdk@1
```

### Puppet Agent

To install the very latest [Puppet Agent](https://github.com/puppetlabs/puppet-agent) with brew:

```bash
brew install puppetlabs/puppet/puppet-agent
```

Additionally we maintain versioned casks for each collection
- `puppetlabs/puppet/puppet-agent-6`
- `puppetlabs/puppet/puppet-agent-7`

### Wash

To install [Wash](https://github.com/puppetlabs/wash) with brew:

```bash
brew install puppetlabs/puppet/wash
```

This will build Wash (with Go) and install it to `/usr/local/bin/wash`.

### Relay

To install the CLI tool to interact with [Relay](https://relay.sh):

```bash
brew install puppetlabs/puppet/relay
```

This will install the relay CLI from the binary builds produced at 
[@puppetlabs/relay](https://github.com/puppetlabs/relay) - no local build tools are required.

## Migrating from pre-tap installations

If you previously installed the PDK or Bolt from homebrew before this tap existed, you will see errors about the keg not existing or the cask already being installed.

To remedy that, simply add the `puppetlabs/puppet` tap after updating homebrew:

```bash
brew update
brew tap puppetlabs/puppet
```

After tapping, you can refer to the packages by their short name when interacting with them. For example:

```bash
brew upgrade pdk
```

## Updating versions

When new versions of packages are shipped, you can use a Rake task to update the Cask to the latest version and SHAs

```bash
rake 'brew:cask[puppet-bolt]'
```

To update the versioned casks - for example `puppet-agent-6` - include the collection as a 2nd argument

```bash
rake 'brew:cask[puppet-agent,6]'
```

You can test updated Cask files with

```bash
brew install Casks/puppet-bolt.rb --force
```

### Updating pe-client-tools

Right now, pe-client-tools live in a location that can't be browsed so we needed a different rake task for it. There is a variable for the latest / default version of PE and a hash that defines the pe-client-tools version associated with each PE version.

To pull down a new version of the client tools you will first want to update the variables in the Rakefile and then run one of these commands:

```bash
# utilize the LATEST_PE variable
rake brew:pe_client_tools

# Update the individual PE collections
rake 'brew:pe_client_tools[2019.8]'
```

Internally, we can look for the available versions by poking around on http://builds.puppetlabs.lan/pe-client-tools/
