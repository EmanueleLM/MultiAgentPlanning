(define (problem Hanoi3Agents10DisksInstance5)
  (:domain hanoi-3agents-10)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 orchestrator - agent
  )

  ; Initial configuration: left peg top->bottom A B C D E F G H I J
  ; Represented as: A on B, B on C, C on D, D on E, E on F, F on G, G on H, H on I, I on J, J on peg left

  (:init
    ; disk stacking on left
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg  J left)

    ; clear flags: top disk A is clear; middle and right pegs empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ; agent move capabilities
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)

    (can-move agent_2 E)
    (can-move agent_2 F)
    (can-move agent_2 G)

    (can-move agent_3 H)
    (can-move agent_3 I)
    (can-move agent_3 J)

    ; size ordering: smaller facts (A < B < C < D < E < F < G < H < I < J)
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

  ; The final plan (ordered primitive moves) is included here as comments:
  ; agent_1: move disk A from left to middle
  ; agent_1: move disk B from left to right
  ; agent_1: move disk A from middle to right
  ; agent_1: move disk C from left to middle

  (:goal (and
    ; left peg should have top->bottom D E F G H I J
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg J left)

    ; middle peg should have C
    (on-peg C middle)

    ; right peg should have top->bottom A B (A on B, B on peg right)
    (on-disk A B)
    (on-peg B right)
  ))
)