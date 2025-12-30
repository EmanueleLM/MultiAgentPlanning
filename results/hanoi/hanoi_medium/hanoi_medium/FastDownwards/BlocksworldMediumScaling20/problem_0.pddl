```pddl
(define (problem four-block-arrangement)
    (:domain blocksworld-4blocks)
    (:objects
        r - block ; red
        b - block ; blue
        y - block ; yellow
        o - block ; orange
    )
    (:init
        ;; Initial state setup (r->b->y->o->table)
        (on r b)
        (on b y)
        (on y o)
        (ontable o) ; Corrected to use standard 'ontable' predicate

        ;; Clear status: only the top block (r) is clear
        (clear r)

        ;; Hand status
        (hand-empty)
    )
    (:goal
        (and
            (on o r) ; Goal 1: orange is on red
            (on y b) ; Goal 2: yellow is on blue
        )
    )
)
```