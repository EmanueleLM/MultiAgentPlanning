; PDDL problem for Tower of Hanoi with 5 disks: A (smallest) ... E (largest)
; Public information: three pegs (left, middle, right), 5 disks A..E smallest->largest A..E,
; Initial configuration: left peg top->bottom A,B,C,D,E; middle and right empty.
; Goal: move entire stack to right peg top->bottom A,B,C,D,E.
; Manager peg reports were not provided separately; the above initial configuration
; is public and used as the explicit initial facts below (documented).

(define (problem Hanoi5Instance14)
  (:domain hanoi)

  (:objects
    A B C D E left middle right - place
  )

  (:init
    ; type markers
    (disk A) (disk B) (disk C) (disk D) (disk E)
    (peg left) (peg middle) (peg right)

    ; size ordering: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ; Initial stacking (top -> bottom on left): A on B, B on C, C on D, D on E, E on left peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ; Clear facts: topmost disk A and empty pegs
    (clear A)
    (clear middle)
    (clear right)
    ; All other disks that have something on them are not declared clear.
  )

  (:goal (and
    ; final stack on right: E bottom on right, then D on E, C on D, B on C, A on B
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)
  ))
)