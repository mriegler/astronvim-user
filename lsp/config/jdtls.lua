return function()
	-- use this function notation to build some variables
	local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
	local root_dir = require("jdtls.setup").find_root(root_markers)
	local home = os.getenv("HOME")

	-- calculate workspace dir
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
	os.execute("mkdir -p " .. workspace_dir)

	-- get the mason install path
	local install_path = require("mason-registry").get_package("jdtls"):get_install_path()

	-- get the current OS
	local os
	if vim.fn.has "macunix" then
		os = "mac"
	elseif vim.fn.has "win32" then
		os = "win"
	else
		os = "linux"
	end

	-- return the server config
	return {
		cmd = {
			"java",
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-javaagent:" .. install_path .. "/lombok.jar",
			"-Xms1g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",
			"-jar",
			vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
			"-configuration",
			install_path .. "/config_" .. os,
			"-data",
			workspace_dir,
		},
		settings = {
			['java.format.settings.url'] = vim.fn.stdpath "config" .. "language-servers/java-google-formatter.xml",
			['java.format.settings.profile'] = "GoogleStyle",
			java = {
				signatureHelp = { enabled = true },
				contentProvider = { preferred = 'fernflower' },
				completion = {
					favoriteStaticMembers = {
						"org.hamcrest.MatcherAssert.assertThat",
						"org.hamcrest.Matchers.*",
						"org.hamcrest.CoreMatchers.*",
						"org.junit.jupiter.api.Assertions.*",
						"java.util.Objects.requireNonNull",
						"java.util.Objects.requireNonNullElse",
						"org.mockito.Mockito.*"
					}
				},
				sources = {
					organizeImports = {
						starThreshold = 9999,
						staticStarThreshold = 9999,
					},
				},
				codeGeneration = {
					toString = {
						template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
					}
				},
				configuration = {
					-- runtimes = {
					-- 	{
					-- 		name = "JavaSE-11",
					-- 		path = home .. "/.sdkman/candidates/java/11.0.10-open/",
					-- 	},
					-- 	{
					-- 		name = "JavaSE-14",
					-- 		path = home .. "/.sdkman/candidates/java/14.0.2-open/",
					-- 	},
					-- 	{
					-- 		name = "JavaSE-15",
					-- 		path = home .. "/.sdkman/candidates/java/15.0.1-open/",
					-- 	},
					-- }
				},
			},
		},
		root_dir = root_dir
	}
end
