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

---

os:⬇️ shell➡️ | *bash*  | *sh*  | *pwsh*  | *cmd*  | *powershell*
---: | :---: | :---: | :---:
ubuntu | ✅ | ✅ | ✅ | ❌ | ❌
windows| ✅ | ❌ | ✅ | ✅ | ✅
macos  | ✅ | ✅ | ✅ | ❌ | ❌

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

[^1]: if aren't set
[^note]: default Github runners and workflow syntax
