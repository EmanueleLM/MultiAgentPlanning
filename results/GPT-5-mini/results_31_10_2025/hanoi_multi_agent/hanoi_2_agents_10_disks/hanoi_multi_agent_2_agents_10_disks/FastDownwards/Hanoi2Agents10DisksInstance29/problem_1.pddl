(define (problem hanoi2agents10-instance29)
  (:domain hanoi-2agents-10)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ; peg emptiness
    (peg-empty middle)
    (peg-empty right)

    ; initial top disk on left
    (on-top A left)

    ; immediate above relations (top -> ... -> bottom)
    (above A B)
    (above B C)
    (above C D)
    (above D E)
    (above E F)
    (above F G)
    (above G H)
    (above H I)
    (above I J)

    ; base disk on left
    (on-base J left)

    ; size ordering (smaller facts). A is smallest, J largest.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; agent movement permissions (static)
    (agent1-allowed A) (agent1-allowed B) (agent1-allowed C) (agent1-allowed D) (agent1-allowed E)
    (agent2-allowed F) (agent2-allowed G) (agent2-allowed H) (agent2-allowed I) (agent2-allowed J)
  )

  (:goal (and
    ; Left peg must have top->bottom: D, E, F, G, H, I, J
    (on-top D left)
    (above D E)
    (above E F)
    (above F G)
    (above G H)
    (above H I)
    (above I J)
    (on-base J left)

    ; Middle peg must have top->bottom: A, B, C
    (on-top A middle)
    (above A B)
    (above B C)
    (on-base C middle)

    ; Right peg must be empty
    (peg-empty right)
  ))
)