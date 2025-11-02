(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)

  (:objects
    a b c d e f g h i j k l m n o - block
  )

  (:init
    ;; agent membership
    (vowel a) (vowel e) (vowel i) (vowel o)
    (consonant b) (consonant c) (consonant d) (consonant f)
    (consonant g) (consonant h) (consonant j) (consonant k)
    (consonant l) (consonant m) (consonant n)

    ;; initial table / on relations (as given)
    (ontable c)
    (ontable h)
    (ontable o)

    (on g c)
    (on f g)
    (on a f)
    (on d a)
    (on m d)
    (on b m)
    (on k b)
    (on i k)
    (on e i)

    (on j h)
    (on n j)

    (on l o)

    ;; initial clear blocks (only tops that were given)
    (clear e)
    (clear n)
    (clear l)

    ;; both agents' hands are empty initially
    (handempty-v)
    (handempty-c)
  )

  (:goal (and
    (ontable o)
    (on n o)
    (on m n)
    (on l m)
    (on k l)
    (on j k)
    (on i j)
    (on h i)
    (on g h)
    (on f g)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)
  ))
)