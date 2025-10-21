(define (problem multi_agent_stacking_orchestrated)
  (:domain multi_agent_blocks_orchestrated)
  (:objects
    A B C D E F G H I J K L - block
  )

  (:init
    (ontable C)
    (on L C)
    (on A L)
    (on K A)
    (on J K)

    (ontable D)
    (on B D)
    (on E B)
    (on H E)

    (ontable F)
    (on G F)
    (on I G)

    (clear J)
    (clear H)
    (clear I)

    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B) (consonant C) (consonant D)
    (consonant F) (consonant G) (consonant H)
    (consonant J) (consonant K) (consonant L)

    (handempty_v)
    (handempty_c)
  )

  (:goal (and
    (ontable L)
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
  ))
)