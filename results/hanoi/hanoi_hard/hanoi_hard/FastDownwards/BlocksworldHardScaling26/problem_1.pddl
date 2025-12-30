(define (problem BlocksworldHardScaling26_P1)
    (:domain BlocksworldHardScaling26)
    (:objects
        R - block ; Red
        B - block ; Blue
        Y - block ; Yellow
        O - block ; Orange
    )
    (:init
        ; Initial stack configuration: R on B, B on Y, Y on O, O on table.
        (on R B)
        (on B Y)
        (on Y O)
        (ontable O)
        
        (clear R) ; R is the top block
        (handempty)
        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal stack configuration: Y on O, O on R, R on B, B on table. (Y/O/R/B)
        (on R B)
        (on O R)
        (on Y O)
        (ontable B)
        (clear Y) ; Y must be the top block
    ))
    (:metric minimize (total-cost))
)