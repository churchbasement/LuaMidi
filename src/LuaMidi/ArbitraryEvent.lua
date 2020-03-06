-------------------------------------------------
-- Abstraction of an arbitrary MIDI event
-- <p>**Note:** This object should not be created
-- by the user.
--
-- @classmod ArbitraryEvent
-- @author Pedro Alves Valentim
-- @license MIT
-------------------------------------------------
local ArbitraryEvent = {}

-------------------------------------------------
--- Functions
-- @section functions
-------------------------------------------------

-------------------------------------------------
-- Creates a new ArbitraryEvent
--
-- @param fields a table containing the a data field
--
-- @return 	new ArbitraryEvent object
-------------------------------------------------
function ArbitraryEvent.new(fields)
   assert(fields.data and type(fields.data) == 'table', "'data' field must be an array")
   for _, value in ipairs(fields.data) do
      assert(tonumber(value) == value and value>=0x00 and value<=0xFF, string.format("Invalid byte: %d", value))
   end
   local self = { data = fields.data }
   return setmetatable(self, { __index = ArbitraryEvent })
end

-------------------------------------------------
--- Methods
-- @section methods
-------------------------------------------------

-------------------------------------------------
-- Gets data of ArbitraryEvent
--
-- @return 	ArbitraryEvent's data value
-------------------------------------------------
function ArbitraryEvent:get_data()
   return self.data
end

return ArbitraryEvent
