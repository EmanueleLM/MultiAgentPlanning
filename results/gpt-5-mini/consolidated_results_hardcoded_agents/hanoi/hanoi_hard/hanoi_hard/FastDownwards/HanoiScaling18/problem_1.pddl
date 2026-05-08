(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    a b c d e f - disk
    left middle right - peg
  )
  (:init
    ;; initial stacked configuration on left: top->bottom a b c d e f
    (on a left)
    (on b a)
    (on c b)
    (on d c)
    (on e d)
    (on f e)

    ;; top-of-stack and empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ;; static size ordering: larger X Y means X is strictly larger than Y
    (larger f e) (larger f d) (larger f c) (larger f b) (larger f a)
    (larger e d) (larger e c) (larger e b) (larger e a)
    (larger d c) (larger d b) (larger d a)
    (larger c b) (larger c a)
    (larger b a)
  )

  ;; Goal: all disks stacked on the middle peg in order a (top) .. f (bottom),
  ;; and both ordered stage markers must have been achieved in sequence during execution.
  ;; Requiring stage1 and stage2 as explicit goal facts forces the planner to reach the
  ;; intermediate configurations (and to apply the marker actions) in the required order.
  (:goal (and
    (on a middle)
    (on b a)
    (on c b)
    (on d c)
    (on e d)
    (on f e)
    (stage1)
    (stage2)
  ))
)