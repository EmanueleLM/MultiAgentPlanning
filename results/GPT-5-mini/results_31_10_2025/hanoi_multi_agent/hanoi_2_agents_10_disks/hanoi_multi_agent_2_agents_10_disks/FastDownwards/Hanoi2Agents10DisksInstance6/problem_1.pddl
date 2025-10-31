(define (problem Hanoi2Agents10DisksInstance6-problem)
  (:domain hanoi-2agents-10)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ; initial stack on left: top->bottom A,B,C,D,E,F,G,H,I,J encoded via on relations
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ; clear: top elements and empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ; size ordering: smaller facts (A smallest, J largest)
    ; A smaller than all others
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    ; B smaller than larger ones
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    ; C
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    ; D
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    ; E
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    ; F
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    ; G
    (smaller G H) (smaller G I) (smaller G J)
    ; H
    (smaller H I) (smaller H J)
    ; I
    (smaller I J)
  )

  (:goal (and
    ; left peg final stack: top->bottom C, E, F, G, H, I, J
    (on C E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ; middle peg single disk B
    (on B middle)

    ; right peg top->bottom A, D
    (on A D)
    (on D right)
  ))
)