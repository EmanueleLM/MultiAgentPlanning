(define (problem build_stack_multiagent)
  (:domain blocksworld_multiagent)

  (:objects
    a e i - vowel
    b c d f g h j k - consonant
  )

  (:init
    (ontable j)
    (on k j)
    (on c k)
    (on f c)
    (on b f)
    (on h b)
    (on e h)

    (ontable g)
    (on i g)
    (on d i)
    (on a d)

    (clear e)
    (clear a)
  )

  (:goal (and
    (ontable k)
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