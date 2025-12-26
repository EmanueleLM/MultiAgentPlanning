(define (problem blocksworld-easy-scaling-1-problem)
(:domain blocksworld)
(:objects
    B Y R O - block
)

(:init
    (= (total-cost) 0)
    (clear B)
    (clear Y)
    (hand-empty)
    ; Stack Y on R on O
    (on R O)
    (on Y R)
    ; B and O are bases
    (on-table B)
    (on-table O)
)

(:goal (and
    ; Target stack: B on Y on R on O
    (on R O)
    (on Y R)
    (on B Y)
))

(:metric minimize (total-cost))
)