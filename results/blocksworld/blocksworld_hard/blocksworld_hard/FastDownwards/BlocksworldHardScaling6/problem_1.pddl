(define (problem BlocksworldHardScaling6)
    (:domain blocksworld)
    (:objects 
        R O B Y - block
    )
    (:init
        (handempty)
        
        ;; Initial State: (clear R), (clear O), (handempty), (on R Y), (on O B), (ontable B), (ontable Y).
        
        (on R Y)
        (on O B)
        (ontable B)
        (ontable Y)
        (clear R)
        (clear O)
    )
    
    (:goal (and
        ;; Target stack: R (table) -> B -> O -> Y
        (on B R)
        (on O B)
        (on Y O)
        (ontable R)
    ))
)