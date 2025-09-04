(define (problem blocks-rearrangement)
  (:domain block-world)
  (:objects
    A B C O - block
    agent1 agent2 - agent
  )

  (:init
    (ontable A)
    (on B A)
    (ontable C)
    (ontable O)
    (clear B)
    (clear C)
    (clear O)

    (vowel A)
    (consonant B)
    (consonant C)
    (vowel O)

    (vowel-agent agent1)
    (consonant-agent agent2)
  )

  (:goal
    (and 
      (ontable A)
      (ontable B)
      (on C O)
      (on O B)
    )
  )
)