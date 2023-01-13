# shell-x
##### for example [^note] : need time and date in your timezone, localized terminal outputs, sort files or values alfabeticaly...
> #### Composite action for localized github runners.
> ``` - uses: milankomaj/shell-x@v0.2 ```

**with:** | *required*  | *default* [^1] | *optional*
---: | :---: | :---: | :---:
actor:       | false  | `${{ github.actor }}` | ✅
shell:       | false  | [^note] | ✅
locale:      | false  | [^note] | ✅
timezone:    | false  | [^note] | ✅
comand:      | false  |         | ✅
run: [^2]    | false  | false   | ✅


os:⬇️ shell:➡️| *bash*  | *sh*  | *pwsh*  | *cmd*  | *powershell*| *custom*  [^3]
:--- | :---: | :---: | :---: | :---: | :---: | :---:
**ubuntu** | ✅ | ✅ | ✅ | ❌ | ❌ | ✅
**windows**| ✅ | ❌ | ✅ | ✅ | ✅ | ✅
**macos**  | ✅ | ✅ | ✅ | ❌ | ❌ | ✅

> ##### [shells :link:](https://docs.github.com/en/enterprise-cloud@latest/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsshell)

---

> ###### minimal example
```YAML
      - uses: milankomaj/shell-x@v0.2
```

> ###### example for [windows-latest]
```YAML
      - uses: milankomaj/shell-x@v0.2
        with:
          shell: pwsh
          locale: sk_SK
          timezone: Central Europe Standard Time
          comand: Get-TimeZone && Get-Date -UFormat '%A %m/%d/%Y %R %Z'
```

> ###### example for [ubuntu-latest]
```YAML
      - uses: milankomaj/shell-x@v0.2
        with:
          shell: bash
          locale: sk_SK.utf8
          timezone: Europe/Bratislava
          comand: cat /etc/timezone && date
```

> ###### example full workflow [ubuntu-latest]
```YAML
name: test v0.2
run-name: ${{ github.workflow }} ✅ ${{ github.actor }} ✅ ${{ github.event_name}}
on:
  workflow_dispatch:
jobs:
  Shell:
    name: Shell
    continue-on-error: false
    strategy:
      max-parallel: 3
      matrix:
       os: [ubuntu-latest]
    runs-on: ${{ matrix.os }}
    steps:
      - name: shell-x@v0.2
        id: v2
        uses: milankomaj/shell-x@v0.2
        with:
          shell: bash
          locale: sk_SK.utf8
          timezone: Europe/Bratislava
          comand: date && timedatectl
          run: true

      # optional
      - name: inputs-outputs
        run: echo "::notice::${{ steps.v2.outputs.inputs-outputs }}"

      - name: shell-outputs
        run: echo "::notice::${{ steps.v2.outputs.shell-outputs}}"

      - name: comand-outputs
        run: ${{ steps.v2.outputs.comand-outputs }} && sudo apt -y update  && sudo apt -y upgrade
```

---

[^note]: options depend on the runner.os, shell ...
[^1]: if aren't set
[^2]: run command inside shell-x
[^3]: together with the command
[^4]: options depend on the runner.os, shell ...


