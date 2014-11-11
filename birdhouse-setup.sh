#!/bin/sh -e

sudo salt-call state.highstate --local

# Local Variables:
# indent-tabs-mode: nil
# End:
# vim: ai et sw=4 ts=4