#include "config.h"
#include <epan/packet.h>

#include "../plugins/epan/mruby/ws_protocol.c"

void proto_register_foo(void)
{
}

void proto_reg_handoff_foo(void)
{
  mrb_ws_protocol_start("../plugins/epan/foo/config.foo.rb");
}
