(define (problem blocksworld-task)
    (:domain blocksworld)
    
    (:objects 
        O - block  ; Orange
        Y - block  ; Yellow
        B - block  ; Blue
        R - block  ; Red
    )

    (:init
        ;; Initial State: O/B/R stack, Y on table.
        ;; on(orange, blue), on(blue, red), on_table(red), on_table(yellow), clear(orange), clear(yellow), hand_empty.
        (on O B)
        (on B R)
        (on_table R)
        (on_table Y)
        
        (clear O)
        (clear Y)
        
        (hand_empty)
    )

    (:goal 
        ;; Goal State: on(blue, red), on(yellow, orange).
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