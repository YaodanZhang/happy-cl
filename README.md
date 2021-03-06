Handy Scripts
---

## Dependencies & Prerequisites

- [jq][1]
- [Openshift Client][2]
- [1Password Command Line Tool][3] with the proper [Setup](op-origin)
- [oathtool][4]

## Setup

- Add this folder to `$PATH`
- Move [.profile.sample](.profile.example) to `.profile` and change the
  required configuration.

## Scripts

- 1Password Command Line tool wrapper with session cached: [op](op)
- Openshift client auto login with 1Password: [ol](ol)
- Zoom quick starter: [z](z)
- IntelliJ IDEA quick starter: [idea](idea)
- Connect to VPN: [vpn](vpn)

[1]: https://stedolan.github.io/jq/
[2]: https://github.com/openshift/origin/releases
[3]: https://1password.com/downloads/command-line/
[4]: https://www.nongnu.org/oath-toolkit/
