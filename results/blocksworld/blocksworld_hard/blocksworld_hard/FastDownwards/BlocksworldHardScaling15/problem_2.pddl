(define (problem blocksworld-instance-1)
    (:domain blocksworld-4blocks)
    (:objects
        r - block
        b - block
        o - block
        y - block
    )
    (:init
        (handempty)
        ; Initial structure: B on O, O on Y, R on table, Y on table.
        (on b o)
        (on o y)
        (ontable r)
        (ontable y)

        ; Explicitly stated clear blocks (R and B are the top of their respective structures)
        (clear r)
        (clear b)
    )
    (:goal
        (and
            ; Goal stack: B -> R -> Y -> O (O on table)
            (on b r)
            (on r y)
            (on y o)
            (ontable o)
        )
    )