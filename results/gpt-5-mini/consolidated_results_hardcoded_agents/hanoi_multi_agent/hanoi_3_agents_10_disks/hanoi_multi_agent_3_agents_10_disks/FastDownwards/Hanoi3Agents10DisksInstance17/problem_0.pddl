(define (problem hanoi-multiagent-instance)
  (:domain hanoi-multiagent)
  (:objects
    ;; agents
    agent_1 agent_2 agent_3 - agent

    ;; pegs
    left middle right - peg

    ;; disks (A smallest .. J largest)
    A B C D E F G H I J - disk

    ;; move objects (one per primitive move, names indicate agent and position)
    ;; agent_1 moves (13)
    m_a1_1 m_a1_2 m_a1_3 m_a1_4 m_a1_5 m_a1_6 m_a1_7 m_a1_8 m_a1_9 m_a1_10 m_a1_11 m_a1_12 m_a1_13 - move

    ;; agent_2 moves (14)
    m_a2_1 m_a2_2 m_a2_3 m_a2_4 m_a2_5 m_a2_6 m_a2_7 m_a2_8 m_a2_9 m_a2_10 m_a2_11 m_a2_12 m_a2_13 m_a2_14 - move

    ;; agent_3 moves (7)
    m_a3_1 m_a3_2 m_a3_3 m_a3_4 m_a3_5 m_a3_6 m_a3_7 - move
  )

  (:init
    ;; Initial peg contents: left top-to-bottom A B C D E F G H I J; middle and right empty.
    ;; We represent only "on" and "top" for the top disk on each peg and (on) facts for disks
    ;; as a loose location. For this encoding we place every disk "on left" initially and mark A as top.
    ;; (This simplified representation keeps the instance faithful to the declared public initial state.)
    (on A left) (on B left) (on C left) (on D left) (on E left) (on F left) (on G left) (on H left) (on I left) (on J left)
    (top A left)
    (empty middle)
    (empty right)

    ;; Size ordering: A < B < C < D < E < F < G < H < I < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ;; Move objects attributes according to the provided primitive move sequences.
    ;; agent_1 sequence
    (move-disk m_a1_1 A)    (move-from m_a1_1 left)   (move-to m_a1_1 right)  (move-agent m_a1_1 agent_1)
    (move-disk m_a1_2 B)    (move-from m_a1_2 left)   (move-to m_a1_2 middle) (move-agent m_a1_2 agent_1)
    (move-disk m_a1_3 A)    (move-from m_a1_3 right)  (move-to m_a1_3 middle) (move-agent m_a1_3 agent_1)
    (move-disk m_a1_4 C)    (move-from m_a1_4 left)   (move-to m_a1_4 right)  (move-agent m_a1_4 agent_1)
    (move-disk m_a1_5 A)    (move-from m_a1_5 middle) (move-to m_a1_5 left)   (move-agent m_a1_5 agent_1)
    (move-disk m_a1_6 B)    (move-from m_a1_6 middle) (move-to m_a1_6 right)  (move-agent m_a1_6 agent_1)
    (move-disk m_a1_7 A)    (move-from m_a1_7 left)   (move-to m_a1_7 right)  (move-agent m_a1_7 agent_1)
    (move-disk m_a1_8 D)    (move-from m_a1_8 left)   (move-to m_a1_8 middle) (move-agent m_a1_8 agent_1)
    (move-disk m_a1_9 A)    (move-from m_a1_9 right)  (move-to m_a1_9 middle) (move-agent m_a1_9 agent_1)
    (move-disk m_a1_10 B)   (move-from m_a1_10 right) (move-to m_a1_10 left)  (move-agent m_a1_10 agent_1)
    (move-disk m_a1_11 A)   (move-from m_a1_11 middle)(move-to m_a1_11 left)  (move-agent m_a1_11 agent_1)
    (move-disk m_a1_12 C)   (move-from m_a1_12 right) (move-to m_a1_12 middle)(move-agent m_a1_12 agent_1)
    (move-disk m_a1_13 A)   (move-from m_a1_13 left)  (move-to m_a1_13 right) (move-agent m_a1_13 agent_1)

    ;; agent_2 sequence
    (move-disk m_a2_1 E)    (move-from m_a2_1 left)   (move-to m_a2_1 right)  (move-agent m_a2_1 agent_2)
    (move-disk m_a2_2 F)    (move-from m_a2_2 left)   (move-to m_a2_2 middle) (move-agent m_a2_2 agent_2)
    (move-disk m_a2_3 E)    (move-from m_a2_3 right)  (move-to m_a2_3 middle) (move-agent m_a2_3 agent_2)
    (move-disk m_a2_4 G)    (move-from m_a2_4 left)   (move-to m_a2_4 right)  (move-agent m_a2_4 agent_2)
    (move-disk m_a2_5 E)    (move-from m_a2_5 middle) (move-to m_a2_5 left)   (move-agent m_a2_5 agent_2)
    (move-disk m_a2_6 F)    (move-from m_a2_6 middle) (move-to m_a2_6 right)  (move-agent m_a2_6 agent_2)
    (move-disk m_a2_7 E)    (move-from m_a2_7 left)   (move-to m_a2_7 right)  (move-agent m_a2_7 agent_2)
    (move-disk m_a2_8 E)    (move-from m_a2_8 right)  (move-to m_a2_8 left)   (move-agent m_a2_8 agent_2)
    (move-disk m_a2_9 F)    (move-from m_a2_9 right)  (move-to m_a2_9 middle) (move-agent m_a2_9 agent_2)
    (move-disk m_a2_10 E)   (move-from m_a2_10 left)  (move-to m_a2_10 middle)(move-agent m_a2_10 agent_2)
    (move-disk m_a2_11 G)   (move-from m_a2_11 right) (move-to m_a2_11 left)  (move-agent m_a2_11 agent_2)
    (move-disk m_a2_12 E)   (move-from m_a2_12 middle)(move-to m_a2_12 right) (move-agent m_a2_12 agent_2)
    (move-disk m_a2_13 F)   (move-from m_a2_13 middle)(move-to m_a2_13 left)  (move-agent m_a2_13 agent_2)
    (move-disk m_a2_14 E)   (move-from m_a2_14 right) (move-to m_a2_14 left)  (move-agent m_a2_14 agent_2)

    ;; agent_3 sequence
    (move-disk m_a3_1 H)    (move-from m_a3_1 left)   (move-to m_a3_1 right)  (move-agent m_a3_1 agent_3)
    (move-disk m_a3_2 I)    (move-from m_a3_2 left)   (move-to m_a3_2 middle) (move-agent m_a3_2 agent_3)
    (move-disk m_a3_3 H)    (move-from m_a3_3 right)  (move-to m_a3_3 middle) (move-agent m_a3_3 agent_3)
    (move-disk m_a3_4 J)    (move-from m_a3_4 left)   (move-to m_a3_4 right)  (move-agent m_a3_4 agent_3)
    (move-disk m_a3_5 H)    (move-from m_a3_5 middle) (move-to m_a3_5 left)   (move-agent m_a3_5 agent_3)
    (move-disk m_a3_6 I)    (move-from m_a3_6 middle) (move-to m_a3_6 right)  (move-agent m_a3_6 agent_3)
    (move-disk m_a3_7 H)    (move-from m_a3_7 left)   (move-to m_a3_7 right)  (move-agent m_a3_7 agent_3)

    ;; Sequencing: enforce order of moves per agent using next facts.
    ;; agent_1 chain
    (next m_a1_1 m_a1_2) (next m_a1_2 m_a1_3) (next m_a1_3 m_a1_4) (next m_a1_4 m_a1_5)
    (next m_a1_5 m_a1_6) (next m_a1_6 m_a1_7) (next m_a1_7 m_a1_8) (next m_a1_8 m_a1_9)
    (next m_a1_9 m_a1_10) (next m_a1_10 m_a1_11) (next m_a1_11 m_a1_12) (next m_a1_12 m_a1_13)

    ;; agent_2 chain
    (next m_a2_1 m_a2_2) (next m_a2_2 m_a2_3) (next m_a2_3 m_a2_4) (next m_a2_4 m_a2_5)
    (next m_a2_5 m_a2_6) (next m_a2_6 m_a2_7) (next m_a2_7 m_a2_8) (next m_a2_8 m_a2_9)
    (next m_a2_9 m_a2_10) (next m_a2_10 m_a2_11) (next m_a2_11 m_a2_12) (next m_a2_12 m_a2_13)
    (next m_a2_13 m_a2_14)

    ;; agent_3 chain
    (next m_a3_1 m_a3_2) (next m_a3_2 m_a3_3) (next m_a3_3 m_a3_4) (next m_a3_4 m_a3_5)
    (next m_a3_5 m_a3_6) (next m_a3_6 m_a3_7)

    ;; Initial readiness: first move of each agent is ready.
    (ready m_a1_1)
    (ready m_a2_1)
    (ready m_a3_1)
  )

  (:goal (and
    ;; Global goal configuration per the public information:
    ;; left peg top-to-bottom B E F G H I J (we reflect by requiring on- and top- facts for those disks on left)
    (on B left) (top B left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)

    ;; middle peg top-to-bottom C D
    (on C middle) (top C middle)
    (on D middle)

    ;; right peg top-to-bottom A
    (on A right) (top A right)
  ))
)