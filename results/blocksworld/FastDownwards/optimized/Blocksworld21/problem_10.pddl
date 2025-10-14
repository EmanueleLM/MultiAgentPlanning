(define (problem rearrange-vowel-consonant)
  (:domain vowel-consonant-blocks)
  (:objects
    vowel_agent consonant_agent orchestrator - agent
    table - place
    a e i - vowel_block
    m h g b l d f c k j - cons_block
  )
  (:init
    (is-vowel-agent vowel_agent)
    (is-cons-agent consonant_agent)

    (on m table)
    (on i m)
    (on k i)
    (on a k)

    (on e table)
    (on l e)
    (on d l)
    (on f d)
    (on j f)

    (on g table)
    (on b g)
    (on c b)

    (on h table)

    (clear a)
    (clear j)
    (clear c)
    (clear h)
  )
  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j k)
    (on k l)
    (on l m)
    (on m table)
  ))
)