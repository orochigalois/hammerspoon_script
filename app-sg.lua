YOUR_TOKEN = "XK13PjrD";
REMOTE_URL = "http://sg.local";

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "0", function()

    local text = current_selection()
    local url =
    REMOTE_URL .. "/wp-admin/admin-ajax.php?action=collect_sentence&sentence=" ..
            encodeURI(text) .. ".&user_token=" .. YOUR_TOKEN

    local res = hs.urlevent.openURL(url)
    print(res)
    hs.alert.show(text)
end)

function encodeURI(str)
    if (str) then
        str = string.gsub(str, "\n", "\r\n")
        str = string.gsub(str, "([^%w ])", function(c)
            return string.format("%%%02X", string.byte(c))
        end)
        str = string.gsub(str, " ", "+")
    end
    return str
end

function current_selection()
    hs.eventtap.keyStroke({"cmd"}, "c")
    hs.timer.usleep(20000)
    sel = hs.pasteboard.getContents()
    return (sel or "")
end
