(define (problem Hanoi2Agents15DisksInstance3)
  (:domain Hanoi2Agents15Disks)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
    agent_1 agent_2 - agent
  )
  (:init
    ; agent permissions
    (allowed-agent-disk agent_1 A)
    (allowed-agent-disk agent_1 B)
    (allowed-agent-disk agent_1 C)
    (allowed-agent-disk agent_1 D)
    (allowed-agent-disk agent_1 E)
    (allowed-agent-disk agent_1 F)
    (allowed-agent-disk agent_1 G)
    (allowed-agent-disk agent_1 H)
    (allowed-agent-disk agent_2 I)
    (allowed-agent-disk agent_2 J)
    (allowed-agent-disk agent_2 K)
    (allowed-agent-disk agent_2 L)
    (allowed-agent-disk agent_2 M)
    (allowed-agent-disk agent_2 N)
    (allowed-agent-disk agent_2 O)

    ; size ordering
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

    ; initial stacking: all on left, A top ... O bottom
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

    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)
  )
  (:goal
    (and
      ; right peg: A on B on E on right
      (on-disk A B)
      (on-disk B E)
      (on-peg E right)
      (clear-disk A)

      ; middle peg: C on D on middle
      (on-disk C D)
      (on-peg D middle)
      (clear-disk C)

      ; left peg: F on G on ... on O on left
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
      (clear-disk F)
    )
  )
)