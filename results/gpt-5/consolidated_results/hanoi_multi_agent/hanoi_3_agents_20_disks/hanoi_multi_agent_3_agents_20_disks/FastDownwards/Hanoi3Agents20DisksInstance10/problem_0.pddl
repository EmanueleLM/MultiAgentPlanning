(define (problem hanoi_20_disks_instance_10)
  (:domain hanoi_multiagent_20)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )
  (:init
    ; typing facts
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G) (disk H) (disk I) (disk J)
    (disk K) (disk L) (disk M) (disk N) (disk O) (disk P) (disk Q) (disk R) (disk S) (disk T)
    (peg left) (peg middle) (peg right)

    ; initial stack on left (top to bottom: A..T)
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
    (on O P)
    (on P Q)
    (on Q R)
    (on R S)
    (on S T)
    (on T left)

    ; top-of-peg markers
    (top left A)
    (top middle middle)  ; empty peg: top is the peg itself
    (top right right)    ; empty peg: top is the peg itself

    ; clear elements
    (clear A)
    (clear middle)
    (clear right)

    ; "smaller" relations among disks (A smallest ... T largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O) (smaller A P) (smaller A Q) (smaller A R) (smaller A S) (smaller A T)

    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O) (smaller B P) (smaller B Q) (smaller B R) (smaller B S) (smaller B T)

    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O) (smaller C P) (smaller C Q) (smaller C R) (smaller C S) (smaller C T)

    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O) (smaller D P) (smaller D Q) (smaller D R) (smaller D S) (smaller D T)

    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O) (smaller E P) (smaller E Q) (smaller E R) (smaller E S) (smaller E T)

    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O) (smaller F P) (smaller F Q) (smaller F R) (smaller F S) (smaller F T)

    (smaller G H) (smaller G I) (smaller G J)
    (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O) (smaller G P) (smaller G Q) (smaller G R) (smaller G S) (smaller G T)

    (smaller H I) (smaller H J)
    (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O) (smaller H P) (smaller H Q) (smaller H R) (smaller H S) (smaller H T)

    (smaller I J)
    (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O) (smaller I P) (smaller I Q) (smaller I R) (smaller I S) (smaller I T)

    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O) (smaller J P) (smaller J Q) (smaller J R) (smaller J S) (smaller J T)

    (smaller K L) (smaller K M) (smaller K N) (smaller K O) (smaller K P) (smaller K Q) (smaller K R) (smaller K S) (smaller K T)

    (smaller L M) (smaller L N) (smaller L O) (smaller L P) (smaller L Q) (smaller L R) (smaller L S) (smaller L T)

    (smaller M N) (smaller M O) (smaller M P) (smaller M Q) (smaller M R) (smaller M S) (smaller M T)

    (smaller N O) (smaller N P) (smaller N Q) (smaller N R) (smaller N S) (smaller N T)

    (smaller O P) (smaller O Q) (smaller O R) (smaller O S) (smaller O T)

    (smaller P Q) (smaller P R) (smaller P S) (smaller P T)

    (smaller Q R) (smaller Q S) (smaller Q T)

    (smaller R S) (smaller R T)

    (smaller S T)

    ; allow placing any disk onto an empty peg by treating pegs as "larger than" any disk
    (smaller A left) (smaller B left) (smaller C left) (smaller D left) (smaller E left) (smaller F left) (smaller G left) (smaller H left) (smaller I left) (smaller J left)
    (smaller K left) (smaller L left) (smaller M left) (smaller N left) (smaller O left) (smaller P left) (smaller Q left) (smaller R left) (smaller S left) (smaller T left)

    (smaller A middle) (smaller B middle) (smaller C middle) (smaller D middle) (smaller E middle) (smaller F middle) (smaller G middle) (smaller H middle) (smaller I middle) (smaller J middle)
    (smaller K middle) (smaller L middle) (smaller M middle) (smaller N middle) (smaller O middle) (smaller P middle) (smaller Q middle) (smaller R middle) (smaller S middle) (smaller T middle)

    (smaller A right) (smaller B right) (smaller C right) (smaller D right) (smaller E right) (smaller F right) (smaller G right) (smaller H right) (smaller I right) (smaller J right)
    (smaller K right) (smaller L right) (smaller M right) (smaller N right) (smaller O right) (smaller P right) (smaller Q right) (smaller R right) (smaller S right) (smaller T right)
  )

  (:goal
    (and
      ; final left stack: B (top), D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T (bottom)
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
      (on O P)
      (on P Q)
      (on Q R)
      (on R S)
      (on S T)
      (on T left)

      ; final middle stack: A (top), C (bottom on peg)
      (on A C)
      (on C middle)

      ; right peg empty
      (top right right)
      (clear right)

      ; top markers for left and middle
      (top left B)
      (top middle A)

      ; top disks are clear
      (clear A)
      (clear B)
    )
  )
)