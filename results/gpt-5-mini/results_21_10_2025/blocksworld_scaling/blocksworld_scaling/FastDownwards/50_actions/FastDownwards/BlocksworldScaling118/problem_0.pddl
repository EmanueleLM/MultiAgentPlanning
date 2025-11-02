(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    table - table
    A E I - vowel
    H C D B - consonant
  )

  (:init
    ; initial on relations (stacks)
    (on A table)
    (on H A)
    (on C table)
    (on D table)
    (on B D)
    (on E B)
    (on I E)

    ; top-of-stack facts
    (clear H)
    (clear C)
    (clear I)

    ; hands empty
    (handempty-vowel)
    (handempty-consonant)

    ; type helper predicates (redundant with typing but included for clarity)
    (isvowel A)
    (isvowel E)
    (isvowel I)
    (isconsonant H)
    (isconsonant C)
    (isconsonant D)
    (isconsonant B)
  )

  (:goal (and
    (on A table)
    (on E table)
    (on I table)
    (clear A)
    (clear E)
    (clear I)
  ))
)