(define (problem blocksworld-easy-scaling-14)
    (:domain blocksworld)
    (:objects
        R B O Y - block
    )
    (:init
        (ontable R)
        (ontable B)
        (ontable Y)
        
        (on O Y) 
        
        (clear R)
        (clear B)
        (clear O) 
        
        (handempty)
        (= (total-cost) 0)
    )

    (:goal (and
        (on R B)
        (on O R)
    ))
    
    (:metric minimize (total-cost))
)