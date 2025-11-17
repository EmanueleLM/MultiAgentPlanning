(define (problem Hanoi2Agents10DisksInstance18)
  (:domain hanoi2agents10)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )
  (:init
    ;; initial direct-support facts (top->bottom A..J on left)
    ;; on X Y means disk X is directly on place Y (disk or peg)
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

    ;; clear = nothing on top; initially only A (top) and empty pegs middle/right are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; agent permissions (static)
    (can-move-agent1 A) (can-move-agent1 B) (can-move-agent1 C) (can-move-agent1 D) (can-move-agent1 E)
    (can-move-agent2 F) (can-move-agent2 G) (can-move-agent2 H) (can-move-agent2 I) (can-move-agent2 J)

    ;; disk size ordering (smaller X Y) for all X < Y in size
    ;; A < B < C < D < E < F < G < H < I < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)
  )

  (:goal (and
    ;; goal stacks: left top->bottom B, E, F, G, H, I, J
    ;; encode as direct-support chain
    (on B E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; right top->bottom A, C, D
    (on A C)
    (on C D)
    (on D right)

    ;; middle must be empty (clear)
    (clear middle)
  ))
)