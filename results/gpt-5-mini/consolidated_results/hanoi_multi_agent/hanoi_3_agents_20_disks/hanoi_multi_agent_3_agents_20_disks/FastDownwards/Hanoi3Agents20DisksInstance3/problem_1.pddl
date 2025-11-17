(define (problem Hanoi3Agents20DisksInstance3-problem)
  (:domain Hanoi3Agents20DisksInstance3)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
    ;; Initial stacked chain: top->bottom A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T on left peg
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
    (on-disk O P)
    (on-disk P Q)
    (on-disk Q R)
    (on-disk R S)
    (on-disk S T)
    (on-peg T left)

    ;; Top-of-peg facts: A is the top disk on left initially
    (top A left)
    ;; other pegs empty initially
    (empty middle)
    (empty right)

    ;; Agent movement capabilities
    (can-move-agent1 A) (can-move-agent1 B) (can-move-agent1 C) (can-move-agent1 D)
    (can-move-agent1 E) (can-move-agent1 F) (can-move-agent1 G)
    (can-move-agent2 H) (can-move-agent2 I) (can-move-agent2 J) (can-move-agent2 K)
    (can-move-agent2 L) (can-move-agent2 M) (can-move-agent2 N)
    (can-move-agent3 O) (can-move-agent3 P) (can-move-agent3 Q) (can-move-agent3 R)
    (can-move-agent3 S) (can-move-agent3 T)

    ;; Size (smaller) facts required by the plan:
    (smaller A B)
    (smaller A D)
    (smaller A E)
    (smaller B C)
    (smaller B D)
  )

  (:goal (and
    ;; Goal configuration:
    ;; Left peg top-to-bottom: A, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
    (on-disk A E)
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
    (on-disk O P)
    (on-disk P Q)
    (on-disk Q R)
    (on-disk R S)
    (on-disk S T)
    (on-peg T left)

    ;; Middle peg top-to-bottom: B, D
    (on-disk B D)
    (on-peg D middle)

    ;; Right peg top-to-bottom: C
    (on-peg C right)
  ))
)