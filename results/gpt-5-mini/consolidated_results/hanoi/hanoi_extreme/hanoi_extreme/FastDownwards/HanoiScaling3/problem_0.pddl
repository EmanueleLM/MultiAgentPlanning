(define (problem hanoi-7-pegs-3)
  (:domain tower-of-hanoi)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 - disk
    pegA pegB pegC - peg
  )

  (:init
    ;; Size (static) relations: smaller di dj for all i < j
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7)
    (smaller d5 d6) (smaller d5 d7)
    (smaller d6 d7)

    ;; Initial stack: all disks on pegA, largest at bottom (d7), then d6 on d7, ..., d1 on d2
    (on d7 pegA)
    (on d6 d7)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; Top-of-stack / clear facts initially:
    (clear d1)    ;; smallest disk is top of the stack
    (clear pegB)  ;; empty pegs are clear
    (clear pegC)
    ;; Note: pegA is not clear initially (it has disks), and other disks are not clear because they have disks on them.
  )

  ;; Goal: move the entire tower to pegC preserving order: d7 on pegC, d6 on d7, ..., d1 on d2
  (:goal (and
    (on d7 pegC)
    (on d6 d7)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
  ))
)