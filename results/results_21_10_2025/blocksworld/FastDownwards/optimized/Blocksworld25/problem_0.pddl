(define (problem combined-stacking)
  (:domain combined-blocks)
  (:objects A B C D E F G H I J K L - block)

  (:init
    ;; Initial on / ontable relations (combined information from both agents)
    (on E I)
    (ontable I)

    (ontable D)
    (on K D)
    (on H K)
    (on A H)

    (ontable C)
    (on G C)

    (on J E)
    (on F J)
    (on L F)
    (on B L)

    ;; Clear (top) blocks initially
    (clear A)
    (clear B)
    (clear G)

    ;; Which blocks each agent may move
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
    (ontable L)
  ))
)