(define (problem blocks-arrangement)
    (:domain blocksworld)
    (:objects
        R Y B O - block
        T - object ; Table surface
    )
    (:init
        ; Initial stack configuration: R/Y/B/O on T
        (on R Y)
        (on Y B)
        (on B O)
        (on O T)

        (hand-empty)
        
        ; Clearances: R is clear (as stated). T (Table) is perpetually clear.
        (clear R)
        (clear T)
        
        ; Y, B, O are implicitly not clear because blocks are on them (R, Y, B respectively).

        (= (total-cost) 0)
    )
    (:goal (and
        ; Goal: O on R, R on B. (O/R/B stack)
        (on R B)
        (on O R)
    ))
    (:metric minimize (total-cost))