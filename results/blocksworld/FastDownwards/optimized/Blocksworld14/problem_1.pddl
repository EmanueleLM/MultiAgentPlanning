(define (problem orchestrator_problem)
  (:domain multiagent_blocks)
  (:objects
    a b c d e f g h i j k l m n
  )
  (:init
    ;; which blocks each agent may move
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
    (consonant l)
    (consonant m)
    (consonant n)

    ;; initial on-table facts
    (ontable l)
    (ontable k)

    ;; initial stacking (top relations)
    (on m l)
    (on a m)
    (on h k)
    (on c h)
    (on e a)
    (on g c)
    (on j g)
    (on n e)
    (on i j)
    (on f n)
    (on d i)
    (on b f)

    ;; clear = top-of-stack blocks (precomputed)
    (clear b)
    (clear d)

    ;; initialize cost
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
    (on l m)
    (on m n)
    (ontable n)
  ))
  (:metric minimize (total-cost))
)