(define (problem Hanoi2Agents15DisksInstance24)
  (:domain hanoi_two_agents_15)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
    agent_1 agent_2 orchestrator - agent
  )
  (:init
    ;; Initial on facts: all disks on left peg, top to bottom A..O
    (on A left) (on B left) (on C left) (on D left) (on E left) (on F left) (on G left)
    (on H left) (on I left) (on J left) (on K left) (on L left) (on M left) (on N left) (on O left)

    ;; Top and empty pegs
    (top left A)
    (empty middle)
    (empty right)

    ;; direct_below relations representing immediate stacking on left: B directly below A, C below B, ..., O below N
    (direct_below B A) (direct_below C B) (direct_below D C) (direct_below E D) (direct_below F E)
    (direct_below G F) (direct_below H G) (direct_below I H) (direct_below J I) (direct_below K J)
    (direct_below L K) (direct_below M L) (direct_below N M) (direct_below O N)

    ;; Can-move permissions for agents
    (can_move_agent1 A) (can_move_agent1 B) (can_move_agent1 C) (can_move_agent1 D)
    (can_move_agent1 E) (can_move_agent1 F) (can_move_agent1 G) (can_move_agent1 H)

    (can_move_agent2 I) (can_move_agent2 J) (can_move_agent2 K) (can_move_agent2 L)
    (can_move_agent2 M) (can_move_agent2 N) (can_move_agent2 O)

    ;; Smaller relations: A < B < C ... < O (all pairwise smaller facts where first is smaller than second)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)

    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I)
    (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)

    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)

    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K)
    (smaller D L) (smaller D M) (smaller D N) (smaller D O)

    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L)
    (smaller E M) (smaller E N) (smaller E O)

    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M)
    (smaller F N) (smaller F O)

    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N)
    (smaller G O)

    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)

    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)

    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)

    (smaller K L) (smaller K M) (smaller K N) (smaller K O)

    (smaller L M) (smaller L N) (smaller L O)

    (smaller M N) (smaller M O)

    (smaller N O)
  )

  (:goal (and
    ;; Goal configuration: disk A on right peg, all other disks still on left (B..O), middle empty.
    (on A right)
    (on B left) (on C left) (on D left) (on E left) (on F left) (on G left)
    (on H left) (on I left) (on J left) (on K left) (on L left) (on M left) (on N left) (on O left)
    (empty middle)
  ))