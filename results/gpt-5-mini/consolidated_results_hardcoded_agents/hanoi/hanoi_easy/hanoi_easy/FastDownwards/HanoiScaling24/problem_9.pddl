(define (problem hanoi-4-3pegs-problem)
  (:domain hanoi-4disks-3pegs)

  (:objects
    a b c d - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; initial tower on middle peg: A on B on C on D on middle
    (on a b)
    (on b c)
    (on c d)
    (on d middle)

    ;; topmost things are clear (no disk on top)
    (clear a)
    (clear left)
    (clear right)

    ;; size ordering (smallest to largest)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; explicit stage ordering to force contiguous moves (15 moves -> s0..s15)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ;; start at initial stage
    (current s0)

    ;; explicit distinctness facts for all different-place ordered pairs
    ;; places = {left, middle, right, a, b, c, d} -> 7 places -> 42 ordered distinct pairs
    (different left middle) (different left right) (different left a) (different left b) (different left c) (different left d)
    (different middle left) (different middle right) (different middle a) (different middle b) (different middle c) (different middle d)
    (different right left) (different right middle) (different right a) (different right b) (different right c) (different right d)
    (different a left) (different a middle) (different a right) (different a b) (different a c) (different a d)
    (different b left) (different b middle) (different b right) (different b a) (different b c) (different b d)
    (different c left) (different c middle) (different c right) (different c a) (different c b) (different c d)
    (different d left) (different d middle) (different d right) (different d a) (different d b) (different d c)
  )

  (:goal (and
    ;; goal tower on right peg: A on B on C on D on right
    (on a b)
    (on b c)
    (on c d)
    (on d right)

    ;; left and middle pegs must be empty (no disks remaining)
    (clear left)
    (clear middle)

    ;; plan must reach final stage exactly
    (current s15)
  ))
)