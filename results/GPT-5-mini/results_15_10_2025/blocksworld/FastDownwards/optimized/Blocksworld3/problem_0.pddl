(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    a e - vowel
    b c d - consonant
  )

  (:init
    ;; Initial configuration (public): A on table; B on C; C on D; D on E; E on table.
    (ontable a)
    (on b c)
    (on c d)
    (on d e)
    (ontable e)

    ;; Clear (top blocks)
    (clear a)
    (clear b)

    ;; Both agents' hands are initially free
    (handfree-vowel)
    (handfree-consonant)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (ontable e)
  ))
)