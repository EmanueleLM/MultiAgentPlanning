(define (problem BlocksworldScaling118-problem)
  (:domain BlocksworldScaling118)

  (:objects
    table - table
    ; vowels
    A E I - vowel
    ; consonants
    H C K B D J L F G - consonant
  )

  (:init
    ; Initial stacks:
    ; Stack1 (on table): bottom H, then K on H, then D on K, then J on D, then E on J, then G on E, then I on G (I top)
    (on H table)
    (on K H)
    (on D K)
    (on J D)
    (on E J)
    (on G E)
    (on I G)

    ; Stack2 (on table): bottom C, then B on C, then L on B, then A on L, then F on A (F top)
    (on C table)
    (on B C)
    (on L B)
    (on A L)
    (on F A)

    ; Top-of-stack facts (clear)
    (clear I)
    (clear F)

    ; Both agents start with empty hands
    (handempty-vowel)
    (handempty-consonant)
  )

  (:goal (and
    (on L table)
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