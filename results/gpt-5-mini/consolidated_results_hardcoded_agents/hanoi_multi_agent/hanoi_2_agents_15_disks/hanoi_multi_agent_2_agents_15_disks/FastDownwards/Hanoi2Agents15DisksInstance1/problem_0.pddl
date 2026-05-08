(define (problem hanoi_15_agents)
  (:domain hanoi_agents)
  (:objects
    left middle right - peg
    A B C D E F G H - agent1disk
    I J K L M N O - agent2disk
    A B C D E F G H I J K L M N O - disk
  )

  (:init
    ;; Peg emptiness
    (not (empty left))
    (empty middle)
    (empty right)

    ;; Initial on facts: left peg top-to-bottom A B C D E F G H I J K L M N O
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)
    (on K left) (on L left) (on M left) (on N left) (on O left)

    ;; Immediate-above (top-to-next) relations for the left peg stack
    (above A B) (above B C) (above C D) (above D E) (above E F)
    (above F G) (above G H) (above H I) (above I J) (above J K)
    (above K L) (above L M) (above M N) (above N O)

    ;; Top disk markers (only A is top initially)
    (clear A)

    ;; Comparative size facts: A is smallest, O largest. We assert smaller relations for all pairs
    ;; A smaller than B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K)
    (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ;; B smaller than C..O
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L)
    (smaller B M) (smaller B N) (smaller B O)
    ;; C smaller than D..O
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O)
    ;; D smaller than E..O
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I)
    (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N)
    (smaller D O)
    ;; E smaller than F..O
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    ;; F smaller than G..O
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K)
    (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    ;; G smaller than H..O
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L)
    (smaller G M) (smaller G N) (smaller G O)
    ;; H smaller than I..O
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M)
    (smaller H N) (smaller H O)
    ;; I smaller than J..O
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N)
    (smaller I O)
    ;; J smaller than K..O
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    ;; K smaller than L..O
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    ;; L smaller than M..O
    (smaller L M) (smaller L N) (smaller L O)
    ;; M smaller than N,O
    (smaller M N) (smaller M O)
    ;; N smaller than O
    (smaller N O)
  )

  (:goal (and
    ;; Goal peg contents (top-to-bottom)
    ;; left peg top-to-bottom B E F G H I J K L M N O
    (on B left) (on E left) (on F left) (on G left) (on H left)
    (on I left) (on J left) (on K left) (on L left) (on M left)
    (on N left) (on O left)
    ;; adjacency order for left goal stack
    (above B E) (above E F) (above F G) (above G H) (above H I)
    (above I J) (above J K) (above K L) (above L M) (above M N)
    (above N O)

    ;; middle peg top-to-bottom D (single disk)
    (on D middle)

    ;; right peg top-to-bottom A C
    (on A right) (on C right)
    (above A C)
  ))
)