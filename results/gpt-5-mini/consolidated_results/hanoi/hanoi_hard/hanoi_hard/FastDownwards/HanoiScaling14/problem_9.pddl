(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    a b c d e f - disk
    left middle right - peg
  )

  (:init
    ;; size ordering: a smallest, f largest (pairwise)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; initial stacking on the middle peg: top->bottom a b c d e f
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-peg  f middle)

    ;; top facts: a is the current top of middle
    (top a middle)

    ;; pegs left and right are empty initially
    (empty left)
    (empty right)

    ;; distinctness facts for pegs (both directions to allow (different ?from ?to) matches)
    (different left middle) (different middle left)
    (different left right)  (different right left)
    (different middle right) (different right middle)
  )

  (:goal
    (and
      ;; final stacking on left peg: top->bottom a b c d e f
      (on-disk a b)
      (on-disk b c)
      (on-disk c d)
      (on-disk d e)
      (on-disk e f)
      (on-peg  f left)
      (top a left)

      ;; auxiliary peg constraints: middle and right must be empty
      (empty middle)
      (empty right)
    )
  )
)