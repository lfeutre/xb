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
> (set tty (cereal:start "/dev/tty.usbserial-DA01L2I5" `(#(speed 9600))))
<0.32.0>
> (cereal:send tty (binary #x7e #x00 #x04 #x08 #x52 #x4e #x4a #x0d))
#(send #B(126 0 4 8 82 78 74 13))
```
