(define (problem multiagent-stack-A-on-B-C-D-E-F-G-H-I-J-K)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K - block
    vowel_agent - agent-vowel
    consonant_agent - agent-cons
  )

  (:init
    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable G) (clear G)
    (ontable H) (clear H)
    (ontable I) (clear I)
    (ontable J) (clear J)
    (ontable K) (clear K)
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