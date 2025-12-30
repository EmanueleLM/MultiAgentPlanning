(define (problem four-block-arrangement)
    (:domain blocksworld-4blocks)
    (:objects
        r - block
        b - block
        y - block
        o - block
    )
    (:init
        (= (total-cost) 0)
        
        ;; Initial state setup (r->b->y->o->table)
        (on r b)
        (on b y)
        (on y o)
        (ontable o) 

        ;; Clear status
        (clear r)

        ;; Hand status
        (hand-empty)
    )
    (:goal
        (and
            (on o r) ; Goal: orange is on red
            (on y b) ; Goal: yellow is on blue
        )
    )
    (:metric minimize (total-cost))
)