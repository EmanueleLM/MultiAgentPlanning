(define (problem hanoi-7)
  (:domain hanoi-domain)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial stacking on left peg: bottom G, then F, E, D, C, B, A (top)
    (on-peg G left)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; clears: top disk A is clear; middle and right pegs start empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; size relationships (larger X Y means X is strictly larger than Y)
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)
  )

  (:goal (and
    ;; final stacking on right peg: bottom G, then F, E, D, C, B, A (top)
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