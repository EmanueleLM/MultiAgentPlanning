(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)
  (:objects
    vowel_agent - vowel-agent
    consonant_agent - consonant-agent
    A B C D E F G H I J K L M - block
    pos1 pos2 pos3 pos4 - position
  )
  (:init
    (available vowel_agent)
    (available consonant_agent)

    (is-vowel A)
    (is-vowel E)
    (is-vowel I)

    (is-consonant B)
    (is-consonant C)
    (is-consonant D)
    (is-consonant F)
    (is-consonant G)
    (is-consonant H)
    (is-consonant J)
    (is-consonant K)
    (is-consonant L)
    (is-consonant M)

    ;; stack at pos1 bottom-to-top: J M E G
    (ontable J pos1)
    (on M J)
    (on E M)
    (on G E)
    (top G)

    ;; stack at pos2 bottom-to-top: I K F L
    (ontable I pos2)
    (on K I)
    (on F K)
    (on L F)
    (top L)

    ;; stack at pos3 bottom-to-top: B C
    (ontable B pos3)
    (on C B)
    (top C)

    ;; stack at pos4 bottom-to-top: D A H
    (ontable D pos4)
    (on A D)
    (on H A)
    (top H)
  )
  (:goal
    (and
      (ontable M pos1)
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