(define (problem hanoi-4disk-instance)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
  )

  (:init
    ;; disk positions (initial: all on right, a top ... d bottom)
    (on a right)
    (on b right)
    (on c right)
    (on d right)

    ;; adjacency (directly above relations)
    (above a b)
    (above b c)
    (above c d)

    ;; has-below marks which disks have a disk directly beneath them
    (has-below a)
    (has-below b)
    (has-below c)

    ;; tops and emptiness
    (top right a)
    (empty left)
    (empty middle)

    ;; step timeline: 15 moves allowed (s1 -> s16)
    (at-step s1)
    (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9)
    (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13)
    (succ s13 s14) (succ s14 s15) (succ s15 s16)

    ;; size ordering (smaller relations)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; final stack on left: a (top), b, c, d (bottom)
    (on a left)
    (on b left)
    (on c left)
    (on d left)

    (above a b)
    (above b c)
    (above c d)

    (top left a)

    ;; middle and right must be empty at goal
    (empty middle)
    (empty right)

    ;; final step reached
    (at-step s16)
  ))