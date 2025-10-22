(define (problem hanoi-8-multiagent)
  (:domain hanoi-multiagent)
  (:objects
    ; disks: d1 is smallest, d8 is largest
    d1 d2 d3 d4 d5 d6 d7 d8 - disk
    left middle right - peg
    ; place type is implied by peg/disk types
  )

  (:init
    ; Initial Tower on left peg: bottom d8 on left, then d7 on d8, ..., top d1 on d2
    (on d8 left)
    (on d7 d8)
    (on d6 d7)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; Clear facts: only the topmost disk of the initial stack is clear, and empty pegs are clear
    (clear d1)
    (clear middle)
    (clear right)
    ; left peg is not clear initially (has disks), and disks d2..d8 not clear (not listed)

    ; Static size relations: smaller di dj iff i < j (d1 smallest)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7) (smaller d1 d8)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7) (smaller d2 d8)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7) (smaller d3 d8)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7) (smaller d4 d8)
    (smaller d5 d6) (smaller d5 d7) (smaller d5 d8)
    (smaller d6 d7) (smaller d6 d8)
    (smaller d7 d8)
  )

  (:goal (and
    ; Goal: all disks stacked on the right peg in correct order (d8 bottom, d1 top)
    (on d8 right)
    (on d7 d8)
    (on d6 d7)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)
  ))
)