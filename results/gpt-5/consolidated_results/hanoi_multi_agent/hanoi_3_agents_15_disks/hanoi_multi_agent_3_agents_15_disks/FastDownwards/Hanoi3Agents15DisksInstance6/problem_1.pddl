(define (problem Hanoi3Agents15DisksInstance6)
  (:domain hanoi_3agents_15disks)
  (:objects
    agent_1 agent_2 agent_3 - agent
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
  )
  (:init
    ; initial stacking: A on B, B on C, ..., N on O, O on left
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

    ; clear supports at start
    (clear A)
    (clear middle)
    (clear right)

    ; static size ordering (smaller-than)
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

    ; control permissions
    (controlled-by A agent_1)
    (controlled-by B agent_1)
    (controlled-by C agent_1)
    (controlled-by D agent_1)
    (controlled-by E agent_1)
    (controlled-by F agent_2)
    (controlled-by G agent_2)
    (controlled-by H agent_2)
    (controlled-by I agent_2)
    (controlled-by J agent_2)
    (controlled-by K agent_3)
    (controlled-by L agent_3)
    (controlled-by M agent_3)
    (controlled-by N agent_3)
    (controlled-by O agent_3)
  )

  (:goal
    (and
      ; left stack top->bottom: E,F,...,O on left
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

      ; middle stack top->bottom: B,C,D on middle
      (on B C)
      (on C D)
      (on D middle)

      ; right: A
      (on A right)

      ; tops are clear
      (clear E)
      (clear B)
      (clear A)
    )
  )
)