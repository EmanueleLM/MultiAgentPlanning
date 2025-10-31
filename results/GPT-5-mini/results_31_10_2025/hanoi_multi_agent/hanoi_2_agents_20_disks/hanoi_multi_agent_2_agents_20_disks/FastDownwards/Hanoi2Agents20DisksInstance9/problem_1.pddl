(define (problem Hanoi2Agents20DisksInstance9)
  (:domain hanoi_two_agents)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )
  (:init
    ; stack on relations: top->bottom A,B,C,...,T on left
    (on A B) (on B C) (on C D) (on D E) (on E F) (on F G) (on G H) (on H I) (on I J) (on J K)
    (on K L) (on L M) (on M N) (on N O) (on O P) (on P Q) (on Q R) (on R S) (on S T) (on T left)

    ; initial top and emptiness
    (top left A)
    (empty middle)
    (empty right)

    ; movement permissions
    (allowed_agent1 A) (allowed_agent1 B) (allowed_agent1 C) (allowed_agent1 D) (allowed_agent1 E)
    (allowed_agent1 F) (allowed_agent1 G) (allowed_agent1 H) (allowed_agent1 I) (allowed_agent1 J)

    (allowed_agent2 K) (allowed_agent2 L) (allowed_agent2 M) (allowed_agent2 N) (allowed_agent2 O)
    (allowed_agent2 P) (allowed_agent2 Q) (allowed_agent2 R) (allowed_agent2 S) (allowed_agent2 T)

    ; The smaller relation is included in the domain but not necessary for the concrete plan
    ; (It may be left empty; the "onto-disk" actions require it if used.)
  )

  ; Goal encodes the human-specified final configuration:
  ; left peg top->bottom: C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
  ; middle peg top->bottom: B
  ; right peg top->bottom: A
  (:goal (and
    ; top disks on pegs
    (top left C)
    (top middle B)
    (top right A)

    ; A and B placed on the target pegs
    (on A right)
    (on B middle)

    ; Remaining stack C..T remains on left in correct adjacency
    (on C D) (on D E) (on E F) (on F G) (on G H) (on H I) (on I J) (on J K)
    (on K L) (on L M) (on M N) (on N O) (on O P) (on P Q) (on Q R) (on R S) (on S T) (on T left)
  ))
)