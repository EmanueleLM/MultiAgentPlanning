(define (problem Hanoi3Agents15DisksInstance7-prob)
  (:domain hanoi-3peg-15disk-3agents-ordered)

  ; Ordered plan (for reference only):
  ; 1) agent_1: move disk A from left to right
  ; 2) agent_1: move disk B from left to middle
  ; 3) agent_1: move disk A from right to left

  (:objects
    agent_1 agent_2 agent_3 auditor orchestrator - agent
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
  )

  (:init
    ; total size ordering A < B < ... < O (transitive closure)
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

    ; agent move authority
    (may-move agent_1 A) (may-move agent_1 B) (may-move agent_1 C) (may-move agent_1 D) (may-move agent_1 E)
    (may-move agent_2 F) (may-move agent_2 G) (may-move agent_2 H) (may-move agent_2 I) (may-move agent_2 J)
    (may-move agent_3 K) (may-move agent_3 L) (may-move agent_3 M) (may-move agent_3 N) (may-move agent_3 O)

    ; initial Tower of Hanoi stack: left peg has A (top) ... O (bottom)
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

    ; enforce the intended 3-step cooperative sequence
    (phase1)
    (want-step1-to-peg A right)
    (want-step2-to-peg B middle)
    (want-step3-to-disk A C)
  )

  (:goal
    (and
      ; final configuration:
      ; left: A on C on D ... on O on left
      ; middle: B
      ; right: empty
      (on A C)
      (on B middle)
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
      (clear B)
      (clear right)

      ; ensure the ordered sequence completed
      (finished)
    )
  )
)