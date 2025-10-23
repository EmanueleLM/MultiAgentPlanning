(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 - disk
    peg-left peg-mid peg-right - peg
  )

  (:init
    ;; Initial stacked configuration on the left peg: d1 on d2, d2 on d3, ..., d7 on d8, d8 on peg-left
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 d8)
    (on d8 peg-left)

    ;; Clear predicates: only the top disk and empty pegs are clear initially
    (clear d1)
    (clear peg-mid)
    (clear peg-right)

    ;; Size ordering: smaller di dj for all i < j (d1 is smallest, d8 largest)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7) (smaller d1 d8)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7) (smaller d2 d8)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7) (smaller d3 d8)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7) (smaller d4 d8)
    (smaller d5 d6) (smaller d5 d7) (smaller d5 d8)
    (smaller d6 d7) (smaller d6 d8)
    (smaller d7 d8)
  )

  (:goal
    (and
      ;; Goal: same stacked order, but base on the right peg
      (on d1 d2)
      (on d2 d3)
      (on d3 d4)
      (on d4 d5)
      (on d5 d6)
      (on d6 d7)
      (on d7 d8)
      (on d8 peg-right)
    )
  )
)