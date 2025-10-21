(define (problem BlocksworldScaling61-problem)
  (:domain blocksworld-multiagent)

  (:objects
    vowel_agent consonant_agent orchestrator - agent
    table - place
    k a l m c g d e j h f i b - block
    table_obj - object
  )

  (:init
    (on k table_obj)
    (on m k)
    (on g m)
    (on i g)
    (on b i)

    (on a table_obj)
    (on l a)
    (on c l)
    (on d c)
    (on e d)
    (on j e)
    (on h j)
    (on f h)

    (clear b)
    (clear f)

    (handempty vowel_agent)
    (handempty consonant_agent)

    (v-agent vowel_agent)
    (c-agent consonant_agent)

    (vowel a)
    (vowel e)
    (vowel i)

    (consonant k)
    (consonant l)
    (consonant m)
    (consonant c)
    (consonant g)
    (consonant d)
    (consonant j)
    (consonant h)
    (consonant f)
    (consonant b)
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
    (on m table_obj)
  ))
)