(define (problem hanoi-2agent-20-instance2)
  (:domain hanoi-2agent-20-scheduled)
  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    A B C D E F G H I J K L M N O P Q R S T - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 - step
  )
  (:init
    ; initial stacks: left has A (top) ... T (bottom)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (on O P)
    (on P Q)
    (on Q R)
    (on R S)
    (on S T)
    (on-peg T left)
    (clear A)
    (clear middle)
    (clear right)

    ; agent move permissions
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_1 E)
    (can-move agent_1 F)
    (can-move agent_1 G)
    (can-move agent_1 H)
    (can-move agent_1 I)
    (can-move agent_1 J)
    (can-move agent_2 K)
    (can-move agent_2 L)
    (can-move agent_2 M)
    (can-move agent_2 N)
    (can-move agent_2 O)
    (can-move agent_2 P)
    (can-move agent_2 Q)
    (can-move agent_2 R)
    (can-move agent_2 S)
    (can-move agent_2 T)

    ; size ordering (strict, transitive)
    (smaller-than A B) (smaller-than A C) (smaller-than A D) (smaller-than A E) (smaller-than A F)
    (smaller-than A G) (smaller-than A H) (smaller-than A I) (smaller-than A J) (smaller-than A K)
    (smaller-than A L) (smaller-than A M) (smaller-than A N) (smaller-than A O) (smaller-than A P)
    (smaller-than A Q) (smaller-than A R) (smaller-than A S) (smaller-than A T)

    (smaller-than B C) (smaller-than B D) (smaller-than B E) (smaller-than B F) (smaller-than B G)
    (smaller-than B H) (smaller-than B I) (smaller-than B J) (smaller-than B K) (smaller-than B L)
    (smaller-than B M) (smaller-than B N) (smaller-than B O) (smaller-than B P) (smaller-than B Q)
    (smaller-than B R) (smaller-than B S) (smaller-than B T)

    (smaller-than C D) (smaller-than C E) (smaller-than C F) (smaller-than C G) (smaller-than C H)
    (smaller-than C I) (smaller-than C J) (smaller-than C K) (smaller-than C L) (smaller-than C M)
    (smaller-than C N) (smaller-than C O) (smaller-than C P) (smaller-than C Q) (smaller-than C R)
    (smaller-than C S) (smaller-than C T)

    (smaller-than D E) (smaller-than D F) (smaller-than D G) (smaller-than D H) (smaller-than D I)
    (smaller-than D J) (smaller-than D K) (smaller-than D L) (smaller-than D M) (smaller-than D N)
    (smaller-than D O) (smaller-than D P) (smaller-than D Q) (smaller-than D R) (smaller-than D S)
    (smaller-than D T)

    (smaller-than E F) (smaller-than E G) (smaller-than E H) (smaller-than E I) (smaller-than E J)
    (smaller-than E K) (smaller-than E L) (smaller-than E M) (smaller-than E N) (smaller-than E O)
    (smaller-than E P) (smaller-than E Q) (smaller-than E R) (smaller-than E S) (smaller-than E T)

    (smaller-than F G) (smaller-than F H) (smaller-than F I) (smaller-than F J) (smaller-than F K)
    (smaller-than F L) (smaller-than F M) (smaller-than F N) (smaller-than F O) (smaller-than F P)
    (smaller-than F Q) (smaller-than F R) (smaller-than F S) (smaller-than F T)

    (smaller-than G H) (smaller-than G I) (smaller-than G J) (smaller-than G K) (smaller-than G L)
    (smaller-than G M) (smaller-than G N) (smaller-than G O) (smaller-than G P) (smaller-than G Q)
    (smaller-than G R) (smaller-than G S) (smaller-than G T)

    (smaller-than H I) (smaller-than H J) (smaller-than H K) (smaller-than H L) (smaller-than H M)
    (smaller-than H N) (smaller-than H O) (smaller-than H P) (smaller-than H Q) (smaller-than H R)
    (smaller-than H S) (smaller-than H T)

    (smaller-than I J) (smaller-than I K) (smaller-than I L) (smaller-than I M) (smaller-than I N)
    (smaller-than I O) (smaller-than I P) (smaller-than I Q) (smaller-than I R) (smaller-than I S)
    (smaller-than I T)

    (smaller-than J K) (smaller-than J L) (smaller-than J M) (smaller-than J N) (smaller-than J O)
    (smaller-than J P) (smaller-than J Q) (smaller-than J R) (smaller-than J S) (smaller-than J T)

    (smaller-than K L) (smaller-than K M) (smaller-than K N) (smaller-than K O) (smaller-than K P)
    (smaller-than K Q) (smaller-than K R) (smaller-than K S) (smaller-than K T)

    (smaller-than L M) (smaller-than L N) (smaller-than L O) (smaller-than L P) (smaller-than L Q)
    (smaller-than L R) (smaller-than L S) (smaller-than L T)

    (smaller-than M N) (smaller-than M O) (smaller-than M P) (smaller-than M Q) (smaller-than M R)
    (smaller-than M S) (smaller-than M T)

    (smaller-than N O) (smaller-than N P) (smaller-than N Q) (smaller-than N R) (smaller-than N S)
    (smaller-than N T)

    (smaller-than O P) (smaller-than O Q) (smaller-than O R) (smaller-than O S) (smaller-than O T)

    (smaller-than P Q) (smaller-than P R) (smaller-than P S) (smaller-than P T)

    (smaller-than Q R) (smaller-than Q S) (smaller-than Q T)

    (smaller-than R S) (smaller-than R T)

    (smaller-than S T)

    ; step sequencing for the audited 9 moves
    (at-step s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)

    ; enforce which agent and which disk is moved at each step (order cannot be reordered)
    (scheduled-agent s0 agent_1)   (scheduled-disk s0 A)
    (scheduled-agent s1 agent_1)   (scheduled-disk s1 B)
    (scheduled-agent s2 agent_1)   (scheduled-disk s2 A)
    (scheduled-agent s3 agent_1)   (scheduled-disk s3 C)
    (scheduled-agent s4 agent_1)   (scheduled-disk s4 A)
    (scheduled-agent s5 agent_1)   (scheduled-disk s5 B)
    (scheduled-agent s6 agent_1)   (scheduled-disk s6 A)
    (scheduled-agent s7 agent_1)   (scheduled-disk s7 D)
    (scheduled-agent s8 agent_1)   (scheduled-disk s8 A)
  )

  (:goal
    (and
      ; all 9 audited moves have been executed in order
      (at-step s9)

      ; final configuration:
      ; left peg has (top->bottom) E..T
      (clear E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J K)
      (on K L)
      (on L M)
      (on M N)
      (on N O)
      (on O P)
      (on P Q)
      (on Q R)
      (on R S)
      (on S T)
      (on-peg T left)

      ; middle peg has (top->bottom) B, C
      (clear B)
      (on B C)
      (on-peg C middle)

      ; right peg has (top->bottom) A, D
      (clear A)
      (on A D)
      (on-peg D right)
    )
  )
)