(define (problem hanoi-4)
  (:domain tower-of-hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; Initial physical configuration: bottom-to-top on middle: d (bottom), c, b, a (top)
    (on d middle)
    (on c d)
    (on b c)
    (on a b)

    ;; Places that are clear initially (pegs left/right are empty; 'a' is top disk)
    (clear left)
    (clear right)
    (clear a)

    ;; Size ordering facts (strict)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; Explicit stage ordering: allow exactly 15 moves (s0 -> s15)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; start stage
    (at-stage s0)

    ;; different-place facts for all ordered distinct place pairs (places = pegs + disks)
    ;; places: left, middle, right, a, b, c, d
    (different-place left middle) (different-place left right) (different-place left a)
    (different-place left b) (different-place left c) (different-place left d)

    (different-place middle left) (different-place middle right) (different-place middle a)
    (different-place middle b) (different-place middle c) (different-place middle d)

    (different-place right left) (different-place right middle) (different-place right a)
    (different-place right b) (different-place right c) (different-place right d)

    (different-place a left) (different-place a middle) (different-place a right)
    (different-place a b) (different-place a c) (different-place a d)

    (different-place b left) (different-place b middle) (different-place b right)
    (different-place b a) (different-place b c) (different-place b d)

    (different-place c left) (different-place c middle) (different-place c right)
    (different-place c a) (different-place c b) (different-place c d)

    (different-place d left) (different-place d middle) (different-place d right)
    (different-place d a) (different-place d b) (different-place d c)

    ;; disk differences (all ordered pairs of distinct disks)
    (different-disk a b) (different-disk a c) (different-disk a d)
    (different-disk b a) (different-disk b c) (different-disk b d)
    (different-disk c a) (different-disk c b) (different-disk c d)
    (different-disk d a) (different-disk d b) (different-disk d c)
  )

  (:goal (and
    ;; final stack on left peg bottom-to-top: d, c, b, a
    (on d left)
    (on c d)
    (on b c)
    (on a b)

    ;; middle and right pegs empty at the end (clear)
    (clear middle)
    (clear right)

    ;; final stage reached exactly
    (at-stage s15)
  ))
)