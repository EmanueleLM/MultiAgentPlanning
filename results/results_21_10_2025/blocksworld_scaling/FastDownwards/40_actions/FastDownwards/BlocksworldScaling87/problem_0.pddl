(define (problem build-tower)
  (:domain two-agent-blocks)
  (:objects
    K I E H L G B A J M F C D - block
    vowel1 - vowel_agent
    consonant1 - consonant_agent
  )

  (:init
    ;; block stack 1 (bottom -> top): K, I, H, A, C, D
    (ontable K)
    (on I K)
    (on H I)
    (on A H)
    (on C A)
    (on D C)

    ;; block stack 2 (bottom -> top): E, L, G, B, J, M, F
    (ontable E)
    (on L E)
    (on G L)
    (on B G)
    (on J B)
    (on M J)
    (on F M)

    ;; clear (tops)
    (clear D)
    (clear F)

    ;; type labels
    (is-vowel A)
    (is-vowel E)
    (is-vowel I)

    (is-consonant K)
    (is-consonant H)
    (is-consonant L)
    (is-consonant G)
    (is-consonant B)
    (is-consonant J)
    (is-consonant M)
    (is-consonant F)
    (is-consonant C)
    (is-consonant D)
  )

  (:goal (and
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
    (ontable M)
  ))
)