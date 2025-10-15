(define (problem multiblocks-instance)
  (:domain multi_agent_blocks)
  (:objects
    a b c d e f g h i j k l - block
  )
  (:init
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g) (consonant h) (consonant j) (consonant k) (consonant l)

    (on h l)
    (on g h)
    (on a g)
    (ontable l)

    (on k j)
    (on c k)
    (on d c)
    (ontable j)

    (on b i)
    (on e b)
    (on f e)
    (ontable i)

    (clear a)
    (clear d)
    (clear f)

    (handempty-vowel)
    (handempty-consonant)
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
    (ontable l)
  ))
)