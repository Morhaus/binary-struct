struct = require '../struct'

module.exports = struct (length) ->
  @read = ->
    value = @buffer.buf[@buffer.read_offset...@buffer.read_offset + length]
    @buffer.read_offset += length
    return value
  @write = (value) ->
    value.copy @buffer.buf, @buffer.write_offset
    @buffer.write_offset += value.length
  @skip = ->
    @buffer.read_offset += length
