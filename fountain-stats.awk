
#For now, this is just scene counting. Under fountain markdown,
#Any line that starts with all caps INT., all caps EXT., or optionally
#any line that starts with a period . and is followed directly by all caps
#line without space after the period is a scene header.
BEGIN {
    Inside = "INT." #Scene takes place in an interior
    Outside = "EXT."
    IN = 0
    OUT = 0
    OTHER = 0
}

{
    if ($1==Inside) {
	IN++
    }
    if ($1==Outside) {
	    OUT++
	}
}

/^\.[A-Z]/ {
    OTHER++
}

END {
    print " There are - " IN " Scenes Taking Place Inside.\n"
    print "There Are - " OUT " Scenes Taking Place Outside\n", "Other Scenes - " OTHER
}
