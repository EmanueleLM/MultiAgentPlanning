(define (problem blocksworld-task)
    (:domain blocksworld)
    
    (:objects 
        O - block  ; Orange
        Y - block  ; Yellow
        B - block  ; Blue
        R - block  ; Red
    )

    (:init
        (on O B)
        (on B R)
        (on_table R)
        (on_table Y)
        
        (clear O)
        (clear Y)
        
        (hand_empty)
    )

    (:goal 
        (and 
            (on B R)
            (on Y O)
            
            (on_table R)
            (on_table O)
            
            (clear B)
            (clear Y)
            
            (hand_empty)
        )
    )
)