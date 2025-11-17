(define (problem Hanoi2Agents15DisksInstance4)
  (:domain hanoi2agents15_strips)
  (:objects
    agent_1 agent_2 auditor orchestrator - agent
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 - time
  )
  (:init
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)

    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)

    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)

    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)

    (smaller E F) (smaller E G) (smaller E H)
    (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)

    (smaller F G) (smaller F H)
    (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)

    (smaller G H)
    (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)

    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)

    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)

    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)

    (smaller K L) (smaller K M) (smaller K N) (smaller K O)

    (smaller L M) (smaller L N) (smaller L O)

    (smaller M N) (smaller M O)

    (smaller N O)

    (held-by agent_1 A) (held-by agent_1 B) (held-by agent_1 C) (held-by agent_1 D)
    (held-by agent_1 E) (held-by agent_1 F) (held-by agent_1 G) (held-by agent_1 H)

    (held-by agent_2 I) (held-by agent_2 J) (held-by agent_2 K) (held-by agent_2 L)
    (held-by agent_2 M) (held-by agent_2 N) (held-by agent_2 O)

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
    (on O left)

    (clear A)
    (clear middle)
    (clear right)

    (at t0)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5) (succ t5 t6)
    (succ t6 t7) (succ t7 t8) (succ t8 t9) (succ t9 t10) (succ t10 t11) (succ t11 t12)
    (succ t12 t13) (succ t13 t14) (succ t14 t15) (succ t15 t16) (succ t16 t17)
  )
  (:goal (and
    (on A D)
    (on D right)
    (clear A)

    (on B middle)
    (clear B)

    (on C E)
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
    (on O left)
    (clear C)

    (at t17)
  ))
)