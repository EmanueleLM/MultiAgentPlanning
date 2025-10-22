(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)
  (:objects
    vowel1 - vowel_agent
    consonant1 - consonant_agent
    A B C D E F G H I J K L M - block
    pos1 pos2 pos3 pos4 - position
  )
  (:init
    (available vowel1)
    (available consonant1)

    (is_vowel A)
    (is_vowel E)
    (is_vowel I)

    (is_consonant B)
    (is_consonant C)
    (is_consonant D)
    (is_consonant F)
    (is_consonant G)
    (is_consonant H)
    (is_consonant J)
    (is_consonant K)
    (is_consonant L)
    (is_consonant M)

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