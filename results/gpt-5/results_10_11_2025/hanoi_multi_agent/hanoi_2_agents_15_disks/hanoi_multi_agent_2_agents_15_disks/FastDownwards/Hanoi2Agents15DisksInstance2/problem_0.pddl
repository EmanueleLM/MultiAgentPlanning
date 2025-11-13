(define (problem hanoi_15_disks_two_agents)
  (:domain hanoi-two-agent)
  (:objects
    agent_1 agent_2 - agent
    peg1 peg2 peg3 - peg
    A B C D E F G H I J K L M N O - disk
  )
  (:init
    ; disk size ordering: A (smallest) ... O (largest)
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

    ; initial stacking: all disks on peg1, largest at bottom
    (on O peg1)
    (on N O)
    (on M N)
    (on L M)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; initial clear facts
    (clear A)
    (clear peg2)
    (clear peg3)

    ; initial top-of-peg
    (top A peg1)

    ; agent capabilities (both agents permitted for all disks and pegs)
    (can-move-disk agent_1 A) (can-move-disk agent_1 B) (can-move-disk agent_1 C) (can-move-disk agent_1 D) (can-move-disk agent_1 E) (can-move-disk agent_1 F) (can-move-disk agent_1 G) (can-move-disk agent_1 H) (can-move-disk agent_1 I) (can-move-disk agent_1 J) (can-move-disk agent_1 K) (can-move-disk agent_1 L) (can-move-disk agent_1 M) (can-move-disk agent_1 N) (can-move-disk agent_1 O)
    (can-move-disk agent_2 A) (can-move-disk agent_2 B) (can-move-disk agent_2 C) (can-move-disk agent_2 D) (can-move-disk agent_2 E) (can-move-disk agent_2 F) (can-move-disk agent_2 G) (can-move-disk agent_2 H) (can-move-disk agent_2 I) (can-move-disk agent_2 J) (can-move-disk agent_2 K) (can-move-disk agent_2 L) (can-move-disk agent_2 M) (can-move-disk agent_2 N) (can-move-disk agent_2 O)

    (can-use-peg agent_1 peg1) (can-use-peg agent_1 peg2) (can-use-peg agent_1 peg3)
    (can-use-peg agent_2 peg1) (can-use-peg agent_2 peg2) (can-use-peg agent_2 peg3)
  )
  (:goal
    (and
      (on O peg3)
      (on N O)
      (on M N)
      (on L M)
      (on K L)
      (on J K)
      (on I J)
      (on H I)
      (on G H)
      (on F G)
      (on E F)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
      (clear peg1)
      (clear peg2)
      (top A peg3)
    )
  )
)