(define (problem blocksworld-4-blocks)
    (:domain blocksworld)
    (:objects 
        R O B Y - block
    )
    
    (:init 
        ;; Initial State: (clear R), (clear O), (handempty), (on R Y), (on O B), (ontable B), (ontable Y).
        (ontable B)
        (ontable Y)
        (on R Y)
        (on O B)
        
        (clear R)
        (clear O)
        
        (handempty)
        
        (= (total-cost) 0)
    )
    
    (:goal (and 
        ;; Goal State: R -> B -> O -> Y (bottom to top)
        (ontable R)
        (on B R)
        (on O B)
        (on Y O)
    ))

    (:metric minimize (total-cost))
)