(define (problem hanoi7-instance18)
  (:domain hanoi-7-domain)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left peg: bottom G, F, E, D, C, B, A (A is top)
    ;; Represented so that bottom is given as on-peg, above relations as on-disk chain:
    (on-peg G left)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; Top disk A is clear. The left peg has a top disk so it's not clear.
    (clear-disk A)

    ;; Middle and right pegs are empty
    (clear-peg middle)
    (clear-peg right)

    ;; Size (larger) relations: G > F > E > D > C > B > A
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)
  )

  (:goal (and
    ;; Goal stack on right peg: bottom G, F, E, D, C, B, A (A top). Equivalent encoding:
    (on-peg G right)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
    (clear-disk A)
  ))
)