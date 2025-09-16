(define (problem vowel-consonant-blocks-problem)
  (:domain vowel-consonant-blocks-domain)

  (:objects
    a b c o - block
    vowel-agent consonant-agent - agent
  )

  (:init
    ; Initial block configuration
    (on b a)     ; B is on A
    (on-table a) ; A is on the table (base of the first stack)
    (on-table c) ; C is on the table (single block stack)
    (on-table o) ; O is on the table (single block stack)

    ; Clear blocks (top of stacks or single blocks on table)
    (clear b) ; Nothing on B
    (clear c) ; Nothing on C
    (clear o) ; Nothing on O

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
      (on-table a) ; A alone on the table
      (on-table b) ; B as the base of a stack
      (on o b)     ; O on top of B
      (on c o)     ; C on top of O
    )
  )
)