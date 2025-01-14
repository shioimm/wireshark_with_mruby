WSProtocol.configure("Foo") do
  transport :tcp
  port      4567
  filter    "foo"

  headers [
            { name:    :foo_pdu_type,
              label:   "FOO PDU Type",
              filter:  "foo.type",
              type:    WSProtocol::FT_UINT8,
              display: WSProtocol::BASE_DEC,
              dict:    { 1 => "Initialise", 2 => "Terminate", 3 => "Data" } },
            { name:    :foo_pdu_flag,
              label:   "FOO PDU Flags",
              filter:  "foo.flags",
              type:    WSProtocol::FT_UINT8,
              display: WSProtocol::BASE_HEX,
              dict:    nil },
            { name:    :foo_pdu_seqn,
              label:   "FOO PDU Sequence Number",
              filter:  "foo.seqn",
              type:    WSProtocol::FT_UINT16,
              display: WSProtocol::BASE_DEC,
              dict:    nil },
            { name:    :foo_pdu_initialip,
              label:   "FOO PDU Initial IP",
              filter:  "foo.initialip",
              type:    WSProtocol::FT_IPv4,
              display: WSProtocol::BASE_NONE,
              dict:    nil },
          ]

  dissectors do
    items [
            { header: :foo_pdu_type,
              size:   1,
              offset: 0,
              endian: WSDissector::ENC_BIG_ENDIAN,
              format: { type: :default } },
            { header: :foo_pdu_flag,
              size:   1,
              offset: 1,
              endian: WSDissector::ENC_BIG_ENDIAN,
              format: { type: :default } },
            { header: :foo_pdu_seqn,
              size:   2,
              offset: 2,
              endian: WSDissector::ENC_BIG_ENDIAN,
              format: { type: :default } },
            { header: :foo_pdu_initialip,
              size:   4,
              offset: 4,
              endian: WSDissector::ENC_BIG_ENDIAN,
              format: { type: :default } },
          ]

    sub("Foo subtree (1)") do
      items [
              { header:  :foo_pdu_type,
                size:    1,
                offset:  0,
                endian:  WSDissector::ENC_BIG_ENDIAN,
                display: :default },
              { header:  :foo_pdu_flag,
                size:    1,
                offset:  1,
                endian:  WSDissector::ENC_BIG_ENDIAN,
                display: :default },
              { header:  :foo_pdu_seqn,
                size:    2,
                offset:  2,
                endian:  WSDissector::ENC_BIG_ENDIAN,
                display: :default },
              { header:  :foo_pdu_initialip,
                size:    4,
                offset:  4,
                endian:  WSDissector::ENC_BIG_ENDIAN,
                display: :default },
            ]

      sub("Foo subtree inner") do
        items [
                { header:  :foo_pdu_type,
                  size:    1,
                  offset:  0,
                  endian:  WSDissector::ENC_BIG_ENDIAN,
                  display: :default },
                { header:  :foo_pdu_flag,
                  size:    1,
                  offset:  1,
                  endian:  WSDissector::ENC_BIG_ENDIAN,
                  display: :default },
                { header:  :foo_pdu_seqn,
                  size:    2,
                  offset:  2,
                  endian:  WSDissector::ENC_BIG_ENDIAN,
                  display: :default },
                { header:  :foo_pdu_initialip,
                  size:    4,
                  offset:  4,
                  endian:  WSDissector::ENC_BIG_ENDIAN,
                  display: :default },
             ]
      end
    end

    sub("Foo subtree (2)") do
      items [
              { header: :foo_pdu_type,
                size:   1,
                offset: 0,
                endian: WSDissector::ENC_BIG_ENDIAN },
              { header: :foo_pdu_flag,
                size:   1,
                offset: 1,
                endian: WSDissector::ENC_BIG_ENDIAN },
              { header: :foo_pdu_seqn,
                size:   2,
                offset: 2,
                endian: WSDissector::ENC_BIG_ENDIAN },
              { header: :foo_pdu_initialip,
                size:   4,
                offset: 4,
                endian: WSDissector::ENC_BIG_ENDIAN },
            ]
    end
  end
end
