(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    vowel_agent consonant_agent - agent
    A B C D E F G H I J - block
  )

  (:init
    ; Agents identity
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)

    ; Block type classification (private capability encoded as hard facts)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G) (consonant H) (consonant J)

    ; Initial stacking configuration (public information)
    ; Stack 1 (top->...->table): A on H on E on C on J on-table
    (on A H)
    (on H E)
    (on E C)
    (on C J)
    (on-table J)

    ; Stack 2 (top->...->table): B on G on F on D on-table
    (on B G)
    (on G F)
    (on F D)
    (on-table D)

    ; Single block stack: I on-table
    (on-table I)

    ; Top/clear facts: only top blocks are clear
    (clear A)
    (clear B)
    (clear I)
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
    (on-table J)
  ))
)