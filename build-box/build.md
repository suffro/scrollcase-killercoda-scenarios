# Sign and build

Create a local Ed25519 signing key:

`scrollcase keygen`

Then build the locked Linux CPU box:

`scrollcase build example-box/linux-x86_64-cpu --weights embed`

Scrollcase installs the locked environment, runs the self-test with the box's own Python, creates
the deterministic archive, and signs its release document.

[`keygen` reference](https://scrollcase.dev/reference/cli#keygen) ·
[`build` reference](https://scrollcase.dev/reference/cli#build)

**Please wait until the build is complete.**
