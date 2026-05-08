(define (problem hanoi-7-problem)
  (:domain hanoi-7)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 - disk
    left middle right - peg
  )
  (:init
    ;; size-successor chain (only direct neighbors) — yields full ordering via the derived transitive rule
    (succ d1 d2)
    (succ d2 d3)
    (succ d3 d4)
    (succ d4 d5)
    (succ d5 d6)
    (succ d6 d7)

    ;; initial stack on the right peg: top d1 on d2 ... d6 on d7, bottom d7 on peg 'right'
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 right)
  )

  (:goal (and
    ;; full stack moved to left peg with same internal ordering
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 left)
    ;; middle peg must be empty
    (empty middle)
  ))
)