(define (problem BlocksworldMediumScaling3)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        yellow - block
        orange - block
    )
    
    (:init
        (hand-empty)
        
        ;; Initial configuration:
        ;; Stack 1: R on Y, Y on O, O on table.
        (on red yellow)
        (on yellow orange)
        (on-table orange)
        
        ;; Stack 2: B on table.
        (on-table blue)
        
        ;; Clear Status based on setup:
        (clear red)    ; Given: R is clear
        (clear blue)   ; Given: B is clear
        ;; Y is not clear (R on Y), O is not clear (Y on O).
    )
    
    (:goal
        (and
            (on blue orange)
            (on yellow red)
        )
    )
)