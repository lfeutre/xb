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
