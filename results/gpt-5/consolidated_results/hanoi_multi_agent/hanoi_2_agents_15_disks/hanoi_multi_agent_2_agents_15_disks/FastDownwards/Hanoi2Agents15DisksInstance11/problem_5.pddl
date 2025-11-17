(define (problem Hanoi2Agents15DisksInstance11-staged-lockedseq-v3)
  (:domain hanoi-2agents-classical-staged-lockedseq-v3)

  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 - stage
  )

  (:init
    ; Capability constraints
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_1 E)
    (can-move agent_1 F)
    (can-move agent_1 G)
    (can-move agent_1 H)
    (can-move agent_2 I)
    (can-move agent_2 J)
    (can-move agent_2 K)
    (can-move agent_2 L)
    (can-move agent_2 M)
    (can-move agent_2 N)
    (can-move agent_2 O)

    ; Strict smaller-than ordering (A smallest ... O largest)
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

    ; Initial configuration: full stack on left (top→bottom): A,B,C,D,E,F,G,H,I,J,K,L,M,N,O
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

    ; Top-of-stacks and empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ; Discrete stage chain allowing exactly 21 moves (t0 -> t1 -> ... -> t21)
    (current t0)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)
    (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20) (next t20 t21)

    ; Per-stage allowed moves (locking the exact cooperative sequence)
    ; 1. agent_1: move disk A from B to right
    (allowed-peg t0 agent_1 A B right)
    ; 2. agent_1: move disk B from C to middle
    (allowed-peg t1 agent_1 B C middle)
    ; 3. agent_1: move disk A from right to B
    (allowed-disk t2 agent_1 A right B)
    ; 4. agent_1: move disk C from D to right
    (allowed-peg t3 agent_1 C D right)
    ; 5. agent_1: move disk A from B to D
    (allowed-disk t4 agent_1 A B D)
    ; 6. agent_1: move disk B from middle to C
    (allowed-disk t5 agent_1 B middle C)
    ; 7. agent_1: move disk A from D to B
    (allowed-disk t6 agent_1 A D B)
    ; 8. agent_1: move disk D from E to middle
    (allowed-peg t7 agent_1 D E middle)
    ; 9. agent_1: move disk A from B to D
    (allowed-disk t8 agent_1 A B D)
    ; 10. agent_1: move disk B from C to E
    (allowed-disk t9 agent_1 B C E)
    ; 11. agent_1: move disk A from D to B
    (allowed-disk t10 agent_1 A D B)
    ; 12. agent_1: move disk C from right to D
    (allowed-disk t11 agent_1 C right D)
    ; 13. agent_1: move disk A from B to right
    (allowed-peg t12 agent_1 A B right)
    ; 14. agent_1: move disk B from E to C
    (allowed-disk t13 agent_1 B E C)
    ; 15. agent_1: move disk A from right to B
    (allowed-disk t14 agent_1 A right B)
    ; 16. agent_1: move disk E from F to right
    (allowed-peg t15 agent_1 E F right)
    ; 17. agent_1: move disk A from B to E
    (allowed-disk t16 agent_1 A B E)
    ; 18. agent_1: move disk B from C to F
    (allowed-disk t17 agent_1 B C F)
    ; 19. agent_1: move disk A from E to B
    (allowed-disk t18 agent_1 A E B)
    ; 20. agent_1: move disk C from D to E
    (allowed-disk t19 agent_1 C D E)
    ; 21. agent_1: move disk A from B to D
    (allowed-disk t20 agent_1 A B D)
  )

  ; Exact goal configuration as specified
  (:goal (and
    ; left stack (top→bottom): B,F,G,H,I,J,K,L,M,N,O
    (on B F)
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

    ; middle stack (top→bottom): A,D
    (on A D)
    (on D middle)

    ; right stack (top→bottom): C,E
    (on C E)
    (on E right)

    ; tops are clear to ensure exactness
    (clear A)
    (clear B)
    (clear C)
  ))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Validated cooperative move sequence (documentary; solver must follow via allowed-*):
  ; 1.  agent_1: move disk A from left to right
  ; 2.  agent_1: move disk B from left to middle
  ; 3.  agent_1: move disk A from right to middle
  ; 4.  agent_1: move disk C from left to right
  ; 5.  agent_1: move disk A from middle to left
  ; 6.  agent_1: move disk B from middle to right
  ; 7.  agent_1: move disk A from left to right
  ; 8.  agent_1: move disk D from left to middle
  ; 9.  agent_1: move disk A from right to middle
  ; 10. agent_1: move disk B from right to left
  ; 11. agent_1: move disk A from middle to left
  ; 12. agent_1: move disk C from right to middle
  ; 13. agent_1: move disk A from left to right
  ; 14. agent_1: move disk B from left to middle
  ; 15. agent_1: move disk A from right to middle
  ; 16. agent_1: move disk E from left to right
  ; 17. agent_1: move disk A from middle to right
  ; 18. agent_1: move disk B from middle to left
  ; 19. agent_1: move disk A from right to left
  ; 20. agent_1: move disk C from middle to right
  ; 21. agent_1: move disk A from left to middle
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)