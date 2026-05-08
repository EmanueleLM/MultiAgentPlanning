(define (problem hanoi-4disk-instance)
  (:domain hanoi)
  (:objects
    a b c d basel basem baser - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
  )

  (:init
    ;; initial placement: all real disks on right peg, from top to bottom: a b c d, then baser
    (on a right)
    (on b right)
    (on c right)
    (on d right)
    (on baser right)

    ;; bases on their pegs (base disks represent peg bottoms)
    (on basel left)
    (on basem middle)

    ;; direct above links (direct stack links) for initial right stack
    (above a b)
    (above b c)
    (above c d)
    (above d baser)

    ;; top pointers: right peg top is smallest disk a, middle and left are empty (their bases are top)
    (top right a)
    (top middle basem)
    (top left basel)

    ;; step marker start at s1; require exactly 15 moves (s1 -> ... -> s16)
    (at-step s1)
    (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9)
    (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13)
    (succ s13 s14) (succ s14 s15) (succ s15 s16)

    ;; size (strict ordering). Real disks are ordered a < b < c < d and all real disks are smaller than all bases.
    (smaller a b) (smaller a c) (smaller a d)
    (smaller a basel) (smaller a basem) (smaller a baser)

    (smaller b c) (smaller b d)
    (smaller b basel) (smaller b basem) (smaller b baser)

    (smaller c d)
    (smaller c basel) (smaller c basem) (smaller c baser)

    (smaller d basel) (smaller d basem) (smaller d baser)
  )

  (:goal (and
    ;; final placement: all real disks on left peg in order a (top), b, c, d, then basel
    (on a left)
    (on b left)
    (on c left)
    (on d left)
    (on basel left)

    ;; direct above links reflect the required stack order on left
    (above a b)
    (above b c)
    (above c d)
    (above d basel)

    ;; left peg top is the smallest disk
    (top left a)

    ;; intermediate (middle) and source (right) pegs must be empty again: their top must be their base
    (top middle basem)
    (top right baser)

    ;; ensure the full sequence of moves was executed: final step marker reached
    (at-step s16)
  ))
)