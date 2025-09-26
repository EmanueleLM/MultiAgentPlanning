(define (problem stack-A-on-B-...-K)
  (:domain multi-agent-blocksworld)
  (:objects
    A E I - vowel_block
    J K G F B D C H - consonant_block
    A B C D E F G H I J K - block
  )

  (:init
    ;; initial stacks: J(bottom)-K-G-A-F-B-D-C(top) and E(bottom)-H-I(top)
    (ontable J)
    (ontable E)
    (on K J)
    (on G K)
    (on A G)
    (on F A)
    (on B F)
    (on D B)
    (on C D)
    (on H E)
    (on I H)

    ;; clear tops
    (clear C)
    (clear I)

    ;; hands empty
    (handempty vowel_agent)
    (handempty consonant_agent)
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
    (ontable K)
  ))
)