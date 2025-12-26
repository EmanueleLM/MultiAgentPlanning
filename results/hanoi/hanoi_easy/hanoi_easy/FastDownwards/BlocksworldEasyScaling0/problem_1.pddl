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
        (on O B)
        (on B R)
        (on_table R)
        (on_table Y)
        
        (clear O)
        (clear Y)
        
        (hand_empty)
    )

    (:goal 
        ;; Goal State: Two stacks: B on R, and Y on O.
        (and 
            (on B R)
            (on Y O)
            
            ;; Ensure bases are on the table
            (on_table R)
            (on_table O)
            
            ;; Ensure top blocks are clear
            (clear B)
            (clear Y)
            
            (hand_empty)
        )
    )
)