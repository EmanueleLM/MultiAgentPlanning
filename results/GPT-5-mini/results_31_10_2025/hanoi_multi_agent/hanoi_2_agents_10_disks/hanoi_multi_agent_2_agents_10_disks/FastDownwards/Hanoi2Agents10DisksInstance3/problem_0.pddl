(define (problem hanoi-coop-problem)
  (:domain hanoi-coop)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: top-to-bottom a b c d e f g h i j
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-peg  j left)

    ;; clear facts initially: top disk a is clear; pegs middle and right are clear
    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ;; size ordering: a smallest, j largest
    ;; all pairs where first is smaller than second
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)
  )

  (:goal (and
    ;; goal configuration:
    ;; left peg top-to-bottom a, b, e, f, g, h, i, j
    (on-disk a b)
    (on-disk b e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-peg j left)

    ;; right peg top-to-bottom c, d
    (on-disk c d)
    (on-peg d right)

    ;; middle peg empty (implicitly, no on-peg or on-disk facts referencing middle)
  ))
)