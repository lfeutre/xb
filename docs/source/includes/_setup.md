# Setup

## XBee: Configuring the Radio

XBee Serie 1 has one set of firmware for both AT Command mode and API mode.
Hoever, to use API mode, you need to configurre your radio (using XCTU). In
particular, you will need to set ``AP`` to ``2`` (API enabled w/PPP).


## Computer: Configuring Serial Communications

> First thing you need to do is find out which device your XBee is:

```bash
$ ls -1rt /dev/tty*
```

> If you just plugged your radio into a URB device, it should be pretty close
to the bottom of that listing:

```bash
...
/dev/tty.usbserial-DA01L2I5
...
```

If after listing the devices as shown on the right, you're not sure which of
those is your XBee, you can start up XCTU, scan for the device, and then
watch for the name it uses for that device. Once you have that name, you can
match it to the listing from the ``ls`` command to confirm.


## LFE: Starting the API

> If you are running xb code from another project, you will need to start the
> xb client:

```lisp
(xb:start)
```

If you are running the client from the LFE REPL in the xb project directory,
the client will have been started for you automatically by the ``repl`` and
``repl-no-deps`` make targets.


