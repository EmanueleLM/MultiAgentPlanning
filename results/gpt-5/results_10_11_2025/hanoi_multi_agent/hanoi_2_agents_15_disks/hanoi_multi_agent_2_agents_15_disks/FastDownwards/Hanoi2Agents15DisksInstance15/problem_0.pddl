(define (problem hanoi-multiagent-audited-instance)
  (:domain hanoi-multiagent-audited)
  (:objects
    left middle right - peg
    A B C D E F G H - lightdisk
    I J K L M N O - heavydisk
  )
  (:init
    ; peg identifiers
    (peg left)
    (peg middle)
    (peg right)

    ; initial stack on left: A (top) ... O (bottom)
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

    ; initial clears
    (clear A)
    (clear middle)
    (clear right)

    ; every disk initially on peg left
    (at A left)
    (at B left)
    (at C left)
    (at D left)
    (at E left)
    (at F left)
    (at G left)
    (at H left)
    (at I left)
    (at J left)
    (at K left)
    (at L left)
    (at M left)
    (at N left)
    (at O left)

    ; size ordering (smaller X Y) for all X<Y in A<B<...<O
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

    ; audited sequence initial flag
    (s0)

    ; audited move targets (bind exact objects for each ordered move)
    ; 1) agent_1: move disk A from left to middle
    (step1-target A left middle)
    ; 2) agent_1: move disk B from left to right
    (step2-target B left right)
    ; 3) agent_1: move disk A from middle to right (onto B)
    (step3-target A middle right B)
    ; 4) agent_1: move disk C from left to middle
    (step4-target C left middle)
    ; 5) agent_1: move disk A from right to left (onto D)
    (step5-target A right left D)
    ; 6) agent_1: move disk B from right to middle (onto C)
    (step6-target B right middle C)
    ; 7) agent_1: move disk A from left to middle (onto B)
    (step7-target A left middle B)
    ; 8) agent_1: move disk D from left to right
    (step8-target D left right)
    ; 9) agent_1: move disk A from middle to left (onto E)
    (step9-target A middle left E)
  )
  (:goal
    (and
      ; audited sequence completed
      (s9)
      ; exact final configuration:
      ; left peg: A on E on F on G on H on I on J on K on L on M on N on O on left
      (on A E)
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
      ; middle peg: B on C on middle
      (on B C)
      (on C middle)
      ; right peg: D on right
      (on D right)
    )
  )
)