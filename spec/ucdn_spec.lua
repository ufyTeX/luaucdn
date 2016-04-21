local ucdn = require("ucdn")

describe("ucdn module", function()

  it("contains v8.0.0 of the Unicode Character Database", function()
    assert.are_equal("8.0.0", ucdn.UNICODE_VERSION)
  end)
end)
