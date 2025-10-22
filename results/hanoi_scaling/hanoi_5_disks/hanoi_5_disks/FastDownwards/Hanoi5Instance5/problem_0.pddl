(define (problem hanoi-5)
  (:domain hanoi-domain)
  (:objects
    d1 d2 d3 d4 d5 - disk
    peg-left peg-mid peg-right - peg
  )
  (:init
    ;; Initial stack on the left peg: d5 (largest) at bottom ... d1 (smallest) on top
    (on d5 peg-left)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; Clear places: top disk and empty pegs
    (clear d1)
    (clear peg-mid)
    (clear peg-right)

    ;; Size ordering (smaller relations)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d1 d5)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d2 d5)
    (smaller d3 d4)
    (smaller d3 d5)
    (smaller d4 d5)
  )

  (:goal (and
    ;; All disks moved to the right peg preserving ordering:
    (on d5 peg-right)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
  ))
)