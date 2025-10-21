(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K L - block
  )

  (:init
    ;; Initial on / ontable relations
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

    ;; Initially clear (tops of stacks): A, G, B
    (clear A)
    (clear G)
    (clear B)

    ;; Agent capability assignment
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

    ;; Both agents' hands are initially empty
    (empty-vowel)
    (empty-consonant)
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