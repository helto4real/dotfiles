local setup, neotest = pcall(require, "neotest")
if not setup then
    print("Plugin Comment is not installed!")
    return
end

neotest.setup({
    log_level = 1,
    adapters = {
        require("neotest-dotnet")({
            dicovery_root = "project",
        }),
    },
    icons = {
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed = "",
        passed = "",
        running = "",
        failed = "",
        unknown = "",
        skipped = "",
    },
})
