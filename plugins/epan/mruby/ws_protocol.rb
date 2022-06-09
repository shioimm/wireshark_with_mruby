class WSProtocol
  FT_UINT8 = nil # Implement in ws_protocol.c
  BASE_DEC = nil # Implement in ws_protocol.c

  def self.configure
    # Implement in ws_protocol.c
  end

  def initialize
    # Implement in ws_protocol.c
  end

  def transport(transport_protocol)
    @transport = transport_protocol
  end

  def port(port_number)
    @port = port_number
  end

  def filter(filter_name = nil)
    @filter = filter_name || @name.downcase
  end

  def headers(header_fields)
    @headers = header_fields
  end

  def dissectors(&block)
    trunk = WSDissector.new(name: @name, depth: 1)
    trunk.instance_eval(&block)
    @dissectors = trunk
  end

  def dissector_depth
    @dissectors.max_depth + 1
  end

  def register!
    # Implement in ws_protocol.c
  end

  def dissect!
    # Implement in ws_protocol.c
  end
end
