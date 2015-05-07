---
title: LFE xb API Reference

language_tabs:
  - lfe

toc_footers:
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - xbseries1
  - errors

search: true
---

# Introduction

<img src="images/just-xb.png" />

[Add notes about XBee]

[Add notes about the XBee API]

## Supported Versions

Currently only the API for Series 1 XBee radios is supported.


## LFE

[Add notes about LFE]

## Usage Scenarios

[Add notes]

## Additional Resources

 * [Building WSN with MQTT, RPi & Arduino](https://www.erlang-factory.com/upload/presentations/807/ZviMQTTS_for_EUC2013.pdf) (Erlang)
 * [XBee - XBee / XBee-PRO - RF Modules - 802.15.4 Protocol](http://ftp1.digi.com/support/documentation/90000982_S.pdf) - API Operation for the XBee/XBee-PRO RF Module, starts at page 89 (series 1)
 * [XBee / XBee-PRO - ZigBee RF Modules - XBEE2, XBEEPRO2, PRO S2B](http://ftp1.digi.com/support/documentation/90000976_W.pdf) - API Operation, starts at page 112 (series 2)
 * [XBee API Packet Generator](http://ftp1.digi.com/support/utilities/digi_apiframes2.htm)
 * [Java XBee library](https://code.google.com/p/xbee-api/)
 * [Python XBee library](https://github.com/markfickett/python-xbee)
 * [Node.js XBee library](https://www.npmjs.com/package/xbee-api)

# Setup

## XBee: Configuring the Radio

XBee Serie 1 has one set of firmware for both AT Command mode and API mode.
Hoever, to use API mode, you need to configurre your radio (using XCTU). In
particular, you will need to set ``AP`` to ``2`` (API enabled w/PPP).

## Computer: Configuring Serial Communications

> First thing you need to do is find out which device your XBee is:

```bash
$ ls -alrt /dev/tty*
```

If after listing the devices as shown on the right, you're not sure which of
those is your XBee, you can start up XCTU, scan for the device, and then
watch for the name it uses for that devicel.

## LFE: Starting the API

> If you are running xb code from another project, you will need to start the
> xb client:

```lisp
(xb:start)
```

If you are running the client from the LFE REPL in the xb project directory,
the client will have been started for you automatically by the ``repl`` and
``repl-no-deps`` make targets.



# Module Organization

The LFE xb library's collection of modules is viewable in the
[src](https://github.com/oubiwann/xb/tree/master/src)
directory. However, the files have appreviated names and there is no obvious
indication which module is associated with which frame type (or frame type
ID/API ID). This can be a bit awkward to view.

As such, we have provided two lists of modules below: one is sorted by frame
type and the other has similar modules grouped together by functionality.

## Orderedy Frame Type ID

Frame Type ID | Frame Type                          | LFE Module
------------- | ----------------------------------- | ------------------
``0xFF``      | Generic Frame                       | ``src/xb-gen.lfe``
``0x00``      | Tx64 Request                        | ``src/xb-tx64.lfe``
``0x01``      | Tx16 Request                        | ``src/xb-tx16.lfe``
``0x08``      | AT Command                          | ``src/xb-at.lfe``
``0x09``      | AT Command Queue Register Value     | ``src/xb-atq.lfe``
``0x10``      | Transmit Request                    | ``src/xb-txreq.lfe``
``0x11``      | Explicit Addressing Command Frame   | ``src/xb-expaddr.lfe``
``0x17``      | Remote AT Command                   | ``src/xb-atrem.lfe``
``0x20``      | TX IPv4                             | ``src/xb-txipv4.lfe``
``0x21``      | Create Source Route                 | ``src/xb-??.lfe``
``0x24``      | Register Joining Device             | ``src/xb-regjoin.lfe``
``0x80``      | Rx64 Indicator                      | ``src/xb-rx64.lfe``
``0x81``      | Rx16 Indicator                      | ``src/xb-rx16.lfe``
``0x82``      | DIO/ADC Rx64 Indicator              | ``src/xb-diorx64.lfe``
``0x83``      | DIO/ADC Rx16 Indicator              | ``src/xb-diorx16.lfe``
``0x84``      | 1-Wire Sensor Read-64 Indicator     | ``src/xb-1wire.lfe``
``0x85``      | ND Response Indicator               | ``src/xb-ndresp.lfe``
``0x86``      | Promiscuous Output Frame            | ``src/xb-pof.lfe``
``0x87``      | Remote AT Command Response          | ``src/xb-atremresp.lfe``
``0x88``      | AT Command Response                 | ``src/xb-atresp.lfe``
``0x89``      | Tx Status                           | ``src/xb-txstat.lfe``
``0x8A``      | Modem Status                        | ``src/xb-modemstat.lfe``
``0x8B``      | Tx Status                           | ``src/xb-txstat2.lfe``
``0x8D``      | Route Information Packet            | ``src/xb-rtinfo.lfe``
``0x8E``      | Aggregate Addressing Update         | ``src/xb-aggaddr.lfe``
``0x8F``      | IO Data Sample Rx Indicator         | ``src/xb-iosamprx.lfe``
``0x90``      | Receive Packet                      | ``src/xb-rx.lfe``
``0x91``      | Explicit Rx Indicator               | ``src/xb-exprx.lfe``
``0x92``      | IO Data Sample Rx Indicator         | ``src/xb-iosamprx2.lfe``
``0x94``      | XBee Sensor Read Indicator          | ``src/xb-snsr.lfe``
``0x95``      | Node Identification Indicator       | ``src/xb-nodeid.lfe``
``0x97``      | Remote Command Response             | ``src/xb-remresp.lfe``
``0xA0``      | Over-the-Air Firmware Update Status | ``src/xb-otastat.lfe``
``0xA1``      | Route Record Indicator              | ``src/xb-rtrec.lfe``
``0xA2``      | Device Authenticated Indicator      | ``src/xb-devauth.lfe``
``0xA3``      | Many to One Route Request Indicator | ``src/xb-rtreqm21.lfe``
``0xA4``      | Register Joining Device Status      | ``src/xb-regjoinstat.lfe``
``0xA5``      | Join Notification Status            | ``src/xb.joinstatlfe``
``0xB0``      | RX IPv4                             | ``src/xb-rxipv4.lfe``

## Grouped by Functionality

Frame Type ID | Frame Type                          | LFE Module
------------- | ----------------------------------- | ------------------
``0xFF``      | Generic Frame                       | ``src/xb-gen.lfe``
              |                                     |
``0x00``      | Tx64 Request                        | ``src/xb-tx64.lfe``
``0x01``      | Tx16 Request                        | ``src/xb-tx16.lfe``
``0x80``      | Rx64 Indicator                      | ``src/xb-rx64.lfe``
``0x81``      | Rx16 Indicator                      | ``src/xb-rx16.lfe``
              |                                     |
``0x08``      | AT Command                          | ``src/xb-at.lfe``
``0x09``      | AT Command Queue Register Value     | ``src/xb-atq.lfe``
``0x17``      | Remote AT Command                   | ``src/xb-atrem.lfe``
``0x88``      | AT Command Response                 | ``src/xb-atresp.lfe``
``0x87``      | Remote AT Command Response          | ``src/xb-atremresp.lfe``
``0x97``      | Remote Command Response             | ``src/xb-remresp.lfe``
              |                                     |
``0x10``      | Transmit Request                    | ``src/xb-txreq.lfe``
``0x8B``      | Tx Status                           | ``src/xb-txstat2.lfe``
``0x89``      | Tx Status                           | ``src/xb-txstat.lfe``
``0x90``      | Receive Packet                      | ``src/xb-rx.lfe``
``0x91``      | Explicit Rx Indicator               | ``src/xb-exprx.lfe``
              |                                     |
``0x11``      | Explicit Addressing Command Frame   | ``src/xb-expaddr.lfe``
``0x20``      | TX IPv4                             | ``src/xb-txipv4.lfe``
``0xB0``      | RX IPv4                             | ``src/xb-rxipv4.lfe``
              |                                     |
``0x21``      | Create Source Route                 | ``src/xb-??.lfe``
              |                                     |
``0x24``      | Register Joining Device             | ``src/xb-regjoin.lfe``
``0xA4``      | Register Joining Device Status      | ``src/xb-regjoinstat.lfe``
``0xA5``      | Join Notification Status            | ``src/xb.joinstatlfe``
              |                                     |
``0x82``      | DIO/ADC Rx64 Indicator              | ``src/xb-diorx64.lfe``
``0x83``      | DIO/ADC Rx16 Indicator              | ``src/xb-diorx16.lfe``
              |                                     |
``0x8F``      | IO Data Sample Rx Indicator         | ``src/xb-iosamprx.lfe``
``0x92``      | IO Data Sample Rx Indicator         | ``src/xb-iosamprx2.lfe``
              |                                     |
``0x84``      | 1-Wire Sensor Read-64 Indicator     | ``src/xb-1wire.lfe``
``0x94``      | XBee Sensor Read Indicator          | ``src/xb-snsr.lfe``
              |                                     |
``0x85``      | ND Response Indicator               | ``src/xb-ndresp.lfe``
``0x86``      | Promiscuous Output Frame            | ``src/xb-pof.lfe``
``0x8A``      | Modem Status                        | ``src/xb-modemstat.lfe``
``0x8E``      | Aggregate Addressing Update         | ``src/xb-aggaddr.lfe``
``0x95``      | Node Identification Indicator       | ``src/xb-nodeid.lfe``
``0xA0``      | Over-the-Air Firmware Update Status | ``src/xb-otastat.lfe``
``0xA2``      | Device Authenticated Indicator      | ``src/xb-devauth.lfe``
              |                                     |
``0x8D``      | Route Information Packet            | ``src/xb-rtinfo.lfe``
``0xA1``      | Route Record Indicator              | ``src/xb-rtrec.lfe``
``0xA3``      | Many to One Route Request Indicator | ``src/xb-rtreqm21.lfe``

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

<aside class="warning">
Example warning text.
</aside>

<aside class="danger">
Example danger text.
</aside>

