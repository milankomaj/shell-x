# shell-x
> #### Composite action for localized github runners.
> ``` - uses: milankomaj/shell-x@v0.2 ```

**with:** | *required*  | *default*  | *optional*
---: | :---: | :--- | :---:
actor:       | false  | `${{ github.actor }}` | ✅
shell:       | false  | `     *  `  [^note]   | ✅
locale:      | false  | `     *  `  [^note]   | ✅
timezone:    | false  | `     *  `  [^note]   | ✅
comand:      | false  | `     *  `  [^note]   | ✅

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
---


[^note]: default Github workflow syntax
