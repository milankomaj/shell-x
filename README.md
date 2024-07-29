# shell-x
##### for example [^note] : need time and date in your timezone, localized terminal outputs, sort files or values alfabeticaly...
> #### Composite action for localized github runners.
> ``` - uses: milankomaj/shell-x@v0.3 ```

**with:** | *required*  | *default* [^1] | *optional*
---: | :---: | :---: | :---:
actor:       | false  | `${{ github.actor }}` | ✅
shell:       | false  | [^2] | ✅
locale:      | false  | [^2] | ✅
timezone:    | false  | [^2] | ✅
comand: [^3] | false  |    | ✅



os:⬇️ shell:➡️| *bash*  | *sh*  | *pwsh*  | *cmd*  | *powershell*| *custom*
:--- | :---: | :---: | :---: | :---: | :---: | :---:
**ubuntu** | ✅ | ✅ | ✅ | ❌ | ❌ | ✅
**windows**| ✅ | ❌ | ✅ | ✅ | ✅ | ✅
**macos**  | ✅ | ✅ | ✅ | ❌ | ❌ | ✅

> ##### [shells :link:](https://docs.github.com/en/enterprise-cloud@latest/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsshell)

---

> ###### minimal example
```YAML
      - uses: milankomaj/shell-x@v0.3
```

> ###### example for [windows-latest]
```YAML
      - uses: milankomaj/shell-x@v0.3
        with:
          shell: pwsh
          locale: sk_SK
          timezone: Central Europe Standard Time
          comand: Get-TimeZone && Get-Date -UFormat '%A %d/%m/%Y %R %Z'
```

> ###### example for [ubuntu-latest]
```YAML
      - uses: milankomaj/shell-x@v0.3
        with:
          shell: bash
          locale: sk_SK.utf8
          timezone: Europe/Bratislava
          comand: cat /etc/timezone && date
```

> ###### example full workflow [ubuntu-latest]
```YAML
name: test
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
      - name: shell-x@v0.3
        id: TEST
        uses: milankomaj/shell-x@v0.3
        with:
          shell: bash
          locale: sk_SK.utf8
          timezone: Europe/Bratislava
          comand: date && timedatectl

      # optional shell-x outputs
      - name: inputs-outputs
        run: echo "::notice::${{ steps.TEST.outputs.inputs-outputs }}"

      - name: shell-outputs
        run: echo "::notice::${{ steps.TEST.outputs.shell-outputs}}"

      - name: comand-outputs
        run: ${{ steps.TEST.outputs.comand-outputs }} && sudo apt -y update && sudo apt -y upgrade
```

---

[^note]: options depend on the runner.os, shell ...
[^1]: if aren't set
[^2]: default Github runners and workflow syntax
[^3]: run any supported command inside shell-x
[^3]: run command inside shell-x


