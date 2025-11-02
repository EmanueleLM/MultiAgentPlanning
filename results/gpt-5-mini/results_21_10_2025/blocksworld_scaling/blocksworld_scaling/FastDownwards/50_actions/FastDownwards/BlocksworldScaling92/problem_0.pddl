(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    a b c d e f g h i j k l m n o - block
    table - place
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; base table marker
    (istable table)

    ;; initial on relations (stack bottoms are on table)
    (on d table)
    (on o d)
    (on e o)

    (on n table)
    (on m n)
    (on h m)
    (on f h)
    (on j f)
    (on b j)
    (on c b)

    (on a table)
    (on k a)
    (on g k)
    (on l g)

    (on i table)

    ;; clear (tops)
    (clear e)
    (clear c)
    (clear l)
    (clear i)

    ;; agent hand status
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; agent identity
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)

    ;; vowel/consonant membership (as provided)
    (vowel a)
    (vowel e)
    (vowel i)
    (vowel o)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
    (consonant l)
    (consonant m)
    (consonant n)
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
    (on m n)
    (on n o)
    (on o table)
  ))
)