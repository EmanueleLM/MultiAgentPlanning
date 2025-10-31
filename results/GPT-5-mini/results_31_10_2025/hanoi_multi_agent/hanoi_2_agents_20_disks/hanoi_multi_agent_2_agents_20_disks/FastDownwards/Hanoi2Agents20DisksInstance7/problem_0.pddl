(define (problem hanoi_problem)
  (:domain hanoi_agents)
  (:objects
    A B C - disk
    left middle right - peg
  )
  (:init
    ;; initial stack: C bottom, B middle, A top on left peg
    (on A B)
    (on B C)
    (on C left)

    ;; which places/disks are clear (no disk on top)
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A < B < C
    (smaller A B)
    (smaller A C)
    (smaller B C)
  )
  (:goal (and
    (on A B)
    (on B C)
    (on C right)
  ))
)