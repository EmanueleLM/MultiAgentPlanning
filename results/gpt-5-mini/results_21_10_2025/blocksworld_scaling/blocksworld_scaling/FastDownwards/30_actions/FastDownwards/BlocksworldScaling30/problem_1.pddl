(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    a e i - vowel
    b c d f g h j k l m n - consonant
  )
  (:init
    ;; table bases
    (ontable c)
    (ontable j)
    (ontable d)

    ;; stacked relations (initial)
    (on n c)
    (on m n)
    (on l m)
    (on i l)

    (on a j)
    (on k a)
    (on e k)
    (on h e)
    (on f h)

    (on g d)
    (on b g)

    ;; clear predicates: only blocks with nothing on top are clear
    (clear i)
    (clear f)
    (clear b)

    ;; blocks that are not on the table have no ontable fact (others are ontable)
    ;; (ontable facts already set for c, j, d)
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
)