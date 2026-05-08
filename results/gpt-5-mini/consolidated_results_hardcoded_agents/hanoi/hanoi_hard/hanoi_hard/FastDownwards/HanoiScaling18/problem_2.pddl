(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    a b c d e f - disk
    left middle right - peg
  )
  (:init
    ;; Stack on left (top->bottom): a b c d e f
    ;; Using relation (on X Y) meaning "X is directly on Y".
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    ;; Tops and empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ;; size ordering: larger X Y means X is strictly larger than Y
    (larger f e) (larger f d) (larger f c) (larger f b) (larger f a)
    (larger e d) (larger e c) (larger e b) (larger e a)
    (larger d c) (larger d b) (larger d a)
    (larger c b) (larger c a)
    (larger b a)
  )

  ;; Goal: all disks stacked on the middle peg in order top->bottom a b c d e f,
  ;; and both left and right pegs empty at the end.
  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f middle)
    (clear left)
    (clear right)
  ))
)