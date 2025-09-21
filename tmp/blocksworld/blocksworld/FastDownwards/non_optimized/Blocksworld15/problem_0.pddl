(define (problem multi_agent_stacking)
  (:domain multi_agent_blocks)
  (:objects
    A B C D E F G H I J K - block
  )
  (:init
    ;; Agent capabilities (as provided by each agent)
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

    ;; Initial world (normalized: on <block> <block> and ontable <block>)
    ;; Stack1 bottom-to-top: F H J C E G B A
    (ontable F)
    (on H F)
    (on J H)
    (on C J)
    (on E C)
    (on G E)
    (on B G)
    (on A B)

    ;; Stack2 bottom-to-top: D K I
    (ontable D)
    (on K D)
    (on I K)

    ;; clear (top blocks)
    (clear A)
    (clear I)

    ;; Note: other clear facts are omitted (not clear by omission)
  )

  (:goal
    (and
      ;; final bottom: K on the table
      (ontable K)
      ;; then upwards: J on K, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
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