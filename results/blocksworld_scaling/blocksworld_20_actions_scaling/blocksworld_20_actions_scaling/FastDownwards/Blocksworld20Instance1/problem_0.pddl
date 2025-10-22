(define (problem blocks-problem)
  (:domain blocks-world)
  (:objects a b c d e f g h - block)

  (:init
    ;; Initial stack arrangement:
    ;; C on A, A on G, G on D, D on table
    ;; B on F, F on H, H on E, E on table
    (on c a)
    (on a g)
    (on g d)

    (on b f)
    (on f h)
    (on h e)

    (ontable d)
    (ontable e)

    ;; clear tops
    (clear c)
    (clear b)

    ;; robot hand empty
    (handempty)
  )

  (:goal (and
    ;; Derived final arrangement after full action sequence:
    ;; G on C, C on A, A on B, B on F, F on H, H on E, E on table, D on table
    (on g c)
    (on c a)
    (on a b)
    (on b f)
    (on f h)
    (on h e)
    (ontable e)
    (ontable d)
  ))
)