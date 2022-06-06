#include "config.h"
#include <epan/packet.h>

#include <mruby.h>
#include <mruby/compile.h>
#include "ws_protocol.c"

void proto_register_foo(void)
{
}

void proto_reg_handoff_foo(void)
{
  mrb_state *mrb = mrb_open();

  mrb_ws_protocol_start(mrb, "../plugins/epan/foo/config.foo.rb");

  mrb_close(mrb);
}
