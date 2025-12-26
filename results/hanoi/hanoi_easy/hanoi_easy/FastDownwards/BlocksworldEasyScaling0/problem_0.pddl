(define (problem blocksworld-task)
    (:domain blocksworld)
    
    (:objects 
        O - block  ; Orange
        Y - block  ; Yellow
        B - block  ; Blue
        R - block  ; Red
    )

    (:init
        ;; Initial State: (O on B), (B on R), (Y on table). Hand empty.
        (on O B)
        (on B R)
        (on_table R)
        (on_table Y)
        
        (clear O)
        (clear Y)
        
        (hand_empty)
    )

    (:goal 
        ;; Goal State: (B on R), (Y on O).
        (and 
            (on B R)
            (on Y O)
        )
    )
)