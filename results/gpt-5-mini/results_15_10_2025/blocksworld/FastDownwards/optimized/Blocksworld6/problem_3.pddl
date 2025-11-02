(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)

  (:objects
    a e i - vowel
    c d l k h f g j b - cons
    table - place
  )

  (:init
    (on a table)
    (on i a)
    (on l i)
    (on k l)
    (on e k)
    (on f e)
    (on c table)
    (on d c)
    (on h d)
    (on g h)
    (on j g)
    (on b j)
    (clear f)
    (clear b)
    (handfree-vowel)
    (handfree-cons)
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