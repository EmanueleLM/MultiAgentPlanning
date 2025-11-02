(define (problem Hanoi3Agents15DisksInstance1-problem)
  (:domain Hanoi3Agents15DisksInstance1)
  (:objects
    agent_1 agent_2 agent_3 orchestrator - agent
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
  )

  ; initial configuration: left peg has A (top) down through O (bottom)
  (:init
    ; on-disk chain for the initial left stack (A is on B, B on C, ..., N on O), bottom O on left peg
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

    ; peg emptiness
    (empty middle)
    (empty right)

    ; clear: only A (topmost) is clear initially
    (clear A)
    ; all other disks have a disk on top initially, so they are not clear; those facts are omitted

    ; agent move permissions (per the specification)
    (can-move agent_1 A) (can-move agent_1 B) (can-move agent_1 C) (can-move agent_1 D) (can-move agent_1 E)
    (can-move agent_2 F) (can-move agent_2 G) (can-move agent_2 H) (can-move agent_2 I) (can-move agent_2 J)
    (can-move agent_3 K) (can-move agent_3 L) (can-move agent_3 M) (can-move agent_3 N) (can-move agent_3 O)

    ; size ordering: smaller X Y when X is smaller than Y (A < B < ... < O)
    ; A smaller than B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ; B smaller than C..O
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)
    ; C smaller than D..O
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    ; D smaller than E..O
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)
    ; E smaller than F..O
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    ; F smaller than G..O
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    ; G smaller than H..O
    (smaller G H) (smaller G I) (smaller G J)
    (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)
    ; H smaller than I..O
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)
    ; I smaller than J..O
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    ; J smaller than K..O
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    ; K smaller than L..O
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    ; L smaller than M..O
    (smaller L M) (smaller L N) (smaller L O)
    ; M smaller than N..O
    (smaller M N) (smaller M O)
    ; N smaller than O
    (smaller N O)
  )

  ; Goal: left peg top→bottom: C, F, G, H, I, J, K, L, M, N, O
  ;       middle peg top→bottom: A, E
  ;       right peg top→bottom: B, D
  (:goal
    (and
      ; left stack: C on F, F on G, ..., N on O, O on left peg
      (on-disk C F) (on-disk F G) (on-disk G H) (on-disk H I) (on-disk I J)
      (on-disk J K) (on-disk K L) (on-disk L M) (on-disk M N) (on-disk N O) (on-peg O left)

      ; middle stack: A on E, E on middle peg
      (on-disk A E) (on-peg E middle)

      ; right stack: B on D, D on right peg
      (on-disk B D) (on-peg D right)
    )
  )

  ; Comments / notes:
  ; - The integrated plan below moves only disks A..E and is executed entirely by agent_1,
  ;   which is consistent with agent permissions. Agents 2 and 3 perform no moves in this plan.
  ; - No larger disks (F..O) needed to be moved to achieve the requested final arrangement of the top five disks.
  ; - The explicit move sequence (validated against Tower of Hanoi rules and agent permissions) is provided here for reference:
  ;   agent_1: move disk A from left to middle
  ;   agent_1: move disk B from left to right
  ;   agent_1: move disk A from middle to right
  ;   agent_1: move disk C from left to middle
  ;   agent_1: move disk A from right to left
  ;   agent_1: move disk B from right to middle
  ;   agent_1: move disk A from left to middle
  ;   agent_1: move disk D from left to right
  ;   agent_1: move disk A from middle to right
  ;   agent_1: move disk B from middle to left
  ;   agent_1: move disk A from right to left
  ;   agent_1: move disk C from middle to right
  ;   agent_1: move disk A from left to middle
  ;   agent_1: move disk B from left to right
  ;   agent_1: move disk A from middle to right
  ;   agent_1: move disk E from left to middle
  ;   agent_1: move disk A from right to left
  ;   agent_1: move disk B from right to middle
  ;   agent_1: move disk A from left to middle
  ;   agent_1: move disk C from right to left
  ;   agent_1: move disk A from middle to left
  ;   agent_1: move disk B from middle to right
  ;   agent_1: move disk A from left to middle
)