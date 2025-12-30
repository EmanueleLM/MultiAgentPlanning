(define (problem blocks-RBY)
    (:domain blocks-specific)
    (:objects
        R O B Y - block ; Red, Orange, Blue, Yellow
        T - object      ; Table constant
    )
    (:init
        (is-table T)
        
        ;; Initial configuration derived from specification: T -> Y -> B -> O -> R
        (on Y T)
        (on B Y)
        (on O B)
        (on R O)
        
        ;; Hand state
        (handempty)
        
        ;; Clears
        (clear R)
    )
    (:goal (and
        ;; Goal: R on Y, B on R. Target structure: T -> Y -> R -> B
        (on R Y)
        (on B R)
        
        ;; Ensure Y is still on the table (base)
        (on Y T)
        
        ;; Block O must be elsewhere, placed on the table
        (on O T)
        (clear O)
        
        ;; Final state constraints
        (handempty)
        (clear B)
    ))
)