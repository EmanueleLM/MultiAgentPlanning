(define (problem multiagent-blocksworld-problem)
  (:domain multiagent-blocksworld)
  (:objects
    A B C D E F G H I J K L M - block
  )
  (:init
    ;; Type classification
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
    (consonant L)
    (consonant M)

    ;; Initial stacks (conservative integration of agents' public info)
    ;; Stack1 (bottom -> top): K I G E M F
    (ontable K)
    (on I K)
    (on G I)
    (on E G)
    (on M E)
    (on F M)

    ;; Stack2 (bottom -> top): B A D
    (ontable B)
    (on A B)
    (on D A)

    ;; Stack3 (bottom -> top): C H J L
    (ontable C)
    (on H C)
    (on J H)
    (on L J)

    ;; Clear/top blocks
    (clear F)
    (clear D)
    (clear L)

    ;; Hand is empty (kept invariant by actions)
    (handempty)
  )

  ;; Goal: single tower with bottom M, then L on M, K on L, ..., top A
  (:goal
    (and
      (ontable M)
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
    )
  )
)