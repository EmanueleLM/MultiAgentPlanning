(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on right peg (bottom F ... top A):
    ;; F on right, E on F, D on E, C on D, B on C, A on B
    (on F right)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; Clear predicates: only the top disk and the empty pegs (left,middle) are clear initially.
    (clear A)
    (clear left)
    (clear middle)

    ;; Size relations (strict): list all required pairwise larger relations so legal moves are enforced.
    ;; F is largest, then E, D, C, B, A smallest.
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)
  )

  ;; Goal: all disks stacked on left peg in correct order (bottom F ... top A),
  ;; and terminal clear states for supports that must be empty/top.
  (:goal (and
    ;; final stack on left
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; final clear facts: top disk A is clear; the other pegs must be empty
    (clear A)
    (clear middle)
    (clear right)
  ))
)