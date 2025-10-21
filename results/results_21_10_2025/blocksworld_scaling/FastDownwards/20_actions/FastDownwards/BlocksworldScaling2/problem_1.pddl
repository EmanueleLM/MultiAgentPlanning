(define (problem blocksworld-instance)
  (:domain blocksworld-multiagent)

  (:objects
    a e i o - vowel
    b c d f g h j k l m n - consonant
  )

  (:init
    ;; Stack1 bottom-to-top: O, B, A, D
    (ontable o)
    (on b o)
    (on a b)
    (on d a)
    (clear d)

    ;; Stack2 bottom-to-top: L, J, E, N, C, F
    (ontable l)
    (on j l)
    (on e j)
    (on n e)
    (on c n)
    (on f c)
    (clear f)

    ;; Stack3 bottom-to-top: K, H
    (ontable k)
    (on h k)
    (clear h)

    ;; Stack4 bottom-to-top: I, G, M
    (ontable i)
    (on g i)
    (on m g)
    (clear m)
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
    (on l m)
    (on m n)
    (on n o)
    (ontable o)
  ))
)