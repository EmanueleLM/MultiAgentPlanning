(define (problem hanoi15_instance)
  (:domain hanoi_multiagent_15)
  (:objects
    pegL pegM pegR - peg

    A B C D E F G H - disk_small
    I J K L M N O   - disk_large
  )

  (:init
    ; initial immediate-support (top-to-bottom): A on B, B on C, ..., N on O, O on pegL
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
    (on O pegL)

    ; clear facts: top disk A is clear, other disks initially have something on them
    (clear A)
    ; empty pegs pegM and pegR
    (clear pegM)
    (clear pegR)

    ; size ordering: smaller X Y for every pair where X is smaller than Y
    ; A is smaller than B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ; B smaller than C..O
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)
    ; C smaller than D..O
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    ; D smaller than E..O
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)
    ; E smaller than F..O
    (smaller E F) (smaller E G) (smaller E H)
    (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    ; F smaller than G..O
    (smaller F G) (smaller F H)
    (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    ; G smaller than H..O
    (smaller G H)
    (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)
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
    ; M smaller than N,O
    (smaller M N) (smaller M O)
    ; N smaller than O
    (smaller N O)
  )

  (:goal (and
    ; Goal stacks:
    ; Left peg (top to bottom): B D E F G H I J K L M N O
    ; Right peg (top to bottom): A C
    ; Middle peg: empty

    ; Left stack: B on D, D on E, ..., N on O, O on pegL
    (on B D)
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
    (on O pegL)

    ; Right stack: A on C, C on pegR
    (on A C)
    (on C pegR)

    ; Middle peg empty
    (clear pegM)

    ; top disks must be clear (these are the tops of the goal stacks)
    (clear B)
    (clear A)
  ))
)