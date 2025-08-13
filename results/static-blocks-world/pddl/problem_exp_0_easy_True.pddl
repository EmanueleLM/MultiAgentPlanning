(define (problem blockworld-multi-agent-problem)
  (:domain multi-behavior-blockworld)

  (:objects V E I O C R - block)

  (:init
    ; All blocks start on the table and clear
    (on-table V) (clear V)
    (on-table E) (clear E)
    (on-table I) (clear I)
    (on-table O) (clear O)
    (on-table C) (clear C)
    (on-table R) (clear R)

    ; Both agents start with empty hands
    (hand-empty-A)
    (hand-empty-B)

    ; Type information – only A may move vowels, only B may move consonants
    (vowel E)
    (vowel I)
    (vowel O)
    (consonant V)
    (consonant C)
    (consonant R)
  )

  (:goal
    (and
      ; O must be on the table
      (on-table O)

      ; V on top of O
      (on V O)

      ; E on top of V
      (on E V)

      ; E must be clear
      (clear E)

      ; R, I, C remain on the table and clear
      (on-table R) (clear R)
      (on-table I) (clear I)
      (on-table C) (clear C)
    ))
)