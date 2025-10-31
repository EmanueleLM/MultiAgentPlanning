(define (problem Hanoi3Agents10DisksInstance13)
  (:domain multi-agent-hanoi)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 orchestrator - agent
  )

  (:init
    ;; initial stack on left (top->bottom): A,B,C,D,E,F,G,H,I,J
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

    ;; only the top disk A is clear; middle and right pegs start empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering among disks (explicit)
    ;; A < B..J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    ;; B < C..J
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    ;; C < D..J
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    ;; D < E..J
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    ;; E < F..J
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    ;; F < G..J
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    ;; G < H..J
    (smaller G H) (smaller G I) (smaller G J)
    ;; H < I,J
    (smaller H I) (smaller H J)
    ;; I < J
    (smaller I J)

    ;; pegs are considered larger than any disk (allow disk->peg moves)
    (smaller A left) (smaller A middle) (smaller A right)
    (smaller B left) (smaller B middle) (smaller B right)
    (smaller C left) (smaller C middle) (smaller C right)
    (smaller D left) (smaller D middle) (smaller D right)
    (smaller E left) (smaller E middle) (smaller E right)
    (smaller F left) (smaller F middle) (smaller F right)
    (smaller G left) (smaller G middle) (smaller G right)
    (smaller H left) (smaller H middle) (smaller H right)
    (smaller I left) (smaller I middle) (smaller I right)
    (smaller J left) (smaller J middle) (smaller J right)

    ;; agent permissions per specification
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
  )

  ;; Goal: left peg (top->bottom) B,E,F,G,H,I,J; middle peg C,D; right peg A
  ;; expressed as pairwise on-relations with pegs
  (:goal (and
    ;; right peg has A
    (on A right)
    ;; middle peg has C on D and D on middle
    (on C D)
    (on D middle)
    ;; left peg stack top->bottom B,E,F,G,H,I,J
    (on B E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
  ))
)