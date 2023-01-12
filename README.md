# shell-x
> #### Composite action for localized github runners.
> ``` - uses: milankomaj/shell-x@v0.2 ```

**with:** | *required*  | *default*  | *optional*
---: | :---: | :--- | :---:
actor:       | false  | `${{ github.actor }}`     | ✅
shell:       | false  | `                   `[^1] | ✅
locale:      | false  | `                   `[^1] | ✅
timezone:    | false  | `                   `[^1] | ✅
comand:      | false  | `                   `[^1] | ✅

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


[^1]: default Github workflow syntax
