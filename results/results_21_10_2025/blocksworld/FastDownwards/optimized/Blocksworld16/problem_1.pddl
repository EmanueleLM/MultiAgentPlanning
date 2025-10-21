(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)

  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ;; initial "on" relations (from the provided public configuration)
    (ontable B)
    (ontable E)
    (ontable K)

    (on C B)
    (on D C)
    (on H D)

    (on J E)
    (on F J)
    (on G F)
    (on L G)

    (on I K)
    (on M I)
    (on A M)

    ;; top-of-stack clear facts for initial configuration
    (clear A)
    (clear L)
    (clear H)

    ;; both agents start with empty hands
    (handempty-vowel)
    (handempty-cons)

    ;; agent capability facts (private-to-agent constraints made explicit)
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