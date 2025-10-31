(define (problem multi_agent_block_problem)
  (:domain multi_agent_block_domain)
  (:objects
    A B C D E F G H I J K L - block
    table - support
  )

  (:init
    ;; initial "on" relationships (table is a support object)
    (on A table)
    (on C table)
    (on I A)
    (on D C)
    (on L I)
    (on K L)
    (on E K)
    (on H D)
    (on F E)
    (on G H)
    (on J G)
    (on B J)

    ;; clear/top blocks (only topmost blocks initially)
    (clear F)
    (clear B)

    ;; agent hands initially empty
    (handempty-v)
    (handempty-c)

    ;; agent capabilities
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant C)
    (consonant D)
    (consonant L)
    (consonant K)
    (consonant H)
    (consonant F)
    (consonant G)
    (consonant J)
    (consonant B)
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
    (on L table)
  ))
)