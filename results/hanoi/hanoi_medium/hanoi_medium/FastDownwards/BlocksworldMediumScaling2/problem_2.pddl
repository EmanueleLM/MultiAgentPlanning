(define (problem BW-M-S2-4Blocks)
    (:domain BlocksworldMediumScaling2)
    (:objects
        R - block ; Red
        O - block ; Orange
        B - block ; Blue
        Y - block ; Yellow
    )
    
    (:init
        ; Hand Status
        (handempty)
        
        ; Clear Status (R, O are clear)
        (clear R)
        (clear O)
        
        ; Configuration (O on B, B on Y)
        (on B Y)
        (on O B)
        
        ; Table Status
        (ontable R)
        (ontable Y)
    )

    (:goal (and
        ; Specified goal stack: B on R on O
        (on R O)
        (on B R)
        
        ; Complete state configuration (O and Y must be on table)
        (ontable O)
        (ontable Y)
        
        ; Top blocks must be clear
        (clear B)
        (clear Y)
        
        ; Hand must be empty
        (handempty)
    ))
)