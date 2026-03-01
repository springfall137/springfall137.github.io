import codecs
import sys

target_file = r'c:\Users\user\Downloads\springfall137.github.io-main\index.html'

try:
    # Read file content, handling potential BOM
    with codecs.open(target_file, 'r', 'utf-8-sig') as f:
        content = f.read()

    # Write content back in UTF-8 (no BOM)
    with codecs.open(target_file, 'w', 'utf-8') as f:
        f.write(content)
        
    print(f"Successfully converted {target_file} to UTF-8 without BOM")
    
except Exception as e:
    print(f"Error: {e}")
    sys.exit(1)
