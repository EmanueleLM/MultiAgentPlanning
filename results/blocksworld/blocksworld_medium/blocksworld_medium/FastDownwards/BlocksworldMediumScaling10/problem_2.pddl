(define (problem blocksworld-10)
    (:domain blocks)
    (:objects 
        red blue yellow orange - block
    )
    
    (:init 
        (handempty)
        
        ;; red on blue
        (on red blue)
        ;; blue on yellow
        (on blue yellow)
        ;; yellow on orange
        (on yellow orange)
        ;; orange on table
        (ontable orange)
        
        ;; red is clear (topmost)
        (clear red)
    )
    
    (:goal 
        (on yellow red)
    )
)