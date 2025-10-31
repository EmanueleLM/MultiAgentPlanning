(define (problem Hanoi3Agents15DisksInstance0-problem)
  (:domain hanoi-3agents-15)

  (:objects
    agent_1 agent_2 agent_3 orchestrator - agent
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
  )

  (:init
    ;; initial stacking (top down: A,B,C,D,E,F,G,H,I,J,K,L,M,N,O on left)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-disk J K)
    (on-disk K L)
    (on-disk L M)
    (on-disk M N)
    (on-disk N O)
    (on-peg O left)

    ;; clear markers: top disk A is clear; left peg not clear (has O); middle and right are clear
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; agent permissions (as specified)
    (allowed agent_1 A) (allowed agent_1 B) (allowed agent_1 C) (allowed agent_1 D) (allowed agent_1 E)
    (allowed agent_2 F) (allowed agent_2 G) (allowed agent_2 H) (allowed agent_2 I) (allowed agent_2 J)
    (allowed agent_3 K) (allowed agent_3 L) (allowed agent_3 M) (allowed agent_3 N) (allowed agent_3 O)

    ;; size ordering: smaller X Y means X is strictly smaller than Y
    ;; A is smaller than all others
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ;; B smaller than those after it
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

  (:goal
    (and
      ;; left peg stack (top->bottom): C, E, F, G, H, I, J, K, L, M, N, O
      (on-disk C E)
      (on-disk E F)
      (on-disk F G)
      (on-disk G H)
      (on-disk H I)
      (on-disk I J)
      (on-disk J K)
      (on-disk K L)
      (on-disk L M)
      (on-disk M N)
      (on-disk N O)
      (on-peg O left)

      ;; middle peg contains B (and B is top/clear)
      (on-peg B middle)
      (clear-disk B)

      ;; right peg contains (top->bottom) A, D
      (on-disk A D)
      (on-peg D right)
      (clear-disk A)
    )
  )
)