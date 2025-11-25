(define (problem hanoi-4-right-to-middle)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    mover - agent
  )
  (:init
    ;; initial stack on right peg: bottom d, then c, then b, top a
    (on a b)
    (on b c)
    (on c d)
    (on d right)

    ;; clear means "nothing on top of this support"
    (clear a)
    (clear left)
    (clear middle)

    ;; can-place facts: any disk can be placed on any peg
    (can-place a left) (can-place a middle) (can-place a right)
    (can-place b left) (can-place b middle) (can-place b right)
    (can-place c left) (can-place c middle) (can-place c right)
    (can-place d left) (can-place d middle) (can-place d right)

    ;; can-place on disks only when moving a strictly smaller disk onto a larger disk
    ;; size order: a < b < c < d
    (can-place a b) (can-place a c) (can-place a d)
    (can-place b c) (can-place b d)
    (can-place c d)
  )

  (:goal (and
    ;; all disks stacked on middle in correct order (d bottom)
    (on d middle)
    (on c d)
    (on b c)
    (on a b)

    ;; left and right pegs must be empty: no disk is on left or right
    (not (on a left)) (not (on b left)) (not (on c left)) (not (on d left))
    (not (on a right)) (not (on b right)) (not (on c right)) (not (on d right))
  ))
)