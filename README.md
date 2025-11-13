# oglimmer
math api for oglimmer.com site-calculator 
# Example
```nim
import asyncdispatch, oglimmer, json, strutils
let data = waitFor calculate_expression("3+4*x", "x=5")
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
