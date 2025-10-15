(define (problem multiagent-blocks-problem)
  :domain multiagent-blocksworld
  :objects
    a e i o c h g f d m j b k l n - block
    vowel_agent consonant_agent - agent
  :init
    (ontable c)
    (ontable o)
    (ontable h)

    (on g c)
    (on f g)
    (on a f)
    (on d a)
    (on m d)
    (on b m)
    (on k b)
    (on i k)
    (on e i)

    (on l o)

    (on j h)
    (on n j)

    (clear e)
    (clear l)
    (clear n)

    (vowel a) (vowel e) (vowel i) (vowel o)
    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g)
    (consonant h) (consonant j) (consonant k) (consonant l) (consonant m) (consonant n)
  :goal (and
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
    (ontable o)
  )
)