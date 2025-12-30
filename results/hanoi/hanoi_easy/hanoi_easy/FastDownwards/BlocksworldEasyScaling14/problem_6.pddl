(define (problem BlocksworldEasyScaling14)
    (:domain hanoi-4disk)
    (:objects
        a b c d - disk
        l m r - peg
    )
    (:init
        (= (total-cost) 0)
        
        (smaller a b) (smaller a c) (smaller a d)
        (smaller b c) (smaller b d)
        (smaller c d)

        (on-disk a b)
        (on-disk b c)
        (on-disk c d)
        (on-peg d m) 

        (clear-disk a)
        (clear-peg l)
        (clear-peg r)
    )
    (:goal (and
        (on-disk a b)
        (on-disk b c)
        (on-disk c d)
        (on-peg d l)
        
        (clear-peg m)
        (clear-peg r)
        
        (clear-disk a)
    ))
    (:metric minimize (total-cost))
)