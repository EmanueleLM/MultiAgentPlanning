(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  ; Assumptions encoded here:
  ; - Table positions are treated as abstract and unlimited (agents may place any block on the table).
  ; - The public initial stacks described in the user input are encoded exactly below.
  ; - Agents' private capabilities are enforced by typing: vowels (A,E,I) can only be moved by
  ;   vowel-* actions; consonants (B,C,D,F,G,H,J,K,L,M,N) can only be moved by consonant-* actions.
  ; - Only top blocks can be moved (enforced via the clear predicate).
  ; - The goal requires the exact tower ordering specified in the public information.
  ; - No additional constraints (e.g., table-spot limits or label-based stacking restrictions)
  ;   were provided, so none are encoded except those stated above.

  (:objects
    A E I - vowel
    B C D F G H J K L M N - consonant
  )

  (:init
    ; Stack1 bottom B, then F on B, then K on F (K is top)
    (ontable B)
    (on F B)
    (on K F)

    ; Stack2 bottom C, then A on C, then L on A, then J on L, then E on J, then H on E, then I on H (I is top)
    (ontable C)
    (on A C)
    (on L A)
    (on J L)
    (on E J)
    (on H E)
    (on I H)

    ; Stack3 bottom M, then N on M, then G on N, then D on G (D is top)
    (ontable M)
    (on N M)
    (on G N)
    (on D G)

    ; clear predicates: only true for blocks that have nothing on top (the tops of the three stacks)
    (clear K)
    (clear I)
    (clear D)

    ; Note: bottoms B, C, M are ontable but not clear (they have blocks on them).
    ; All other blocks are covered by the 'on' facts above; they are not ontable and not clear.
  )

  (:goal (and
    (ontable N)
    (on M N)
    (on L M)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
    (clear A)
  ))
)