(define (problem hanoi_5_problem)
  (:domain hanoi_5)
  ;; Five-disk Tower of Hanoi initial and goal states.
  ;; Disk naming convention: d1 = smallest, d5 = largest.
  (:objects
    d1 d2 d3 d4 d5 - disk
    pegA pegB pegC - peg
  )

  (:init
    ;; Initial tower: all disks stacked on pegA with d5 bottom, down to d1 top.
    (on d5 pegA)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; Clear facts: only the top disk and empty pegs are clear initially.
    (clear d1)
    (clear pegB)
    (clear pegC)
    ;; pegA and disks d2..d5 are not listed as clear (implicitly false).

    ;; Static size ordering (smaller relations).
    ;; d1 is smaller than d2,d3,d4,d5
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    ;; d2 smaller than d3,d4,d5
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    ;; d3 smaller than d4,d5
    (smaller d3 d4) (smaller d3 d5)
    ;; d4 smaller than d5
    (smaller d4 d5)
  )

  ;; Goal: replicate the exact stack on pegC (d5 bottom ... d1 top).
  ;; Every mandated terminal condition is fixed by these on facts.
  (:goal
    (and
      (on d5 pegC)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)
    )
  )
)