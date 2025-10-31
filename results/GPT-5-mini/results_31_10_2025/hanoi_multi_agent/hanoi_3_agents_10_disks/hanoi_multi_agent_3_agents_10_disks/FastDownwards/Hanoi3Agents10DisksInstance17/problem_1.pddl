(define (problem Hanoi3Agents10DisksInstance17)
  (:domain hanoi-multiagent-10)

  (:objects
    ;; agents
    agent_1 agent_2 agent_3 orchestrator - agent

    ;; pegs
    left middle right - peg

    ;; disks
    A B C D E F G H I J - disk

    ;; move objects: we enumerate each primitive move in the proposed solution as its own move object.
    ;; They are named to indicate agent and sequence number within that agent's intended ordering,
    ;; but in this problem they are chained globally to enforce a single feasible execution order.
    m1  m2  m3  m4  m5  m6  m7  m8  m9  m10 m11 m12 m13
    m14 m15 m16 m17 m18 m19 m20 m21 m22 m23 m24 m25 m26
    m27 m28 m29 m30 m31 m32 m33 m34 m35 m36 m37 m38 m39
    - move
  )

  (:init
    ;; initial locations: every disk initially on left; A is top of left.
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)
    (top A left)
    (empty middle)
    (empty right)

    ;; size relations
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ;; Move-object attributes and meta facts.
    ;; We encode the proposed primitive moves as separate move objects m1..m39 in the exact order
    ;; shown in <proposed_solution>. To enforce a single global execution order we chain them with next facts.
    ;; For each move we declare: which disk moves, from which peg to which peg, which agent is responsible,
    ;; whether the destination is expected to have an existing top (dest-top) and which disk (if any) becomes
    ;; the top at the source peg after the move (becomes-top) or whether the source becomes empty (becomes-empty).
    ;; The chain below enforces the global order of primitive moves.

    ;; -----------------------------
    ;; agent_1 moves (13) -> m1 .. m13
    ;; -----------------------------
    (move-disk m1 A)    (move-from m1 left)   (move-to m1 right)  (move-agent m1 agent_1)
    ;; after m1: top at left becomes B
    (becomes-top m1 B)

    (move-disk m2 B)    (move-from m2 left)   (move-to m2 middle) (move-agent m2 agent_1)
    ;; m2 moves B from left; source top becomes C
    (becomes-top m2 C)
    ;; destination middle was empty at this time in our execution plan, so dest not non-empty.

    (move-disk m3 A)    (move-from m3 right)  (move-to m3 middle) (move-agent m3 agent_1)
    ;; m3 puts A on top of B at middle. so dest-top for m3 is B (B must be top at middle before m3).
    (dest-top m3 B)
    (becomes-top m3 C)  ;; after removing A from right, right becomes empty -> becomes-empty would be more appropriate, but in this chain right will become empty: we mark becomes-empty
    (becomes-empty m3)

    (move-disk m4 C)    (move-from m4 left)   (move-to m4 right)  (move-agent m4 agent_1)
    (becomes-top m4 D)

    (move-disk m5 A)    (move-from m5 middle) (move-to m5 left)   (move-agent m5 agent_1)
    ;; m5 moves A from middle to left (on top of D's stack). dest-top not required (left top must be D),
    (dest-top m5 D)
    (becomes-top m5 C) ;; after removing A from middle, top becomes B

    (move-disk m6 B)    (move-from m6 middle) (move-to m6 right)  (move-agent m6 agent_1)
    ;; m6 moves B from middle to right on top of C. dest-top is C
    (dest-top m6 C)
    (becomes-empty m6) ;; after removing B from middle, middle becomes empty

    (move-disk m7 A)    (move-from m7 left)   (move-to m7 right)  (move-agent m7 agent_1)
    ;; m7 moves A from left to right onto B; dest-top at right is B
    (dest-top m7 B)
    (becomes-top m7 D)

    (move-disk m8 D)    (move-from m8 left)   (move-to m8 middle) (move-agent m8 agent_1)
    ;; move D to middle; middle is expected empty now.
    (becomes-top m8 E)  ;; after removing D, left top becomes E

    (move-disk m9 A)    (move-from m9 right)  (move-to m9 middle) (move-agent m9 agent_1)
    ;; m9 places A on top of D at middle; dest-top is D
    (dest-top m9 D)
    (becomes-top m9 B)  ;; right top becomes B

    (move-disk m10 B)   (move-from m10 right) (move-to m10 left)  (move-agent m10 agent_1)
    ;; move B back to left, destination top at left expected to be E (so B goes on E)
    (dest-top m10 E)
    (becomes-empty m10) ;; right becomes empty

    (move-disk m11 A)   (move-from m11 middle)(move-to m11 left)  (move-agent m11 agent_1)
    ;; m11 moves A to left, landing on B
    (dest-top m11 B)
    (becomes-top m11 D) ;; middle top becomes D

    (move-disk m12 C)   (move-from m12 right) (move-to m12 middle)(move-agent m12 agent_1)
    ;; m12 moves C onto D at middle; dest-top D
    (dest-top m12 D)
    (becomes-empty m12) ;; right becomes empty

    (move-disk m13 A)   (move-from m13 left)  (move-to m13 right) (move-agent m13 agent_1)
    ;; m13 moves A to right final position
    (becomes-top m13 B)
    ;; -----------------------------
    ;; agent_2 moves (14) -> m14 .. m27
    ;; -----------------------------
    (move-disk m14 E)   (move-from m14 left)   (move-to m14 right)  (move-agent m14 agent_2)
    (becomes-top m14 F)

    (move-disk m15 F)   (move-from m15 left)   (move-to m15 middle) (move-agent m15 agent_2)
    (becomes-top m15 G)

    (move-disk m16 E)   (move-from m16 right)  (move-to m16 middle) (move-agent m16 agent_2)
    (dest-top m16 F)
    (becomes-top m16 G)

    (move-disk m17 G)   (move-from m17 left)   (move-to m17 right)  (move-agent m17 agent_2)
    (becomes-top m17 H)

    (move-disk m18 E)   (move-from m18 middle) (move-to m18 left)   (move-agent m18 agent_2)
    (dest-top m18 G)
    (becomes-top m18 F)

    (move-disk m19 F)   (move-from m19 middle) (move-to m19 right)  (move-agent m19 agent_2)
    (dest-top m19 G)
    (becomes-empty m19)

    (move-disk m20 E)   (move-from m20 left)   (move-to m20 right)  (move-agent m20 agent_2)
    (dest-top m20 G)
    (becomes-top m20 H)

    (move-disk m21 E)   (move-from m21 right)  (move-to m21 left)   (move-agent m21 agent_2)
    (becomes-top m21 F)

    (move-disk m22 F)   (move-from m22 right)  (move-to m22 middle) (move-agent m22 agent_2)
    (dest-top m22 G)
    (becomes-empty m22)

    (move-disk m23 E)   (move-from m23 left)   (move-to m23 middle)(move-agent m23 agent_2)
    (dest-top m23 F)
    (becomes-top m23 G)

    (move-disk m24 G)   (move-from m24 right)  (move-to m24 left)  (move-agent m24 agent_2)
    (dest-top m24 H)
    (becomes-top m24 F)

    (move-disk m25 E)   (move-from m25 middle) (move-to m25 right) (move-agent m25 agent_2)
    (dest-top m25 G)
    (becomes-empty m25)

    (move-disk m26 F)   (move-from m26 middle) (move-to m26 left)  (move-agent m26 agent_2)
    (dest-top m26 E)
    (becomes-top m26 G)

    (move-disk m27 E)   (move-from m27 right)  (move-to m27 left)  (move-agent m27 agent_2)
    (dest-top m27 F)
    (becomes-top m27 H)

    ;; -----------------------------
    ;; agent_3 moves (7) -> m28 .. m34
    ;; -----------------------------
    (move-disk m28 H)   (move-from m28 left)   (move-to m28 right) (move-agent m28 agent_3)
    (becomes-top m28 I)

    (move-disk m29 I)   (move-from m29 left)   (move-to m29 middle)(move-agent m29 agent_3)
    (becomes-top m29 J)

    (move-disk m30 H)   (move-from m30 right)  (move-to m30 middle)(move-agent m30 agent_3)
    (dest-top m30 I)
    (becomes-top m30 J)

    (move-disk m31 J)   (move-from m31 left)   (move-to m31 right) (move-agent m31 agent_3)
    (becomes-top m31 H)

    (move-disk m32 H)   (move-from m32 middle) (move-to m32 left)  (move-agent m32 agent_3)
    (dest-top m32 J)
    (becomes-top m32 I)

    (move-disk m33 I)   (move-from m33 middle) (move-to m33 right) (move-agent m33 agent_3)
    (dest-top m33 J)
    (becomes-empty m33)

    (move-disk m34 H)   (move-from m34 left)   (move-to m34 right) (move-agent m34 agent_3)
    (dest-top m34 I)
    (becomes-top m34 G)

    ;; The chain of moves continues with the remaining moves (some agents had more moves in the proposed_solution).
    ;; We map remaining proposed moves to m35..m39 (continuation).
    (move-disk m35 E)   (move-from m35 left)   (move-to m35 right)  (move-agent m35 agent_2)
    (becomes-top m35 F)

    (move-disk m36 F)   (move-from m36 left)   (move-to m36 middle) (move-agent m36 agent_2)
    (becomes-top m36 G)

    (move-disk m37 E)   (move-from m37 right)  (move-to m37 middle) (move-agent m37 agent_2)
    (dest-top m37 F)
    (becomes-top m37 G)

    (move-disk m38 H)   (move-from m38 left)   (move-to m38 right)  (move-agent m38 agent_3)
    (becomes-top m38 I)

    (move-disk m39 A)   (move-from m39 left)   (move-to m39 right)  (move-agent m39 agent_1)
    (becomes-top m39 B)

    ;; -----------------------------
    ;; Global sequencing: chain moves in the same order as listed in <proposed_solution>.
    ;; This enforces a single global execution order for the primitive moves.
    ;; -----------------------------
    (next m1 m2)  (next m2 m3)  (next m3 m4)  (next m4 m5)  (next m5 m6)  (next m6 m7)  (next m7 m8)
    (next m8 m9)  (next m9 m10) (next m10 m11) (next m11 m12) (next m12 m13)

    (next m13 m14) (next m14 m15) (next m15 m16) (next m16 m17) (next m17 m18) (next m18 m19)
    (next m19 m20) (next m20 m21) (next m21 m22) (next m22 m23) (next m23 m24) (next m24 m25)
    (next m25 m26) (next m26 m27)

    (next m27 m28) (next m28 m29) (next m29 m30) (next m30 m31) (next m31 m32) (next m32 m33)
    (next m33 m34) (next m34 m35) (next m35 m36) (next m36 m37) (next m37 m38) (next m38 m39)

    ;; initial readiness: first move ready
    (ready m1)
  )

  (:goal (and
    ;; goal encodes the public goal configuration (do not repeat the explicit move sequence here).
    ;; Left peg must contain (top->bottom) B E F G H I J (we require these on facts and top for B)
    (on B left) (top B left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)

    ;; Middle peg must contain (top->bottom) C D
    (on C middle) (top C middle)
    (on D middle)

    ;; Right peg must contain (top->bottom) A
    (on A right) (top A right)
  ))
)