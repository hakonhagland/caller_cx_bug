#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

void test3() {
    const PERL_CONTEXT *cx = caller_cx(0, NULL);
    if ( cx != NULL ) {
        char *pack_name = HvNAME((HV*)CopSTASH(cx->blk_oldcop));
        printf( "My::Caller::test() : %s\n", pack_name );
    }
    else {
        printf( "My::Caller::test() : NULL\n" );
    }
}
  

MODULE = My::Caller	    PACKAGE = My::Caller
PROTOTYPES: DISABLE

void
test3 ()
        PREINIT:
        I32* temp;
        PPCODE:
        temp = PL_markstack_ptr++;
        test3();
        if (PL_markstack_ptr != temp) {
          PL_markstack_ptr = temp;
          XSRETURN_EMPTY;
        }
        return;

