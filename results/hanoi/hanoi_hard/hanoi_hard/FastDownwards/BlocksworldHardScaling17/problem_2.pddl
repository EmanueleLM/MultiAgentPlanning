(define (problem BlocksworldHardScaling17)
    (:domain blocksworld)
    (:objects
        R Y O B - block
    )
    (:init
        (handempty)
        (= (total-cost) 0)
        
        ; Initial Stack: R on O, O on B, B on table
        (on R O)
        (on O B)
        (ontable B)
        
        ; Block Y position
        (ontable Y)
        
        ; Clearance: R and Y are clear
        (clear R)
        (clear Y)
    )
    (:goal (and
        (on R B)
        (on B Y)
        (on Y O)
    ))
    (:metric minimize (total-cost))
)