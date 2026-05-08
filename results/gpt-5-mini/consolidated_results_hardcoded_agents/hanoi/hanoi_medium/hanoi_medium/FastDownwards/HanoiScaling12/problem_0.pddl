(define (problem hanoi-five)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )
  (:init
    ; Initial tower on the right peg (E is bottom, A is top):
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ; Clear/top facts (only the top disk is clear; the middle peg starts empty)
    (clear A)
    (clear middle)

    ; Note: other places/ disks are not listed as clear initially (implicitly false)

    ; Disk size ordering: A < B < C < D < E (transitively enumerated)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal
    (and
      ; Goal: entire tower moved to the left peg with the same size ordering (E bottom, A top)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E left)

      ; The middle peg must be empty in the terminal state
      (clear middle)
    )
  )
)