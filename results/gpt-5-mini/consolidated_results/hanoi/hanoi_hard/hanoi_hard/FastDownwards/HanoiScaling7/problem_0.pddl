(define (problem hanoi6-problem)
  (:domain hanoi-6)
  (:objects
    ;; disks: d1 smallest ... d6 largest
    d1 d2 d3 d4 d5 d6 - disk
    ;; pegs
    pegA pegB pegC - peg
  )

  (:init
    ;; Initial stack on pegA (d6 bottom ... d1 top)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 pegA)

    ;; Clear facts: top disk and empty pegs
    (clear d1)
    (clear pegB)
    (clear pegC)

    ;; Size ordering (strict), enumerated for all ordered pairs where first is larger.
    ;; d6 is largest, then d5, d4, d3, d2, d1 smallest.
    (larger d6 d5) (larger d6 d4) (larger d6 d3) (larger d6 d2) (larger d6 d1)
    (larger d5 d4) (larger d5 d3) (larger d5 d2) (larger d5 d1)
    (larger d4 d3) (larger d4 d2) (larger d4 d1)
    (larger d3 d2) (larger d3 d1)
    (larger d2 d1)
  )

  ;; Goal: move entire stack to pegC preserving order (d6 bottom ... d1 top).
  ;; Also enforce required terminal clear conditions (top disk clear and source pegs empty).
  (:goal (and
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 pegC)
    ;; terminal conditions:
    (clear d1)    ;; top disk must be clear at goal
    (clear pegA)  ;; pegA must be empty
    (clear pegB)  ;; pegB must be empty
  ))
)