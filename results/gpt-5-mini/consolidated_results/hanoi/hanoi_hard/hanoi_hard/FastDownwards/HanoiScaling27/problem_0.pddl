(define (problem hanoi6-instance)
  (:domain hanoi-six)

  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    a b c - peg
  )

  (:init
    ;; initial stack on peg a: d6 (largest) at bottom, then d5, d4, d3, d2, d1 (top)
    (on-peg d6 a)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; locations: every disk's peg (all start on peg a)
    (loc d6 a)
    (loc d5 a)
    (loc d4 a)
    (loc d3 a)
    (loc d2 a)
    (loc d1 a)

    ;; clear/top relations: only the smallest (d1) is top initially
    (clear d1)

    ;; pegs b and c are empty initially; peg a is not empty (omitted)
    (empty b)
    (empty c)

    ;; size ordering: smaller di dj for i < j
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  (:goal
    (and
      ;; all disks must be on peg c with the exact same stacked order:
      ;; d6 directly on peg c, d5 on d6, d4 on d5, d3 on d4, d2 on d3, d1 on d2
      (on-peg d6 c)
      (on-disk d5 d6)
      (on-disk d4 d5)
      (on-disk d3 d4)
      (on-disk d2 d3)
      (on-disk d1 d2)

      ;; location facts for completeness (redundant but explicit)
      (loc d6 c)
      (loc d5 c)
      (loc d4 c)
      (loc d3 c)
      (loc d2 c)
      (loc d1 c)

      ;; final top is d1
      (clear d1)

      ;; other pegs must be empty in final terminal state
      (empty a)
      (empty b)
    )
  )
)