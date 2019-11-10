local addon = LibStub("AceAddon-3.0"):NewAddon("Basic CN Translator")
​
​
local words = {
  -- add words to replace here  
	
	["戰士"] = "Warrior",
    ["盜賊"] = "Rogue",
	["法師"] = "Mage",   
    ["騎"] = "Paladin",
    ["術士"] = "Warlock",
	["德魯伊"] = "Druid",
	["牧師"] = "Priest",
	["獵人"] = "Hunter",
	
	["找隊打"] = "LFG",
	
	["缺"] = "LFM",
	["補"] = "Healer",
	
	["輸出"] = "DPS",
	["坦"] = "Tank",
	["北"] = "North",
	
	["西"] = "West",
	["東"] = "East",
	["圖書館"] = "Library",
	
	["墓地"] = "Graveyard",
	["兵器庫"] = "Armory",
	["教堂"] = "Cathedral",
	["死礦"] = "Deadmine",
	
	["黑澗深淵 "] = "BFD",
	["監獄"] = "Stockade",
	["血色修道院"] = "SM",
	["奧達曼"] = "Ulda",
	["祖爾法拉克"] = "ZF",
	["瑪拉頓"] = "Maradon",
	["沉沒神廟"] = "Sunken Temple",
	["黑石深淵"] = "BRD",
	["黑石塔下"] = "LBRS",
	["黑石塔上"] = "UBRS",
	["厄運之槌"] = "Dire Maul",
	["諾姆瑞根"] = "Gnomeregan",
	["斯坦索姆"] = "Stratholme",
	["學院"] = "Scholomance",
}
local caseInsensitiveWords = {}
for oldWord,newWord in pairs(words) do
  -- replaces "words" with "[Ww][Oo][Rr][Dd][Ss]"
  caseInsensitiveWords[ oldWord:gsub("%a",function(a) return "["..a:upper()..a:lower().."]" end) ] = newWord
end
​
local function myFilter(self,event,msg,...)
  -- use pairs(words) for a case-sensitive replace
  for oldWord,newWord in pairs(caseInsensitiveWords) do
    msg = msg:gsub(oldWord,newWord)
  end  
  return false,msg,...
end
​
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER",myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD",myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL",myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY",myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND",myFilter)
​
​
ChatFrame_AddMessageEventFilter("CHAT_MSG_COMMUNITIES_CHANNEL", myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", myFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", myFilter)