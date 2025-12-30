(define (problem BlocksworldMediumScaling14)
    (:domain blocks)
    (:objects 
        R B Y O - block
    )
    
    (:init 
        (hand-empty)
        
        (on-table R)
        (on-table O)
        (on-table Y)
        
        (on B O) 
        
        (clear R)
        (clear B)
        (clear Y)
    )
    
    (:goal (and 
        (on R B)
        (on B Y)
        (on Y O)
    ))