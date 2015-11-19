/* Linker script to undo -split-sections and merge all sections together when
 * linking relocatable object files for GHCi. This gives GHCi's linker less
 * work to do.
 * ld -r normally retains the individual sections, which is what you would want
 * if the intention is to eventually link into a binary with --gc-sections, but
 * it doesn't have a flag for directly doing what we want. */

/* *Insert* our linker script into the default script rather than replacing it
 * entirely. This is needed on Windows because object files and image files use
 * different formats there - and ld -r relies on the linker script to specify
 * the object file format. */
INSERT AFTER .text;

SECTIONS
{
    .text : {
        *(.text*)
    }
    .rodata.cst16 : {
        *(.rodata.cst16*)
    }
    .rodata : {
        *(.rodata*)
    }
    .data.rel.ro : {
        *(.data.rel.ro*)
    }
    .data : {
        *(.data*)
    }
    .bss : {
        *(.bss*)
    }
}
