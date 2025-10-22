(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ; Initial stack on left peg (top -> bottom): A, B, C, D, E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ; Other pegs are empty
    (clear middle)
    (clear right)

    ; Top disk on left is A
    (clear A)

    ; Size ordering: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ; All disks stacked on right in order top -> bottom: A, B, C, D, E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)
  ))
)