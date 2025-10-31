(define (problem Hanoi3Agents10DisksInstance2)
  (:domain hanoi-3agents-10)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    EMPTY - support
  )

  (:init
    ; agent-disk memberships
    (agent1-disk A) (agent1-disk B) (agent1-disk C) (agent1-disk D)
    (agent2-disk E) (agent2-disk F) (agent2-disk G)
    (agent3-disk H) (agent3-disk I) (agent3-disk J)

    ; initial immediate-support (top-to-bottom on left)
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

    ; initial top-of-pegs
    (top left A)
    (top middle EMPTY)
    (top right EMPTY)

    ; size ordering: smaller disk -> larger disk/support
    ; enumerate all strict pairs A < B < C < D < E < F < G < H < I < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; every disk is also smaller than the EMPTY sentinel (so placing on an empty peg is allowed)
    (smaller A EMPTY) (smaller B EMPTY) (smaller C EMPTY) (smaller D EMPTY)
    (smaller E EMPTY) (smaller F EMPTY) (smaller G EMPTY) (smaller H EMPTY)
    (smaller I EMPTY) (smaller J EMPTY)

    ; ---------------------------
    ; Plan hint (merged move sequence); this is a human-readable hint for the orchestrator/solver
    ; The following comment lists the intended verified action sequence:
    ; 1  agent_1: move disk A from left to right
    ; 2  agent_1: move disk B from left to middle
    ; 3  agent_1: move disk A from right to middle
    ; 4  agent_1: move disk C from left to right
    ; 5  agent_1: move disk A from middle to left
    ; 6  agent_1: move disk B from middle to right
    ; 7  agent_1: move disk A from left to right
    ; 8  agent_1: move disk D from left to middle
    ; 9  agent_1: move disk A from right to middle
    ; 10 agent_1: move disk B from right to left
    ; 11 agent_1: move disk A from middle to left
    ; 12 agent_1: move disk C from right to middle
    ; 13 agent_1: move disk A from left to right
    ; 14 agent_1: move disk B from left to middle
    ; 15 agent_1: move disk A from right to middle
    ; 16 agent_2: move disk E from left to right
    ; 17 agent_1: move disk A from middle to left
    ; 18 agent_1: move disk B from middle to right
    ; 19 agent_1: move disk A from left to middle
    ; ---------------------------
  )

  (:goal (and
    ; final left peg top->bottom: F G H I J
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ; final middle top->bottom: A C D  (A on C, C on D, D on middle)
    (on A C)
    (on C D)
    (on D middle)

    ; final right top->bottom: B E
    (on B E)
    (on E right)
  ))
)