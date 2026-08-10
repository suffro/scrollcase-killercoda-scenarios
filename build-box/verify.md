# Verify the box

Verify the signed release and run the self-test with the Python interpreter inside the box:

`scrollcase verify .scrollcase/dist/boxes/example-box/1.0.0/linux-x86_64-cpu/*.release.json --self-test`

This checks the signature, archive size and hash, safe archive entries, manifest agreement, and the
contained runtime.

[`verify` reference](https://scrollcase.dev/reference/cli#verify)

**Please wait until it is complete.**
