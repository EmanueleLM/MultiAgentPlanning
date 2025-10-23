(define (problem hanoi-4)
  (:domain hanoi-domain)
  (:objects
    a b c d - disk
    left middle right - peg
    agent_left agent_middle agent_right - agent
  )

  (:init
    ;; initial stacking on the left peg (D bottom, C, B, A top)
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; top/clear indicators
    (clear-disk a)
    (not (clear-disk b))
    (not (clear-disk c))
    (not (clear-disk d))

    (not (clear-peg left))
    (clear-peg middle)
    (clear-peg right)

    ;; support: all disks initially supported by left peg
    (support a left)
    (support b left)
    (support c left)
    (support d left)

    ;; agents control respective pegs (peg controllers)
    (controls agent_left left)
    (controls agent_middle middle)
    (controls agent_right right)

    ;; size ordering (A smallest, D largest)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; all four disks moved to the right peg in correct order (D bottom .. A top)
    (on-peg d right)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)
  ))
)