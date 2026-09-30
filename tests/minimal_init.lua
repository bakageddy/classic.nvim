local plenary = os.getenv("PLENARY") or "plenary"

-- Minimal runtime for running the test suite
vim.opt.runtimepath:append(".")
vim.opt.runtimepath:append(plenary)

-- If plenary.nvim is installed with a package manager, set PLENARY to its path.
-- Otherwise install via git clone into ./.deps/plenary.nvim and run:
--   make test PLENARY=.deps/plenary.nvim
