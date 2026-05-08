(define (problem hanoi-4disk-instance)
  (:domain hanoi)
  (:objects
    a b c d baseL baseM baseR - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
  )

  (:init
    ;; initial placement: all real disks on right peg, from top to bottom: a b c d, then baseR
    (on a right)
    (on b right)
    (on c right)
    (on d right)
    (on baseR right)
    ;; bases on their pegs
    (on baseL left)
    (on baseM middle)

    ;; direct above links (direct stack links)
    (above a b)
    (above b c)
    (above c d)
    (above d baseR)

    ;; bases have no disk below them (no above facts for them)
    ;; top pointers
    (top right a)
    (top middle baseM)
    (top left baseL)

    ;; step marker start
    (at-step s1)
    ;; successor chain enforces the move-order with exactly 15 moves (s1->s16)
    (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9)
    (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13)
    (succ s13 s14) (succ s14 s15) (succ s15 s16)

    ;; size (strict ordering). Real disks are smaller than larger real disks and all are smaller than bases.
    (smaller a b) (smaller a c) (smaller a d)
    (smaller a baseL) (smaller a baseM) (smaller a baseR)

    (smaller b c) (smaller b d)
    (smaller b baseL) (smaller b baseM) (smaller b baseR)

    (smaller c d)
    (smaller c baseL) (smaller c baseM) (smaller c baseR)

    (smaller d baseL) (smaller d baseM) (smaller d baseR)
  )

  (:goal (and
    ;; final placement: all real disks on left peg in order a (top), b, c, d, then baseL
    (on a left)
    (on b left)
    (on c left)
    (on d left)
    (on baseL left)

    ;; direct above links reflect the required stack order
    (above a b)
    (above b c)
    (above c d)
    (above d baseL)

    ;; left peg top is the smallest disk
    (top left a)

    ;; intermediate peg (middle) must be empty of real disks: it must contain only its base
    (on baseM middle)

    ;; right peg must be empty of real disks (contain only its base)
    (on baseR right)

    ;; ensure the full sequence of moves was executed: final step marker reached
    (at-step s16)
  ))
)