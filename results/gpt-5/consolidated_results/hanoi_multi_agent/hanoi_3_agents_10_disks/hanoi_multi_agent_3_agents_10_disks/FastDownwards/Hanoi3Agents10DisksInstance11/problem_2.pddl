(define (problem Hanoi3Agents10DisksInstance11_staged)
  (:domain hanoi3agents_staged)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
    S0 S1 S2 S3 S4 S5 S6 S7 S8 S9 S10 S11 S12 S13 S14 S15 S16 S17 S18 S19 S20 S21 S22 S23 - stage
  )

  (:init
    ; Initial stack: left has A (top) ... J (bottom); middle, right empty.
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on-peg J left)

    (clear A)
    (clear-peg middle)
    (clear-peg right)

    ; Agent movement permissions
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

    ; Size ordering A (smallest) ... J (largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; Stages: exactly 23 moves from S0 to S23
    (cur S0)
    (next S0 S1)
    (next S1 S2)
    (next S2 S3)
    (next S3 S4)
    (next S4 S5)
    (next S5 S6)
    (next S6 S7)
    (next S7 S8)
    (next S8 S9)
    (next S9 S10)
    (next S10 S11)
    (next S11 S12)
    (next S12 S13)
    (next S13 S14)
    (next S14 S15)
    (next S15 S16)
    (next S16 S17)
    (next S17 S18)
    (next S18 S19)
    (next S19 S20)
    (next S20 S21)
    (next S21 S22)
    (next S22 S23)
  )

  (:goal (and
    ; Left peg: A (top), B, F, G, H, I, J (bottom)
    (on A B)
    (on B F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on-peg J left)

    ; Middle peg: C (top) on E (bottom)
    (on C E)
    (on-peg E middle)

    ; Right peg: D alone
    (on-peg D right)

    ; Ensure the three top disks are exposed
    (clear A)
    (clear C)
    (clear D)

    ; Terminal stage reached after exactly 23 moves
    (cur S23)
  ))
)