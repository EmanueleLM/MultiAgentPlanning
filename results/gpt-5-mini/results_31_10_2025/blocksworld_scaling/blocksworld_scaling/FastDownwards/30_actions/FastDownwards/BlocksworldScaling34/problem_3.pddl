(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    a e i - vowel
    b c d f g h j k l - consonant
  )

  (:init
    ;; Stack1: H (bottom), I (top)
    (ontable h)
    (on i h)

    ;; Stack2: K (bottom), E, D, B (top)
    (ontable k)
    (on e k)
    (on d e)
    (on b d)

    ;; Stack3: F (bottom), L, J (top)
    (ontable f)
    (on l f)
    (on j l)

    ;; Stack4: C (bottom), G, A (top)
    (ontable c)
    (on g c)
    (on a g)

    ;; Clear (top) blocks
    (clear i)
    (clear b)
    (clear j)
    (clear a)
  )

  (:goal (and
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
    (clear a)
  ))
)