(define (problem hanoi-7-problem)
  (:domain hanoi-7)

  (:objects
    left middle right - peg
    A B C D E F G - disk
  )

  (:init
    ; type facts
    (peg left) (peg middle) (peg right)
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G)

    ; immediate supports -- initial stack on left: top->bottom A, B, C, D, E, F, G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ; transitive membership: every disk is on peg left initially
    (on-peg A left)
    (on-peg B left)
    (on-peg C left)
    (on-peg D left)
    (on-peg E left)
    (on-peg F left)
    (on-peg G left)

    ; top facts: A is top on left
    (top A left)

    ; clear objects: A has nothing on it; pegs middle and right are empty/clear
    (clear A)
    (clear middle)
    (clear right)

    ; empty pegs
    (empty middle)
    (empty right)

    ; size ordering: smaller relations A < B < C < D < E < F < G (enumerated)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ; Goal: all disks are on the right peg (transitively)
    (on-peg A right)
    (on-peg B right)
    (on-peg C right)
    (on-peg D right)
    (on-peg E right)
    (on-peg F right)
    (on-peg G right)
  ))
)