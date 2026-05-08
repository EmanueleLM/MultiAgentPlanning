(define (problem hanoi-7-problem)
  (:domain hanoi-7)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 - disk
    A B C - peg
  )

  (:init
    ;; ordering relations (total strict ordering by size: d1 < d2 < ... < d7)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7)
    (smaller d5 d6) (smaller d5 d7)
    (smaller d6 d7)

    ;; initial stacking: all disks on peg C, ordered bottom d7 ... top d1
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 C)

    ;; top/clear/empty facts reflecting the above
    (top C d1)
    (clear d1)
    (empty A)
    (empty B)
    ;; C is not empty (do not assert (empty C))
  )

  (:goal (and
    ;; final stacking: all disks on peg A with same internal order (d1 on d2, ..., d6 on d7, d7 on A)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 A)
    ;; middle peg B must be empty in final state
    (empty B)
  ))
)