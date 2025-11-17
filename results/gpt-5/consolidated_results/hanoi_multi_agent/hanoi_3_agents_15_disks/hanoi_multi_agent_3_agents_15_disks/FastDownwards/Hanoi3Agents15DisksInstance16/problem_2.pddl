(define (problem Hanoi3Agents15DisksInstance16)
  (:domain hanoi-3agents-15-ordered)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )
  (:init
    ; strict size ordering A < B < ... < O
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

    ; initial stack on left (top->bottom): A,B,C,D,E,F,G,H,I,J,K,L,M,N,O
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
    (onpeg O left)
    (top left A)
    (clear A)

    ; middle and right empty
    (clearpeg middle)
    (clearpeg right)

    ; step controller
    (current-step s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ; allowed move per step (enforces the exact ordered primitive plan)
    (allowed A left  middle s0)
    (allowed B left  right  s1)
    (allowed A middle right  s2)
    (allowed C left  middle s3)
    (allowed A right left   s4)
    (allowed B right middle s5)
    (allowed A left  middle s6)
    (allowed D left  right  s7)
    (allowed A middle right  s8)
    (allowed B middle left   s9)
    (allowed A right left   s10)
    (allowed C middle right s11)
    (allowed A left  right s12)
    (allowed B left  middle s13)
    (allowed A right left  s14)
  )
  (:goal
    (and
      (current-step s15)

      ; exact goal configuration:
      ; left: top->bottom A, E, F, G, H, I, J, K, L, M, N, O
      (top left A)
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
      (onpeg O left)

      ; middle: top->bottom B
      (top middle B)
      (onpeg B middle)

      ; right: top->bottom C, D
      (top right C)
      (on C D)
      (onpeg D right)
    )
  )
)