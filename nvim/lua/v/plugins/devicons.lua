return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        local colors = require("catppuccin.palettes").get_palette()

        require("nvim-web-devicons").setup({
            default = true,
            color_icons = true,
            override = {
                default_icon = {
                    icon = "󰈙",
                    color = colors.text,
                    name = "Default",
                },
                fish = {
                    icon = "󰈺",
                    color = colors.peach,
                    name = "Fish",
                },
                log = {
                    icon = "󰺮",
                    color = colors.yellow,
                    name = "Log",
                },
                sql = {
                    icon = "",
                    color = colors.yellow,
                    name = "Sql",
                },
                html = {
                    icon = "",
                    color = colors.peach,
                    name = "Html",
                },
                css = {
                    icon = "",
                    color = colors.blue,
                    name = "Css",
                },
                scss = {
                    icon = "",
                    color = colors.pink,
                    name = "Scss",
                },
                sass = {
                    icon = "",
                    color = colors.pink,
                    name = "Sass",
                },
                cpp = {
                    icon = "",
                    color = colors.blue,
                    name = "Cpp",
                },
                js = {
                    icon = "󰌞",
                    color = colors.yellow,
                    name = "Js",
                },
                mjs = {
                    icon = "󰌞",
                    color = colors.yellow,
                    name = "Mjs",
                },
                cjs = {
                    icon = "󰌞",
                    color = colors.yellow,
                    name = "Cjs",
                },
                json = {
                    icon = "",
                    color = colors.yellow,
                    name = "Json",
                },
                ts = {
                    icon = "",
                    color = colors.blue,
                    name = "Typescript",
                },
                kt = {
                    icon = "󱈙",
                    color = colors.red,
                    name = "Kt",
                },
                png = {
                    icon = "",
                    color = colors.mauve,
                    name = "Png",
                },
                webp = {
                    icon = "",
                    color = colors.mauve,
                    name = "Webp",
                },
                jpg = {
                    icon = "",
                    color = colors.mauve,
                    name = "Jpg",
                },
                jpeg = {
                    icon = "",
                    color = colors.mauve,
                    name = "Jpeg",
                },
                svg = {
                    icon = "",
                    color = colors.mauve,
                    name = "Svg",
                },
                mp3 = {
                    icon = "󰎆",
                    color = colors.mauve,
                    name = "Mp3",
                },
                mp4 = {
                    icon = "",
                    color = colors.mauve,
                    name = "Mp4",
                },
                out = {
                    icon = "",
                    color = colors.blue,
                    name = "Out",
                },
                rb = {
                    icon = "",
                    color = colors.red,
                    name = "Rb",
                },
                vue = {
                    icon = "",
                    color = colors.green,
                    name = "Vue",
                },
                py = {
                    icon = "󰌠",
                    color = colors.yellow,
                    name = "Py",
                },
                toml = {
                    icon = "",
                    color = colors.blue,
                    name = "Toml",
                },
                lock = {
                    icon = "",
                    color = colors.red,
                    name = "Lock",
                },
                zip = {
                    icon = "",
                    color = colors.yellow,
                    name = "Zip",
                },
                xz = {
                    icon = "",
                    color = colors.yellow,
                    name = "Xz",
                },
                deb = {
                    icon = "",
                    color = colors.red,
                    name = "Deb",
                },
                rpm = {
                    icon = "",
                    color = colors.red,
                    name = "Rpm",
                },
                lua = {
                    icon = "",
                    color = colors.blue,
                    name = "Lua",
                },
                txt = {
                    icon = "󰈙",
                    color = colors.blue,
                    name = "Txt",
                },
                markdown = {
                    icon = "",
                    color = colors.mauve,
                    name = "Markdown",
                },
                md = {
                    icon = "",
                    color = colors.blue,
                    name = "Md",
                },
                mdx = {
                    icon = "",
                    color = colors.blue,
                    name = "Mdx",
                },
                graphql = {
                    icon = "",
                    color = colors.pink,
                    name = "Graphql",
                },
                env = {
                    icon = "",
                    color = colors.yellow,
                    name = "Dotenv",
                },
                tf = {
                    icon = "",
                    color = colors.mauve,
                    name = "Terraform",
                },
                prisma = {
                    icon = "",
                    color = colors.text,
                    name = "Prisma",
                },
                pdf = {
                    icon = "",
                    color = colors.red,
                    name = "Pdf",
                },
                csv = {
                    icon = "",
                    color = colors.yellow,
                    name = "Csv",
                },
                ejs = {
                    icon = "",
                    color = colors.peach,
                    name = "Ejs",
                },
                jsx = {
                    icon = "",
                    color = colors.sky,
                    name = "Jsx",
                },
                tsx = {
                    icon = "",
                    color = colors.blue,
                    name = "Typescript",
                },
                rs = {
                    icon = "󱘗",
                    color = colors.peach,
                    name = "Rust",
                },
                xml = {
                    icon = "",
                    color = colors.peach,
                    name = "Xml",
                },
                yml = {
                    icon = "",
                    color = colors.mauve,
                    name = "Yml",
                },
                yaml = {
                    icon = "",
                    color = colors.mauve,
                    name = "Yml",
                },
                ["test.js"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Javascripttest",
                },
                ["test.jsx"] = {
                    icon = "",
                    color = colors.sky,
                    name = "Reactrest",
                },
                ["test.ts"] = {
                    icon = "",
                    color = colors.blue,
                    name = "Typescripttest",
                },
                ["test.tsx"] = {
                    icon = "",
                    color = colors.blue,
                    name = "Typescript",
                },
                ["spec.js"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Javascript",
                },
                ["spec.jsx"] = {
                    icon = "",
                    color = colors.sky,
                    name = "Javascript",
                },
                ["spec.ts"] = {
                    icon = "",
                    color = colors.blue,
                    name = "Typescript",
                },
                ["spec.tsx"] = {
                    icon = "",
                    color = colors.blue,
                    name = "Typescript",
                },
                Makefile = {
                    icon = "",
                    color = colors.peach,
                    name = "Makefile",
                },
                snap = {
                    icon = "",
                    color = colors.text,
                    name = "Snap",
                },
                astro = {
                    icon = "",
                    color = colors.peach,
                    name = "Astro",
                },
                feature = {
                    icon = "",
                    color = colors.green,
                    name = "Cucumber",
                },
                go = {
                    icon = "",
                    color = colors.sapphire,
                    name = "Go",
                },
                zsh = {
                    icon = "",
                    color = colors.peach,
                    name = "Zsh",
                },
                sh = {
                    icon = "",
                    color = colors.text,
                    name = "Sh",
                },
                bash = {
                    icon = "",
                    color = colors.text,
                    name = "Bash",
                },
                pug = {
                    icon = "",
                    color = colors.flamingo,
                    name = "Pug",
                },
                svelte = {
                    icon = "",
                    color = colors.red,
                    name = "Svelte",
                },
                scm = {
                    icon = "󰘧",
                    color = colors.subtext1,
                    name = "Scheme",
                },
            },
            override_by_filename = {
                [".bashrc"] = {
                    icon = "",
                    color = colors.text,
                    name = "Bashrc",
                },
                [".tmux.conf"] = {
                    icon = "",
                    color = colors.mauve,
                    name = "Tmuxconf",
                },
                [".stylua"] = {
                    icon = "",
                    color = colors.teal,
                    name = "Stylua",
                },
                [".stylua.yaml"] = {
                    icon = "",
                    color = colors.teal,
                    name = "Stylua",
                },
                [".stylua.toml"] = {
                    icon = "",
                    color = colors.teal,
                    name = "Stylua",
                },
                [".zshrc"] = {
                    icon = "",
                    color = colors.peach,
                    name = "Zshrc",
                },
                ["go.mod"] = {
                    icon = "",
                    color = colors.red,
                    name = "Gomod",
                },
                ["go.sum"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Gosum",
                },
                ["yarn-error.log"] = {
                    icon = "",
                    color = colors.red,
                    name = "Yarnerrorlog",
                },
                ["yarn.lock"] = {
                    icon = "",
                    color = colors.red,
                    name = "Yarnlock",
                },
                [".yarnrc"] = {
                    icon = "",
                    color = colors.blue,
                    name = "Yarnconfig",
                },
                ["pnpm-lock.yaml"] = {
                    icon = "",
                    color = colors.red,
                    name = "Pnpmlock",
                },
                ["package.json"] = {
                    icon = "",
                    color = colors.green,
                    name = "PackageJson",
                },
                ["package-lock.json"] = {
                    icon = "",
                    color = colors.red,
                    name = "PackageLockJson",
                },
                [".gitignore"] = {
                    icon = "",
                    color = colors.overlay0,
                    name = "Gitignore",
                },
                [".gitattributes"] = {
                    icon = "",
                    color = colors.peach,
                    name = "Gitattributes",
                },
                ["Dockerfile"] = {
                    icon = "󰡨",
                    color = colors.blue,
                    name = "Dockerfile",
                },
                [".nvmrc"] = {
                    icon = "",
                    color = colors.green,
                    name = "Nvmrc",
                },
                [".eslintrc.js"] = {
                    icon = "",
                    color = colors.mauve,
                    name = "EslintrcJs",
                },
                [".eslintrc.cjs"] = {
                    icon = "",
                    color = colors.mauve,
                    name = "EslintrcCjs",
                },
                [".eslintrc.json"] = {
                    icon = "",
                    color = colors.mauve,
                    name = "EslintrcJson",
                },
                [".eslintrc.yml"] = {
                    icon = "",
                    color = colors.mauve,
                    name = "EslintrcYml",
                },
                [".eslintignore"] = {
                    icon = "",
                    color = colors.overlay0,
                    name = "EslintIgnore",
                },
                [".travis.yml"] = {
                    icon = "",
                    color = colors.red,
                    name = "Travis",
                },
                [".babelrc"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Babelrc",
                },
                ["babel.config.js"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Babelconfig",
                },
                [".commitlintrc.json"] = {
                    icon = "󰜛",
                    color = colors.teal,
                    name = "CommitLint",
                },
                ["commitlint.config.ts"] = {
                    icon = "󰜛",
                    color = colors.teal,
                    name = "CommitLint",
                },
                ["commitlint.config.js"] = {
                    icon = "󰜛",
                    color = colors.teal,
                    name = "CommitLint",
                },
                [".commitlintrc.js"] = {
                    icon = "󰜛",
                    color = colors.teal,
                    name = "CommitLint",
                },
                [".commitlintrc"] = {
                    icon = "󰜛",
                    color = colors.teal,
                    name = "CommitLint",
                },
                [".commitlintrc.yml"] = {
                    icon = "󰜛",
                    color = colors.teal,
                    name = "CommitLint",
                },
                ["tsconfig.build.json"] = {
                    icon = "",
                    color = colors.blue,
                    name = "TSConfigJson",
                },
                ["tsconfig.node.json"] = {
                    icon = "",
                    color = colors.blue,
                    name = "TSConfigJson",
                },
                ["tsconfig.json"] = {
                    icon = "",
                    color = colors.blue,
                    name = "TSConfigJson",
                },
                ["nest-cli.json"] = {
                    icon = "",
                    color = colors.red,
                    name = "Nestclijson",
                },
                ["vite.config.js"] = {
                    icon = "󰉁",
                    color = colors.yellow,
                    name = "Viteconfigjs",
                },
                ["vite.config.ts"] = {
                    icon = "󰉁",
                    color = colors.blue,
                    name = "Viteconfigts",
                },
                ["Procfile"] = {
                    icon = "",
                    color = colors.mauve,
                    name = "Procfile",
                },
                [".editorconfig"] = {
                    icon = "",
                    color = colors.sky,
                    name = "Editorconfig",
                },
                ["LICENSE"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "License",
                },
                ["docker-compose.yml"] = {
                    icon = "󰡨",
                    color = colors.blue,
                    name = "Dockercompose",
                },
                [".dockerignore"] = {
                    icon = "󰡨",
                    color = colors.overlay0,
                    name = "Dockerignore",
                },
                [".prettierignore"] = {
                    icon = "󰬗",
                    color = colors.overlay0,
                    name = "Prettierignore",
                },
                [".prettierrc"] = {
                    icon = "󰬗",
                    color = colors.teal,
                    name = "PrettierConfig",
                },
                [".prettierrc.yaml"] = {
                    icon = "󰬗",
                    color = colors.teal,
                    name = "PrettierConfig",
                },
                [".prettierrc.yml"] = {
                    icon = "󰬗",
                    color = colors.teal,
                    name = "PrettierConfig",
                },
                [".prettierrc.json"] = {
                    icon = "󰬗",
                    color = colors.teal,
                    name = "PrettierConfig",
                },
                [".prettierrc.js"] = {
                    icon = "󰬗",
                    color = colors.teal,
                    name = "PrettierConfig",
                },
                ["prettier.config.js"] = {
                    icon = "󰬗",
                    color = colors.teal,
                    name = "PrettierConfig",
                },
                [".prettier.yaml"] = {
                    icon = "󰬗",
                    color = colors.teal,
                    name = "PrettierConfig",
                },
                [".env.production"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Envprod",
                },
                [".env.development"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Envdev",
                },
                [".env.testing"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Envtest",
                },
                [".env.example"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Dotenvexample",
                },
                [".env"] = {
                    icon = "",
                    color = colors.yellow,
                    name = "Dotenv",
                },
                ["rollup.config.js"] = {
                    icon = "",
                    color = colors.peach,
                    name = "Rollup",
                },
                [".lintstagedrc.yml"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                [".lintstagedrc"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                [".lintstagedrc.json"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                [".lintstagedrc.yaml"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                [".lintstagedrc.mjs"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                ["lint-staged.config.mjs"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                [".lintstagedrc.cjs"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                ["lint-staged.config.cjs"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                ["lint-staged.config.js"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                [".lintstagedrc.js"] = {
                    icon = "",
                    color = colors.peach,
                    name = "LintStaged",
                },
                ["tailwind.config.js"] = {
                    icon = "󱏿",
                    color = colors.sky,
                    name = "TailwindConfig",
                },
                ["tailwind.config.cjs"] = {
                    icon = "󱏿",
                    color = colors.sky,
                    name = "TailwindConfig",
                },
                ["tailwind.config.mjs"] = {
                    icon = "󱏿",
                    color = colors.sky,
                    name = "TailwindConfig",
                },
                ["tailwind.config.ts"] = {
                    icon = "󱏿",
                    color = colors.sky,
                    name = "TailwindConfig",
                },
            },
        })
    end,
}
