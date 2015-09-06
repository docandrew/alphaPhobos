module tests.png.basic;
import tests.png.defs;
import std.experimental.graphic.image;
import std.file : read, write;

unittest {
    string file = "tests/png/assets/basi0g01.png";
    entryTest(file);

    HeadersOnlyPNGFileFormat headerImage = loadPNGHeaders(cast(ubyte[])read(file));
    testOutput(headerImage.toString());
    assert(headerImage.checkIDHR(32, 32,
        PngIHDRBitDepth.BitDepth1,
        PngIHDRColorType.Grayscale,
        PngIHDRCompresion.DeflateInflate,
        PngIHDRFilter.Adaptive,
        PngIHDRInterlaceMethod.Adam7));

    assert(headerImage.PLTE is null);
    assert(headerImage.tRNS is null);

    assert(headerImage.gAMA !is null);
    assert(headerImage.gAMA.value == 100_000);

    assert(headerImage.cHRM is null);
    assert(headerImage.sRGB is null);
    assert(headerImage.iCCP is null);
    assert(headerImage.bKGD is null);
    assert(headerImage.pPHs is null);
    assert(headerImage.sBIT is null);
    assert(headerImage.tIME is null);

    assert(headerImage.tEXt.__internalKeys.length == 0);
    assert(headerImage.zEXt.__internalKeys.length == 0);

    assert(headerImage.sPLT.length == 0);
    assert(headerImage.hIST.length == 0);

    exitTest(file);
}

version(none):

unittest {
    string file = "tests/png/assets/basn0g01.png";
    entryTest(file);

    void check(Image)(Image image) {
        assert(image.checkIDHR(32, 32,
                PngIHDRBitDepth.BitDepth1,
                PngIHDRColorType.Grayscale,
                PngIHDRCompresion.DeflateInflate,
                PngIHDRFilter.Adaptive,
                PngIHDRInterlaceMethod.NoInterlace));
        
        assert(image.PLTE is null);
        assert(image.tRNS is null);
        
        assert(image.gAMA !is null);
        assert(image.gAMA.value == 100_000);
        
        assert(image.cHRM is null);
        assert(image.sRGB is null);
        assert(image.iCCP is null);
        assert(image.bKGD is null);
        assert(image.pPHs is null);
        assert(image.sBIT is null);
        assert(image.tIME is null);
        
        assert(image.tEXt.__internalKeys.length == 0);
        assert(image.zEXt.__internalKeys.length == 0);
        
        assert(image.sPLT.length == 0);
        assert(image.hIST.length == 0);
    }

    HeadersOnlyPNGFileFormat headerImage = loadPNGHeaders(cast(ubyte[])read(file));
    testOutput(headerImage.toString());
    check(headerImage);

    // import 1
    auto image1 = loadPNG!RGB16(cast(ubyte[])read(file));
    check(image1);

    // export
    write("", image1.toBytes());

    // import 2
    auto image2 = loadPNG!RGB16(cast(ubyte[])read(""));
    check(image2);

    exitTest(file);
}