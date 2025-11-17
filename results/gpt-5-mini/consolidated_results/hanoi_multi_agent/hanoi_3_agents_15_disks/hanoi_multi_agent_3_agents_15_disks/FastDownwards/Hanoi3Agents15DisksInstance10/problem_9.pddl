(define (problem Hanoi3Agents15DisksInstance10)
  (:domain multiagent-hanoi-3agents)

  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    (on A B) (on B C) (on C D) (on D E) (on E F)
    (on F G) (on G H) (on H I) (on I J) (on J K)
    (on K L) (on L M) (on M N) (on N O) (on O left)

    (clear A)
    (clear middle)
    (clear right)

    (canmove agent_1 A) (canmove agent_1 B) (canmove agent_1 C) (canmove agent_1 D) (canmove agent_1 E)
    (canmove agent_2 F) (canmove agent_2 G) (canmove agent_2 H) (canmove agent_2 I) (canmove agent_2 J)
    (canmove agent_3 K) (canmove agent_3 L) (canmove agent_3 M) (canmove agent_3 N) (canmove agent_3 O)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    (smaller L M) (smaller L N) (smaller L O)
    (smaller M N) (smaller M O)
    (smaller N O)
  )

  (:goal (and
    (on B E) (on E F) (on F G) (on G H) (on H I) (on I J) (on J K)
    (on K L) (on L M) (on M N) (on N O) (on O left)
    (clear B)

    (on A D) (on D middle)
    (clear A)

    (on C right)
    (clear C)
  ))
)