(define (problem blocksworld-medium-2)
    (:domain blocksworld)
    (:objects 
        r - block ; Red
        o - block ; Orange
        b - block ; Blue
        y - block ; Yellow
    )
    (:init
        (handempty)
        
        ; Blocks on table
        (ontable r)
        (ontable y)
        
        ; Stacks: O on B, B on Y
        (on b y)
        (on o b)
        
        ; Clear blocks: R and O
        (clear r)
        (clear o)
    )
    (:goal (and 
        (on r o) ; Red on Orange
        (on b r) ; Blue on Red
    ))
)