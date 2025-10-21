(define (problem blocks_multiagent_problem_vc)
  (:domain blocks_multiagent_vowel_consonant)

  (:objects
    A E I O - block
    B C D F G H J K L M N - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; agents declared
    (agent vowel_agent)
    (agent consonant_agent)

    ;; agent hands empty initially
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; static block classifications
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)
    (consonant N)

    ;; initial stacks (as given)
    ;; Stack 1: N (table) - E - A - M - I - O (top)
    (ontable N)
    (on E N)
    (on A E)
    (on M A)
    (on I M)
    (on O I)

    ;; Stack 2: G (table) - F - L - J (top)
    (ontable G)
    (on F G)
    (on L F)
    (on J L)

    ;; Stack 3: B (table) - K (top)
    (ontable B)
    (on K B)

    ;; Stack 4: C (table) - D - H (top)
    (ontable C)
    (on D C)
    (on H D)

    ;; clear (top) facts
    (clear O)
    (clear J)
    (clear K)
    (clear H)
  )

  (:goal (and
    ;; final single-stack bottom-up:
    ;; O on table, N on O, M on N, L on M, K on L, J on K, I on J, H on I, G on H,
    ;; F on G, E on F, D on E, C on D, B on C, A on B
    (ontable O)
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
    ;; top must be clear
    (clear A)
  ))
)