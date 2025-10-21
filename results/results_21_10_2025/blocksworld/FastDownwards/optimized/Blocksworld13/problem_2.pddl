(define (problem multi_agent_blocks_problem)
  (:domain multi_agent_blocks_with_hands)
  (:objects
    j a g k f c h d e i b - block
    table - place
  )

  (:init
    (on j table)
    (on a table)
    (on g a)
    (on k j)
    (on f k)
    (on c g)
    (on h f)
    (on d h)
    (on e c)
    (on i e)
    (on b i)

    (clear b)
    (clear d)

    (vowel a)
    (vowel e)
    (vowel i)

    (consonant j)
    (consonant g)
    (consonant k)
    (consonant f)
    (consonant c)
    (consonant h)
    (consonant d)
    (consonant b)

    (handempty_vowel)
    (handempty_consonant)
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
    (on k table)
  ))
)