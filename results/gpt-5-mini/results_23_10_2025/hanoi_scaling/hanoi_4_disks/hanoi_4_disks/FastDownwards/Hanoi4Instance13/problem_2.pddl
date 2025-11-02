(define (problem hanoi4instance13-problem)
  (:domain hanoi4instance13)

  (:objects
    a b c d - disk
    left middle right - peg
    left_controller middle_controller right_controller orchestrator - agent
  )

  (:init
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    (clear-disk a)

    (clear-peg middle)
    (clear-peg right)

    (support a left)
    (support b left)
    (support c left)
    (support d left)

    (controls left_controller left)
    (controls middle_controller middle)
    (controls right_controller right)

    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)
  )

  (:goal (and
    (on-peg d right)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)
  ))
)