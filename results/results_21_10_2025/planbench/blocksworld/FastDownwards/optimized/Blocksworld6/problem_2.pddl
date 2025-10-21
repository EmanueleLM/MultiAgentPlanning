(define (problem multi_agent_block_problem)
  (:domain multi_agent_block_domain)
  (:objects
    a b c d e f g h i j k l - block
    table - support
  )

  (:init
    (on a table)
    (on c table)
    (on i a)
    (on d c)
    (on l i)
    (on k l)
    (on e k)
    (on h d)
    (on f e)
    (on g h)
    (on j g)
    (on b j)

    (clear f)
    (clear b)

    (handempty-v)
    (handempty-c)

    (vowel a)
    (vowel e)
    (vowel i)

    (consonant c)
    (consonant d)
    (consonant l)
    (consonant k)
    (consonant h)
    (consonant f)
    (consonant g)
    (consonant j)
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
    (on l table)
  ))
)