(define (problem two-agent-blocks-problem)
  (:domain two-agent-blocks)
  (:objects
    table - place
    a b c d e - block
    vowel-agent consonant-agent - agent
  )

  (:init
    ;; Initial on relationships (public environment)
    (on a table)
    (on b table)
    (on c a)
    (on d b)
    (on e table)

    ;; Clear blocks (those with nothing on top)
    (clear c)
    (clear d)
    (clear e)

    ;; Agents are initially handempty
    (handempty vowel-agent)
    (handempty consonant-agent)

    ;; Agent type markers
    (v-agent vowel-agent)
    (c-agent consonant-agent)

    ;; Block classifications (enforce agents' exclusive move constraints)
    (vowel a)
    (vowel e)
    (consonant b)
    (consonant c)
    (consonant d)
  )

  (:goal (and
           (on e d)
           (on d c)
           (on c b)
           (on b a)
           (on a table)
         ))
)