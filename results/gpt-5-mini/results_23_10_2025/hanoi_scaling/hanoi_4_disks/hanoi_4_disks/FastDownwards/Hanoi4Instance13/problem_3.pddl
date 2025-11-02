(define (problem hanoi4instance13-problem)
  (:domain hanoi4instance13)

  (:objects
    a b c d - disk
    left middle right - peg
    left_controller middle_controller right_controller orchestrator - agent
  )

  (:init
    ;; all disks start on the left peg
    (at a left)
    (at b left)
    (at c left)
    (at d left)

    ;; stack representation top->bottom: a on b, b on c, c on d, d on left peg
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d left)

    ;; only the top disk has nothing on it
    (clear-disk a)

    ;; middle and right pegs are empty initially
    (clear-peg middle)
    (clear-peg right)

    ;; controllers for pegs
    (controls left_controller left)
    (controls middle_controller middle)
    (controls right_controller right)

    ;; size ordering: a smallest, d largest
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; all disks on the right peg in the same top->bottom order
    (at a right)
    (at b right)
    (at c right)
    (at d right)

    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d right)

    ;; left and middle pegs empty
    (clear-peg left)
    (clear-peg middle)
  ))
)