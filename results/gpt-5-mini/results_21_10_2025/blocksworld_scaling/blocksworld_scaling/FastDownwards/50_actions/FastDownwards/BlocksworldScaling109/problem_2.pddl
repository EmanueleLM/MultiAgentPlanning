(define (problem rearrange-multiagent)
  (:domain blocks-multiagent)
  (:objects
    a e i - vowel
    b c d f g h j k - consonant
  )

  (:init
    (ontable c)
    (on a c)
    (on k a)
    (ontable j)
    (on e j)
    (on b e)
    (on h b)
    (on g h)
    (ontable f)
    (on d f)
    (on i d)
    (clear k)
    (clear g)
    (clear i)
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
    (ontable k)
  ))
)