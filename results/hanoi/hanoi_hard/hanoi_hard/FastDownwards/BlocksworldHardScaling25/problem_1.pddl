(define (problem blocksworld-hard-scaling-25)
    (:domain blocksworld)
    (:objects
        R - block
        B - block
        Y - block
        O - block
    )
    (:init
        ; Initial stack: O on Y, Y on B, B on R, R on table
        (ontable R)
        (on B R)
        (on Y B)
        (on O Y)
        
        ; Clear status
        (clear O)
        
        ; Hand status
        (handempty)
        
        ; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        (on B Y)
        (on Y O)
        (on O R)
    ))
    (:metric minimize (total-cost))
)