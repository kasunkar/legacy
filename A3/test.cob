identification division.
program-id. hello.

data division.
working-storage section.
77 num pic 99.
procedure division.
move 10 to num.
 display num.
 
 
 loop.
    if s(i) is not equal to 'i' go to b1.
    move 1 to d. go to 3.
b1. if s(i) is not equal to 'v' go to b2.
    move 5 to d. go to 3.
b2. if s(i) is not equal to 'x' go to b3.
    move 10 to d. go to 3.
b3. if s(i) is not equal to 'l' go to b4.
    move 50 to d. go to 3.
b4. if s(i) is not equal to 'c' go to b5.
    move 100 to d. go to 3.
b5. if s(i) is not equal to 'd' go to b6.
    move 500 to d. go to 3.
b6. if s(i) is not equal to 'm' go to b7.
    move 1000 to d. go to 3.

