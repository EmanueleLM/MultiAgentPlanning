(define (problem build-tower-L-to-A)
  (:domain blocksworld-scaling88)
  (:objects
    a e i - vowel_block
    j h k c b d g l f - cons_block
  )

  (:init
    (ontable j)
    (on a j)
    (on h a)
    (on e h)
    (on d e)
    (on l d)
    (on f l)

    (ontable k)
    (on c k)
    (on b c)
    (on g b)
    (on i g)

    (clear f)
    (clear i)
  )

  (:goal
    (and
      (ontable l)
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
    )
  )
)