(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top-to-bottom a, b, c, d
    (on a b)
    (on b c)
    (on c d)
    (on d left)

    ;; top/clear facts: a is top disk, middle and right pegs are empty
    (clear a)
    (clear middle)
    (clear right)

    ;; disk size order: a < b < c < d
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; goal stack on right: top-to-bottom a, b, c, d
    (on a b)
    (on b c)
    (on c d)
    (on d right)

    ;; left and middle must be empty
    (clear left)
    (clear middle)
  ))
)