(define (problem blocks-multiagent-twoagents-prob)
  (:domain blocks-multiagent-twoagents)
  (:objects
    H D J A E F I G C B - block
    vowel_agent consonant_agent - agent
  )
  (:init
    (canmove consonant_agent B)
    (canmove consonant_agent C)
    (canmove consonant_agent D)
    (canmove consonant_agent F)
    (canmove consonant_agent G)
    (canmove consonant_agent H)
    (canmove consonant_agent J)

    (canmove vowel_agent A)
    (canmove vowel_agent E)
    (canmove vowel_agent I)

    (vowel A)
    (vowel E)
    (vowel I)

    (consonant H)
    (consonant D)
    (consonant J)
    (consonant F)
    (consonant G)
    (consonant C)
    (consonant B)

    (on H table)
    (on D H)
    (on A D)
    (on C A)

    (on J table)
    (on E J)
    (on F E)
    (on I F)
    (on G I)
    (on B G)

    (clear C)
    (clear B)

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
    (on J table)
  ))
)