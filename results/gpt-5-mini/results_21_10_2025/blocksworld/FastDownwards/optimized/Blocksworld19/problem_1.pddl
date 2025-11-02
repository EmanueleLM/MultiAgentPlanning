(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ;; classification
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M)

    ;; initial configuration (from public specification)
    (ontable G)
    (ontable H)
    (on L G)
    (ontable I)
    (on J L)
    (on C H)
    (on D I)
    (on B J)
    (on F D)
    (on M C)
    (ontable A)
    (on K A)
    (on E K)

    ;; hand initially empty
    (handempty)

    ;; initially clear (tops of stacks)
    (clear B)
    (clear M)
    (clear F)
    (clear E)
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