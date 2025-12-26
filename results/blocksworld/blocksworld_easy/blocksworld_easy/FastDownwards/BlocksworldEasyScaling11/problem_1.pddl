(define (problem blocksworld-11)
    (:domain blocksworld)
    (:objects 
        r b o y - block
    )
    
    (:init
        (ontable r)
        (ontable o)
        (ontable y)
        
        (on b y)
        
        (clear r)
        (clear b)
        (clear o)
        
        (handempty)
    )
    
    (:goal (and
        (on b o)
        (on y r)
    ))
)