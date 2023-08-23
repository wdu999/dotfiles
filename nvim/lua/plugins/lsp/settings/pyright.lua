return {
	settings = {
		python = {
			-- pythonPath = "C:\\Users\\duwei\\Anaconda3\\python.exe",
			inlayHints = {
				functionReturnTypes = false,
				variableTypes = false,
			},
			analysis = {
				typeCheckingMode = "off",
				diagnosticServerityOverrides = {
					reportUnboundVariable = "none",
					reportGeneralTypeIssues = "none",
				},
				-- extraPaths = [],
			},
		},
	},
}
