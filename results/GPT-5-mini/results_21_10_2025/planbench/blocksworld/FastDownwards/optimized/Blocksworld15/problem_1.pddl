(define (problem orchestrated_stacking_verification)
  (:domain orchestrated_blocksworld)

  (:objects
    A B C D E F G H I J K - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; Initial stacks (bottom -> top):
    ;; Stack1: F H J C E G B A
    (ontable F)
    (on H F)
    (on J H)
    (on C J)
    (on E C)
    (on G E)
    (on B G)
    (on A B)

    ;; Stack2: D K I
    (ontable D)
    (on K D)
    (on I K)

    ;; Only top blocks are clear initially: A and I
    (clear A)
    (clear I)

    ;; Single global hand is empty initially
    (handempty)

    ;; Agent role markers
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)

    ;; Block ownership by letter type
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
  )

  (:goal
    (and
      ;; Final single stack bottom-to-top:
      ;; K on table, J on K, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
      (ontable K)
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
    )
  )
)