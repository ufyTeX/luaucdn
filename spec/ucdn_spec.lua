local ucdn = require("ucdn")

describe("ucdn module", function()

  it("contains v9.0.0 of the Unicode Character Database", function()
    assert.are_equal("9.0.0", ucdn.get_unicode_version())
  end)

  it("returns the Bidi_Class propety value for a given codepoint", function()
    assert.are_equal(ucdn.UCDN_BIDI_CLASS_AL, ucdn.get_bidi_class(0x0627)) -- U+0627 ARABIC LETTER ALEF
    assert.are_equal(ucdn.UCDN_BIDI_CLASS_L, ucdn.get_bidi_class(0x0907))  -- U+0907 DEVANAGARI LETTER I
    assert.are_equal(ucdn.UCDN_BIDI_CLASS_WS, ucdn.get_bidi_class(0x0020)) -- U+0020 SPACE
  end)

  it("returns the Bidi_Paired_Bracket_Type for a given codepoint", function()
    assert.are_equal(ucdn.UCDN_BIDI_PAIRED_BRACKET_TYPE_OPEN, ucdn.paired_bracket_type(0x0028))  -- U+0028 LEFT PARENTHESIS
    assert.are_equal(ucdn.UCDN_BIDI_PAIRED_BRACKET_TYPE_CLOSE, ucdn.paired_bracket_type(0x0029)) -- U+0029 RIGHT PARENTHESIS
    assert.are_equal(ucdn.UCDN_BIDI_PAIRED_BRACKET_TYPE_NONE, ucdn.paired_bracket_type(0x0041))  -- U+0041 LATIN CAPITAL LETTER A
  end)

  it("returns the corresponding Bidi_Paired_Bracket codepoint for a given codepoint", function()
    -- LEFT PARENTHESIS and RIGHT PARENTHESIS
    assert.are_equal(0x0029, ucdn.paired_bracket(0x0028))
    assert.are_equal(0x0028, ucdn.paired_bracket(0x0029))

    -- HALFWIDTH LEFT CORNER BRACKET and HALFWIDTH RIGHT CORNER BRACKET
    assert.are_equal(0xFF62, ucdn.paired_bracket(0xFF63))
    assert.are_equal(0xFF63, ucdn.paired_bracket(0xFF62))
  end)
end)
