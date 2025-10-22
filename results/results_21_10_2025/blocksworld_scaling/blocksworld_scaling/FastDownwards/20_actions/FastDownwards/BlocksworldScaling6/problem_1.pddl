(define (problem blocksworld_multiagents_problem)
  (:domain blocksworld_multiagents)

  (:objects
    ; vowels
    A E I - vowel
    ; consonants
    B C D F G H J K - consonant

    ; agents
    vowel1 - vowel_agent
    consonant1 - consonant_agent
    orchestrator1 - orchestrator
  )

  (:init
    ; initial on-table bottoms
    (ontable A)
    (ontable G)
    (ontable E)

    ; initial on relations (stacks listed bottom-to-top)
    (on C A)
    (on I C)
    (on B I)
    (on D B)
    (on F D)

    (on J G)
    (on K J)
    (on H K)

    ; clear = top of each initial stack
    (clear F)
    (clear H)
    (clear E)

    ; non-clear facts are implicitly absent; list handempty and no holdings
    (handempty vowel1)
    (handempty consonant1)
    (handempty orchestrator1)
  )

  (:goal (and
    ; K must be on the table
    (ontable K)
    ; Above K (from bottom to top): J I H G F E D C B A with A at the top
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