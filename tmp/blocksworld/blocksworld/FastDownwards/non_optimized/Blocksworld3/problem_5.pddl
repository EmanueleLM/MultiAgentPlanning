(define (problem multi_agent_block_task)
  (:domain multi_agent_blocks)
  (:objects a b c d e f g h i j - block)

  (:init
    (vowel a)
    (vowel e)
    (vowel i)
    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)

    (ontable c)
    (ontable b)

    (on i c)
    (on f i)
    (on j f)

    (on d b)
    (on a d)
    (on e a)
    (on g e)
    (on h g)

    (clear j)
    (clear h)

    (handempty-vowel)
    (handempty-consonant)
  )

  (:goal
    (and
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (ontable j)
    )
  )
)