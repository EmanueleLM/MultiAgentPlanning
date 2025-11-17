(define (problem Hanoi2Agents15DisksInstance1)
  (:domain hanoi2agents)
  (:objects
    agent_1 agent_2 - agent
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )
  (:init
    ; size ordering (x smaller than y)
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

    ; permissions
    (can-move agent_1 A) (can-move agent_1 B) (can-move agent_1 C) (can-move agent_1 D) (can-move agent_1 E) (can-move agent_1 F) (can-move agent_1 G) (can-move agent_1 H)
    (can-move agent_2 I) (can-move agent_2 J) (can-move agent_2 K) (can-move agent_2 L) (can-move agent_2 M) (can-move agent_2 N) (can-move agent_2 O)

    ; initial stacking: left peg has A(top) ... O(bottom); middle and right empty
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
    (on-peg O left)

    (clear A)
    (top A)
    (clear middle)
    (clear right)
  )

  (:goal (and
    ; left peg goal stack: B (top), E, F, G, H, I, J, K, L, M, N, O (bottom)
    (on B E)
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
    (on-peg O left)

    ; middle peg goal stack: D only
    (on-peg D middle)

    ; right peg goal stack: A (top), C (bottom)
    (on A C)
    (on-peg C right)

    ; enforce top/clear for the three top disks
    (clear A)
    (top A)
    (clear B)
    (top B)
    (clear D)
    (top D)
  ))
)