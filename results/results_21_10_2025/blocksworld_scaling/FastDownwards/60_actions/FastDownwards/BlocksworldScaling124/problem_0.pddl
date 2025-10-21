(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    A I E O K L F B C G M N J D H - block
    S1 S2 - stack
  )

  (:init
    ;; Vowel / consonant classification (private-agent capabilities encoded as predicates)
    (vowel A) (vowel E) (vowel I) (vowel O)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M) (consonant N)

    ;; Initial stacks (public environment). Using the provided bottom-to-top lists,
    ;; we encode immediate on-relations top→place. Public stacks:
    ;; Stack1 bottom-to-top A, I, O, F, B, G  => top-to-bottom G, B, F, O, I, A
    ;; Stack2 bottom-to-top E, H, D, K, L, M, C, N, J => top-to-bottom J, N, C, M, L, K, D, H, E

    ;; S1 contents (top → on relation)
    (on G S1)
    (on B G)
    (on F B)
    (on O F)
    (on I O)
    (on A I)

    ;; S2 contents (top → on relation)
    (on J S2)
    (on N J)
    (on C N)
    (on M C)
    (on L M)
    (on K L)
    (on D K)
    (on H D)
    (on E H)

    ;; Clear predicates: only the top blocks of each stack are clear initially
    (clear G)
    (clear J)
    ;; Other places (blocks under others and stacks that have tops) are not clear and therefore not listed.

    ;; Note: stacks S1 and S2 are not clear initially because they have top blocks on them.
  )

  (:goal
    (and
      ;; Global final stack: bottom-to-top O, N, M, L, K, J, I, H, G, F, E, D, C, B, A
      ;; O must be on a table stack (we choose S1 as the bottom/table stack for the final single stack).
      (on O S1)
      (on N O)
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

      ;; Top block A must be clear in the final configuration.
      (clear A)

      ;; The other stack (S2) must be empty in the final configuration (clear).
      (clear S2)
    )
  )
)