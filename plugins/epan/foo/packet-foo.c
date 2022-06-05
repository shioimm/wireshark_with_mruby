#include "config.h"
#include <epan/packet.h>

#include <mruby.h>
#include <mruby/compile.h>

void proto_register_foo(void)
{
}

void proto_reg_handoff_foo(void)
{
  mrb_state *mrb = mrb_open();

  mrb_load_string(mrb, "puts 'Hello from mruby'");

  mrb_close(mrb);
}
