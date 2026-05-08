(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)
  (:objects
    a1 a2 a3 - agent
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
  )

  (:init
    ;; initial direct support chain (top-to-bottom A..O): A on B, B on C, ..., N on O, O on left
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

    ;; top-of-peg and emptiness initially
    (top left A)
    (empty middle)
    (empty right)

    ;; clear: top disk A has nothing on top
    (clear A)

    ;; agent move permissions (as provided): agent1 can move A, B, C; agents 2 and 3 have no move permissions
    (can-move a1 A)
    (can-move a1 B)
    (can-move a1 C)

    ;; size ordering: smaller facts for all pairs (i < j)
    ;; A smaller than B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ;; B smaller than C..O
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)
    ;; C smaller than D..O
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    ;; D smaller than E..O
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)
    ;; E smaller than F..O
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    ;; F smaller than G..O
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    ;; G smaller than H..O
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)
    ;; H smaller than I..O
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)
    ;; I smaller than J..O
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    ;; J smaller than K..O
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    ;; K smaller than L..O
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    ;; L smaller than M..O
    (smaller L M) (smaller L N) (smaller L O)
    ;; M smaller than N..O
    (smaller M N) (smaller M O)
    ;; N smaller than O
    (smaller N O)
  )

  (:goal
    (and
      ;; Goal configuration as specified:
      ;; Left peg top-to-bottom: B D E F G H I J K L M N O  (i.e., B on D, D on E, ..., N on O, O on left) and top(left)=B
      (top left B)
      (on-disk B D)
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

      ;; Middle peg top-to-bottom: C (single disk on middle)
      (top middle C)
      (on-peg C middle)

      ;; Right peg top-to-bottom: A (single disk on right)
      (top right A)
      (on-peg A right)
    )
  )
)