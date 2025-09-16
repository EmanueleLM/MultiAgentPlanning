(define (problem vowel-consonant-blocks-problem)
  (:domain vowel-consonant-blocks-domain)

  (:objects
    a b c o - block
    vowel-agent consonant-agent - agent
  )

  (:init
    ; Initial block configuration
    (on b a)
    (on-table a)
    (on-table c)
    (on-table o)

    ; Clear blocks (top of stacks or single blocks on table)
    (clear b)
    (clear c)
    (clear o)

    ; Block types
    (is-vowel-block a)
    (is-vowel-block o)
    (is-consonant-block b)
    (is-consonant-block c)

    ; Agent capabilities
    (is-vowel-handler vowel-agent)
    (is-consonant-handler consonant-agent)

    ; Agent hand status
    (hand-empty vowel-agent)
    (hand-empty consonant-agent)
  )

  (:goal
    (and
      (on-table a)
      (on-table b)
      (on o b)
      (on c o)
    )
  )
)