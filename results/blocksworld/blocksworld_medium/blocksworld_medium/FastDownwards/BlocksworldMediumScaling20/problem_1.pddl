(define (problem blocksworld-4-1)
    (:domain blocksworld)
    (:objects 
        r b y o - block
    )
    (:init 
        ; Initial stack: r on b, b on y, y on o, o on table.
        (on r b)
        (on b y)
        (on y o)
        (ontable o)
        
        ; Clear status
        (clear r)
        
        ; Hand status
        (arm-empty)
        
        (= (total-cost) 0)
    )
    (:goal 
        (and
            (on o r)
            (on y b)
        )
    )
    (:metric minimize (total-cost))
)