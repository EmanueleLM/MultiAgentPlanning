(define (problem integrated_multiagent_problem)
  (:domain multiagent_blocks)
  (:objects
    a b c d e f g h i j k l - block
  )

  (:init
    (vowel a) (vowel e) (vowel i)
    (consonant c) (consonant d) (consonant l) (consonant k)
    (consonant h) (consonant f) (consonant g) (consonant j) (consonant b)

    (ontable a)
    (on i a)
    (on l i)
    (on k l)
    (on e k)
    (on f e)

    (ontable c)
    (on d c)
    (on h d)
    (on g h)
    (on j g)
    (on b j)

    (clear f)
    (clear b)

    (handempty_v)
    (handempty_c)

    (= (total-cost) 0)
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

  (:metric minimize (total-cost))
)