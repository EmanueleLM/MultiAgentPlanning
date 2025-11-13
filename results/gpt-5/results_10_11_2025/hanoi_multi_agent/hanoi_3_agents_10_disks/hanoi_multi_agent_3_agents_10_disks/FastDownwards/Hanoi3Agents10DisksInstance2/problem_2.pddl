(define (problem Hanoi3Agents10DisksInstance2_staged)
  (:domain hanoi3agents_staged)
  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
    agent_1 agent_2 agent_3 - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 - stage
  )
  (:init
    ; agent capabilities
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

    ; strict total order (transitive closure)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; initial stacking: left has A(top) ... J(bottom)
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

    ; initial clears
    (clear A)
    (clear middle)
    (clear right)

    ; stage chain for exactly 19 moves
    (at s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
    (next s10 s11)
    (next s11 s12)
    (next s12 s13)
    (next s13 s14)
    (next s14 s15)
    (next s15 s16)
    (next s16 s17)
    (next s17 s18)
    (next s18 s19)
  )
  (:goal
    (and
      ; left peg: F (top) on G on H on I on J on left
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J left)
      (clear F)

      ; middle peg: A (top) on C on D on middle
      (on A C)
      (on C D)
      (on D middle)
      (clear A)

      ; right peg: B (top) on E on right
      (on B E)
      (on E right)
      (clear B)

      ; exactly 19 ordered moves performed
      (at s19)
    )
  )
)