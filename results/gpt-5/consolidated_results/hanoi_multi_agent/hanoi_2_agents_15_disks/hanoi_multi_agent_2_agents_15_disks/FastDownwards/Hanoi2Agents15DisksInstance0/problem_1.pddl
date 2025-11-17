(define (problem Hanoi2Agents15DisksInstance0)
  (:domain hanoi-2agents-15)

  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ; Ownership
    (owned-a1 A) (owned-a1 B) (owned-a1 C) (owned-a1 D) (owned-a1 E) (owned-a1 F) (owned-a1 G) (owned-a1 H)
    (owned-a2 I) (owned-a2 J) (owned-a2 K) (owned-a2 L) (owned-a2 M) (owned-a2 N) (owned-a2 O)

    ; Strict size order
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

    ; can-stack: all pegs are legal supports for any disk
    (can-stack A left) (can-stack A middle) (can-stack A right)
    (can-stack B left) (can-stack B middle) (can-stack B right)
    (can-stack C left) (can-stack C middle) (can-stack C right)
    (can-stack D left) (can-stack D middle) (can-stack D right)
    (can-stack E left) (can-stack E middle) (can-stack E right)
    (can-stack F left) (can-stack F middle) (can-stack F right)
    (can-stack G left) (can-stack G middle) (can-stack G right)
    (can-stack H left) (can-stack H middle) (can-stack H right)
    (can-stack I left) (can-stack I middle) (can-stack I right)
    (can-stack J left) (can-stack J middle) (can-stack J right)
    (can-stack K left) (can-stack K middle) (can-stack K right)
    (can-stack L left) (can-stack L middle) (can-stack L right)
    (can-stack M left) (can-stack M middle) (can-stack M right)
    (can-stack N left) (can-stack N middle) (can-stack N right)
    (can-stack O left) (can-stack O middle) (can-stack O right)

    ; can-stack for disk-on-disk exactly mirrors "smaller"
    (can-stack A B) (can-stack A C) (can-stack A D) (can-stack A E) (can-stack A F) (can-stack A G) (can-stack A H) (can-stack A I) (can-stack A J) (can-stack A K) (can-stack A L) (can-stack A M) (can-stack A N) (can-stack A O)
    (can-stack B C) (can-stack B D) (can-stack B E) (can-stack B F) (can-stack B G) (can-stack B H) (can-stack B I) (can-stack B J) (can-stack B K) (can-stack B L) (can-stack B M) (can-stack B N) (can-stack B O)
    (can-stack C D) (can-stack C E) (can-stack C F) (can-stack C G) (can-stack C H) (can-stack C I) (can-stack C J) (can-stack C K) (can-stack C L) (can-stack C M) (can-stack C N) (can-stack C O)
    (can-stack D E) (can-stack D F) (can-stack D G) (can-stack D H) (can-stack D I) (can-stack D J) (can-stack D K) (can-stack D L) (can-stack D M) (can-stack D N) (can-stack D O)
    (can-stack E F) (can-stack E G) (can-stack E H) (can-stack E I) (can-stack E J) (can-stack E K) (can-stack E L) (can-stack E M) (can-stack E N) (can-stack E O)
    (can-stack F G) (can-stack F H) (can-stack F I) (can-stack F J) (can-stack F K) (can-stack F L) (can-stack F M) (can-stack F N) (can-stack F O)
    (can-stack G H) (can-stack G I) (can-stack G J) (can-stack G K) (can-stack G L) (can-stack G M) (can-stack G N) (can-stack G O)
    (can-stack H I) (can-stack H J) (can-stack H K) (can-stack H L) (can-stack H M) (can-stack H N) (can-stack H O)
    (can-stack I J) (can-stack I K) (can-stack I L) (can-stack I M) (can-stack I N) (can-stack I O)
    (can-stack J K) (can-stack J L) (can-stack J M) (can-stack J N) (can-stack J O)
    (can-stack K L) (can-stack K M) (can-stack K N) (can-stack K O)
    (can-stack L M) (can-stack L N) (can-stack L O)
    (can-stack M N) (can-stack M O)
    (can-stack N O)

    ; Initial configuration:
    ; Left peg has (top->bottom): A, B, C, D, E, F, G, H, I, J, K, L, M, N, O
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

    (clear A)
    (clear middle)
    (clear right)
  )

  (:goal
    (and
      ; Left peg (top->bottom): A, D, E, F, G, H, I, J, K, L, M, N, O
      (on A D)
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

      ; Middle peg (top->bottom): B, C
      (on B C)
      (on C middle)

      ; Right peg empty
      (clear right)

      ; Top disks are clear
      (clear A)
      (clear B)
    )
  )
)