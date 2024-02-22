local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
    print("Plugin Comment is not installed!")
    return
end

gitsigns.setup()
