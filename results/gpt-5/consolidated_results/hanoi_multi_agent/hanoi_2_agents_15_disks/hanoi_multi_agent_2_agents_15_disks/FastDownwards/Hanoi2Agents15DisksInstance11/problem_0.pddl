(define (problem hanoi-15-split-goal)
  (:domain hanoi-multiagent-classical)

  ; Public environment:
  ; - Three pegs: left, middle, right
  ; - 15 disks A (smallest) ... O (largest)
  ; - Agent movement restrictions:
  ;     agent_1 can move A..H
  ;     agent_2 can move I..O
  ; - Initial stack (top→bottom) on left: A,B,C,D,E,F,G,H,I,J,K,L,M,N,O
  ; - Goal configuration (top→bottom):
  ;     left:  B, F, G, H, I, J, K, L, M, N, O
  ;     middle: A, D
  ;     right:  C, E
  ;
  ; Validated example prefix plan (documented only; not enforced):
  ;  1) agent_1: move disk A from left to right
  ;  2) agent_1: move disk B from left to middle
  ;  3) agent_1: move disk A from right to middle
  ;  4) agent_1: move disk C from left to right
  ;  5) agent_1: move disk A from middle to left
  ;  6) agent_1: move disk B from middle to right
  ;  7) agent_1: move disk A from left to right
  ;  8) agent_1: move disk D from left to middle
  ;  9) agent_1: move disk A from right to middle
  ; 10) agent_1: move disk B from right to left
  ; 11) agent_1: move disk A from middle to left
  ; 12) agent_1: move disk C from right to middle
  ; 13) agent_1: move disk A from left to right
  ; 14) agent_1: move disk B from left to middle
  ; 15) agent_1: move disk A from right to middle
  ; 16) agent_1: move disk E from left to right
  ; 17) agent_1: move disk A from middle to right
  ; 18) agent_1: move disk B from middle to left
  ; 19) agent_1: move disk A from right to left
  ; 20) agent_1: move disk C from middle to right
  ; 21) agent_1: move disk A from left to middle

  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
  )

  (:init
    ; Agent capabilities (hard constraints)
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

    ; Initial configuration (top→bottom) on left:
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

    ; Top-of-stack and empty pegs
    (clear A)
    (clear middle)
    (clear right)
  )

  ; Goal configuration must match exactly the specified stacks.
  (:goal (and
    ; left stack (top→bottom): B, F, G, H, I, J, K, L, M, N, O
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

    ; middle stack (top→bottom): A, D
    (on A D)
    (on D middle)

    ; right stack (top→bottom): C, E
    (on C E)
    (on E right)

    ; tops of stacks are clear
    (clear A)
    (clear B)
    (clear C)
  ))
)