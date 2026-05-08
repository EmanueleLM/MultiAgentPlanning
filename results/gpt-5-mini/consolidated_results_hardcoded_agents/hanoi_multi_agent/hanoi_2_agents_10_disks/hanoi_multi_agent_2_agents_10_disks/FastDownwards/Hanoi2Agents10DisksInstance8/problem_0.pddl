(define (problem hanoi10-dualagents)
  (:domain hanoi-dualagents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )
  (:init
    ;; Initial stack on left peg: top->bottom A,B,C,D,E,F,G,H,I,J
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

    ;; Pegs middle and right are empty
    (clear middle)
    (clear right)

    ;; Top disk A is clear
    (clear A)

    ;; Disk size ordering: smaller(x,y) if x is smaller than y
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

    ;; Agent movement capabilities (hard constraints)
    ;; agent_1 may only move A-E
    (can-move-agent1 A) (can-move-agent1 B) (can-move-agent1 C) (can-move-agent1 D) (can-move-agent1 E)
    ;; agent_2 may only move F-J
    (can-move-agent2 F) (can-move-agent2 G) (can-move-agent2 H) (can-move-agent2 I) (can-move-agent2 J)
  )

  (:goal (and
    ;; Goal configuration:
    ;; left peg top->bottom: A, B, D, E, F, G, H, I, J
    ;; middle peg: C
    ;; right peg empty
    (on A B)
    (on B D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
    (on C middle)
  ))
)