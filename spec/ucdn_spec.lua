local ucdn = require("ucdn")

describe("ucdn module", function()

  it("contains v8.0.0 of the Unicode Character Database", function()
    assert.are_equal("8.0.0", ucdn.get_unicode_version())
  end)

  it("returns the bidi class for a given codepoint", function()
    assert.are_equal(ucdn.UCDN_BIDI_CLASS_AL, ucdn.get_bidi_class(0x0627)) -- U+0627 ARABIC LETTER ALEF
    assert.are_equal(ucdn.UCDN_BIDI_CLASS_L, ucdn.get_bidi_class(0x0907))  -- U+0907 DEVANAGARI LETTER I
    assert.are_equal(ucdn.UCDN_BIDI_CLASS_WS, ucdn.get_bidi_class(0x0020)) -- U+0020 SPACE
  end)
end)
