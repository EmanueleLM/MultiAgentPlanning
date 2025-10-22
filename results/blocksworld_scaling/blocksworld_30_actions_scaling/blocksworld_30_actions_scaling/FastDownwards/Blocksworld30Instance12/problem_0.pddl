(define (problem blocks-final-arrangement)
  (:domain blocks-world)
  (:objects
    A B C D E F G H I J - block
    table - place
  )

  (:init
    ;; initial placement (from provided initial arrangement)
    (on A table)
    (on E A)
    (on J table)
    (on B J)
    (on C table)
    (on F C)
    (on D F)
    (on G table)
    (on I G)
    (on H I)

    ;; initial clear blocks (those with nothing on top at the start)
    (clear E)
    (clear B)
    (clear D)
    (clear H)

    ;; agent's hand initially empty
    (handempty)
  )

  (:goal (and
    ;; Final arrangement after executing the given action sequence:
    ;; Stack: A(table) - E - B - G
    (on A table)
    (on E A)
    (on B E)
    (on G B)

    ;; J on table alone
    (on J table)

    ;; Stack: C(table) - F - D
    (on C table)
    (on F C)
    (on D F)

    ;; Stack: I(table) - H
    (on I table)
    (on H I)
  ))
)