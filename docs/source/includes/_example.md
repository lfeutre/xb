# Example Usage

In order to use the LFE API, you need to have done the following:

1. Updated your XBee radio to have the API firmware installed
1. Configured your computer for serial communications with the XBee and know
   the serial device path
1. Plugged the XBee into your computer
1. Started the LFE REPL

<aside class="success">
Example "tips for success" text.
</aside>

<aside class="notice">
Example notice text.
</aside>

<aside class="idea">
Example idea text.
</aside>

<aside class="warning">
Example warning text.
</aside>

<aside class="danger">
Example danger text.
</aside>


## Raw Serial

```cl
> (xb:start)
#(ok started)
> (xb:open "/dev/tty.usbserial-DA01L2I5" `(#(speed 9600)))
#(ok opened)
> (xb:raw-send (binary #x7e #x00 #x04 #x08 #x52 #x4e #x4a #x0d))
#B(126 0 5 136 82 78 74 2 139)
> (xb:close)
#(ok closed)
```

If you want to, you have the option of by-passing the API modules
and simply making a direct call to the serial device.
