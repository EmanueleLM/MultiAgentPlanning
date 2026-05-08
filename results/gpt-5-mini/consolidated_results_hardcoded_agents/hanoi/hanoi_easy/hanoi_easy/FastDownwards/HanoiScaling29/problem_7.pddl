(define (problem hanoi-4disk-instance)
  (:domain hanoi)
  (:objects
    a b c d basel basem baser - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
  )

  (:init
    (on a right)
    (on b right)
    (on c right)
    (on d right)
    (on baser right)

    (on basel left)
    (on basem middle)

    (above a b)
    (above b c)
    (above c d)
    (above d baser)

    (top right a)
    (top middle basem)
    (top left basel)

    (at-step s1)

    (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9)
    (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13)
    (succ s13 s14) (succ s14 s15) (succ s15 s16)

    (smaller a b) (smaller a c) (smaller a d)
    (smaller a basel) (smaller a basem) (smaller a baser)

    (smaller b c) (smaller b d)
    (smaller b basel) (smaller b basem) (smaller b baser)

    (smaller c d)
    (smaller c basel) (smaller c basem) (smaller c baser)

    (smaller d basel) (smaller d basem) (smaller d baser)
  )

  (:goal (and
    (on a left)
    (on b left)
    (on c left)
    (on d left)
    (on basel left)

    (above a b)
    (above b c)
    (above c d)
    (above d basel)

    (top left a)
    (top middle basem)
    (top right baser)

    (at-step s16)
  ))
)