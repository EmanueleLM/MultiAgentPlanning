(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)

  (:objects
    a e i - vowel
    b c d f g h j k l - consonant
  )

  (:init
    ;; Initial stacks:
    ;; Stack1: b (table), i on b, c on i, d on c, g on d, j on g, l on j
    (ontable b)
    (on i b)
    (on c i)
    (on d c)
    (on g d)
    (on j g)
    (on l j)

    ;; Stack2: e (table), h on e, a on h
    (ontable e)
    (on h e)
    (on a h)

    ;; Stack3: k (table), f on k
    (ontable k)
    (on f k)

    ;; Clear (tops)
    (clear l)
    (clear a)
    (clear f)
  )

  (:goal (and
    ;; final tower bottom->top: l k j i h g f e d c b a
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
  ))
)