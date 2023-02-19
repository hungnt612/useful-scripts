import re
import sys
_fileName=sys.argv[1]
_old=sys.argv[2]
_new=sys.argv[3]

# Mở file để đọc
with open(_fileName, 'r') as file:
    filedata = file.read()

# Thay thế chuỗi
newdata = re.sub(_old, _new, filedata)

# Mở file để ghi
with open(_fileName, 'w') as file:
    file.write(newdata)
