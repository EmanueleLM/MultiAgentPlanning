(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    a e i - vowel
    b c d - consonant
  )
  (:init
    ;; Initial: all blocks are on the table and clear (no blocks on top)
    (ontable a)
    (ontable e)
    (ontable i)
    (ontable b)
    (ontable c)
    (ontable d)

    (clear a)
    (clear e)
    (clear i)
    (clear b)
    (clear c)
    (clear d)
  )
  (:goal (and
    ;; Global goal: place each vowel on a specific consonant
    (on a b)
    (on e c)
    (on i d)
  ))
)