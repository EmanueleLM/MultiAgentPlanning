(define (problem blocksworld_task)
    (:domain blocksworld_planning)
    
    (:objects 
        O - block ; Orange
        Y - block ; Yellow
        B - block ; Blue
        R - block ; Red
    )
    
    (:init
        ;; Stack 1: O on B, B on R (Red on table)
        (on O B)
        (on B R)
        (on_table R)
        
        ;; Stack 2: Y on table
        (on_table Y)
        
        ;; Clear blocks
        (clear O)
        (clear Y)
        
        ;; Hand State
        (hand_empty)
    )
    
    (:goal (and
        (on B R)
        (on Y O)
    ))
)