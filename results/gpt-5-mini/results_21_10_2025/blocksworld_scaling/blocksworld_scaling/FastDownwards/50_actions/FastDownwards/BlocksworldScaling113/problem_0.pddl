(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K L M N O - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ; agent identities
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ; block type classification (vowels and consonants)
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)
    ; U is not present among blocks, so not declared

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
    (consonant N)
    (consonant O) ; note: O already marked vowel above; to avoid contradiction, do NOT mark O as consonant. REMOVE this line.
  )

  ; The above accidentally included O as consonant; correct initialization below by redefining the init section fully.