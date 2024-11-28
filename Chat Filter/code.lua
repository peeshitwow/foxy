local filteredWords = {
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "+", "-", "^",
    ".", ")", "3", "4", "5", "6", "7", "8", "9", "0", "+", "-", "^",
}

local blockMessages = true --  CHANGE THIS TO TRUE IF U WANT TO BLOCK MESSAGES COMPLETELY

local function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end


local FilterAndSendChatMessage = SendChatMessage

function SendChatMessage(msg, chatType, ...)	
	local blocked = false
	
	for _, x in ipairs(filteredWords) do
			if string.find(msg, x) then
				msg = msg:gsub(x, "<REDACTED>")
				blocked = true
			else if string.find(msg, string.upper(x)) then
				msg = msg:gsub(string.upper(x), "<REDACTED>")
				blocked = true
			else if string.find(msg, firstToUpper(x)) then
				msg = msg:gsub(firstToUpper(x), "<REDACTED>")
				blocked = true
			end
			end
		end
	end

	if blocked and blockMessages then print("Working now, don't emote") return true end
	

	
	FilterAndSendChatMessage(msg, chatType, ...)

end