identification division.
program-id. romannumerals.

environment division.
input-output section.
file-control.
    select standard-input assign to keyboard
        organization is line sequential.
    select standard-output assign to display.

data division.
file section.
fd standard-input.
    01 stdin-record   picture x(80).
fd standard-output.
    01 stdout-record  picture x(80).
    
working-storage section.
77  len  picture s99 usage is computational.
77  temp picture s9(8) usage is computational.
77  ret  picture s9 usage is computational-3.
77  space-count picture s99 usage is computational.
01  array-area.
    02 user-input-array picture x(1) occurs 30 times.

01  input-area.
    02 in-r   picture x(80).
    02 filler picture x(79).

01  title-line.
    02 filler picture x(11) value spaces.
    02 filler picture x(24) value 'roman number equivalents'.

01  underline-1.
    02 filler picture x(45) value 
       ' --------------------------------------------'.

01  col-heads.
    02 filler picture x(9) value spaces.
    02 filler picture x(12) value 'roman number'.
    02 filler picture x(13) value spaces.
    02 filler picture x(11) value 'dec. equiv.'.

01  underline-2.
    02 filler picture x(45) value
       ' ------------------------------   -----------'.

01  print-line.
    02 filler picture x value space.
    02 out-r  picture x(30).
    02 filler picture x(3) value spaces.
    02 out-eq picture z(9).

procedure division.
    
    open input standard-input, output standard-output.
    
    write stdout-record from title-line after advancing 0 lines.
    write stdout-record from underline-1 after advancing 1 line.
    write stdout-record from col-heads after advancing 1 line.
    write stdout-record from underline-2 after advancing 1 line.
    write stdout-record from " " after advancing 1 line

   move  spaces to array-area.
perform 
    until user-input-array(1) equals 'q'

    
    write stdout-record from " " after advancing 1 line
    read standard-input into input-area
   
    move input-area to array-area
    move 30 to len
    move zero to temp
    move 0 to ret
    move 0 to space-count
    
    inspect function reverse(array-area) tallying space-count for leading spaces
    subtract space-count from len

    call "conv" using array-area, len, ret, temp
    
    if ret equals 0
        move temp to out-eq
        move array-area to out-r
        write stdout-record from print-line after advancing 1 line
        write stdout-record from " " after advancing 1 line
        
    end-if
    
    
    move spaces to print-line

   

end-perform.

b3. close standard-input, standard-output. 
    stop run.
