(define (problem hanoi-5)
  (:domain hanoi-domain)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ; Initial stack on left peg: from top A down to E (E at bottom on peg)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ; Clear predicates: only the top disk and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ; Size relations (A smallest, E largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ; All disks moved to right peg preserving order (E bottom, A top)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)
  ))
)