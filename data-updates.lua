local combinator_proto_cats = {
    "arithmetic-combinator",
    "constant-combinator",
    "decider-combinator",
    "selector-combinator"
}
local sound_definition_file_names = {
    "01_wiki.ogg",
    "02_9600_dial-up.ogg",
    "03_115200_dial-up.ogg",
    "04_300_not-conneected_dial-up.ogg",
}
local path_prefix = "__dial-up-combinators__/sound/"

local sound_definition = {
    variations = {}
}
for _, name in pairs(sound_definition_file_names) do
    table.insert(sound_definition.variations, {
        filename = path_prefix..name,
        volume = 1
    })
end

for _, name in pairs(combinator_proto_cats) do
    if data.raw[name] then
        for _, proto in pairs(data.raw[name]) do
            if proto.working_sound then
                proto.working_sound.activate_sound = sound_definition
                proto.working_sound.sound = {filename = path_prefix.."/noise.ogg", allow_random_repeat=true}
                proto.working_sound.deactivate_sound = {filename = path_prefix.."BusySignal.ogg", volume = 0.5}
            end
        end
    end
end