(define (problem Hanoi2Agents15DisksInstance15)
  (:domain hanoi2agents-ordered)
  (:objects
    left middle right - peg
    A B C D E F G H - lightdisk
    I J K L M N O - heavydisk
  )
  (:init
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

    ; start at first audited step
    (s0)

    ; audited move targets (bind exact objects for each ordered move)
    ; 1) agent_1: move disk A to middle
    (step1-target A middle)
    ; 2) agent_1: move disk B to right
    (step2-target B right)
    ; 3) agent_1: move disk A onto B
    (step3-target A B)
    ; 4) agent_1: move disk C to middle
    (step4-target C middle)
    ; 5) agent_1: move disk A onto D
    (step5-target A D)
    ; 6) agent_1: move disk B onto C
    (step6-target B C)
    ; 7) agent_1: move disk A onto B
    (step7-target A B)
    ; 8) agent_1: move disk D to right
    (step8-target D right)
    ; 9) agent_1: move disk A onto E
    (step9-target A E)
  )

  (:goal
    (and
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