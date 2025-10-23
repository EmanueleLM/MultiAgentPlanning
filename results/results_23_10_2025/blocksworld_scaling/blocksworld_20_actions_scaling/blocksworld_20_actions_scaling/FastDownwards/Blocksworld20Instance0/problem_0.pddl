(define (problem blocks-final-from-sequence)
  (:domain blocks-world)
  (:objects A B C D E F G H I J - block)
  (:init
    ;; initial table/on relations (public initial state)
    (ontable A)
    (on D A)

    (ontable E)

    (on C H)
    (ontable H)

    (on B I)
    (ontable I)

    (on G B)
    (on F G)
    (on J F)

    ;; initial clear/top facts (top blocks at start)
    (clear D)
    (clear C)
    (clear J)
    (clear E)

    ;; agent free hand at start
    (handempty)
  )

  ;; goal = final arrangement after executing the given action sequence
  (:goal (and
    ;; blocks that end on the table
    (ontable A)
    (ontable E)
    (ontable H)
    (ontable I)

    ;; blocks that end on other blocks (final stack relations)
    (on D A)
    (on C E)
    (on J C)
    (on F G)
    (on G B)
    (on B I)
  ))
)