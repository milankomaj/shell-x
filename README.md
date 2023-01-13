# shell-x
> #### Composite action for localized github runners.
> ``` - uses: milankomaj/shell-x@v0.2 ```

**with:** | *required*  | *default* [^1] | *optional*
---: | :---: | :---: | :---:
actor:       | false  | `${{ github.actor }}` | ✅
shell:       | false  | [^note] | ✅
locale:      | false  | [^note] | ✅
timezone:    | false  | [^note] | ✅
comand:      | false  |         | ✅


**os:**⬇️ *shell:*➡️ | *bash*  | *sh*  | *pwsh*  | *cmd*  | *powershell*| *custom*  [^2]
---: | :---: | :---: | :---: | :---: | :---: | :---:
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
---

[^note]: default Github runners and workflow syntax
[^1]: if aren't set
[^2]: with comand