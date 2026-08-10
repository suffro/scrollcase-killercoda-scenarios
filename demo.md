# Run a real Scrollcase box

The environment is ready.

The `box/` directory contains a real published Linux Scrollcase box and its signed release document.

The public key was obtained separately.

## 1. Verify it

Click the command below:

`cd ~/demo && scrollcase verify box/*.release.json --public-key keys/example-signing-public.json`{{exec}}

Scrollcase verifies the signed release and the artifact it commits to.

## 2. Run it

`cd ~/demo && scrollcase run box/*.release.json --public-key keys/example-signing-public.json`{{exec}}

The box is temporarily extracted and its entry point is executed using the Python interpreter contained inside the box.

That's it.