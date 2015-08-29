/**
 * Init module
 *
 * Copyright: <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors: $(WEB http://cattermole.co.nz, Richard Andrew Cattermole)
 *
 * $(H3 init)
 *
 * Provides something for reasons....
 * 
 * Short intro example
 * ----------------------
 * ...
 * ----------------------
 * Explanation on what it does
 *
 * Extra support
 * ----------------------
 *
 * ----------------------
 * Reasoning
 */
module std.experimental.graphic.image.fileformats.defs;

/**
 * An image format type with color type of HeadersOnly will not include the image facilities as part of it.
 * This is used with loading only headers of and image format type. To decide at runtime a better color type to use.
 */
struct HeadersOnly {}

alias ImageNotLoadableException = Exception;
alias ImageNotExportableException = Exception;