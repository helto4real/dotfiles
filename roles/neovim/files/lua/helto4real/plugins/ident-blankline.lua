local setup, ibl = pcall(require, "ibl")
if not setup then
    print("Plugin Comment is not installed!")
    return
end

ibl.setup {
    --indent = {char = "▏" },
    indent = {char = "⁞" },
    scope = {
        enabled = true,

    },
}
