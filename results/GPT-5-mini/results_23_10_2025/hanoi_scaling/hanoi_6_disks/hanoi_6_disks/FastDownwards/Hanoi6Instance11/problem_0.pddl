(define (problem hanoi-6-disks)
  (:domain hanoi-multiagent)
  (:objects
    ; disks A (smallest) .. F (largest)
    A B C D E F - disk
    ; pegs
    left_peg middle_peg right_peg - peg
  )

  (:init
    ; Initial stack on left_peg, top -> bottom: A, B, C, D, E, F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left_peg)

    ; Clear predicates: only top elements and empty pegs are clear
    (clear A)
    (clear middle_peg)
    (clear right_peg)
    ; Note: left_peg is not listed as clear (it has F on it). Disks B-F are not listed as clear.

    ; Disk size ordering: A < B < C < D < E < F
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal
    (and
      ; Goal: full stack on right_peg in same order (top A ... bottom F)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F right_peg)
    )
  )
)