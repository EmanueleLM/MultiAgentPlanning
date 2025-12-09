(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left-peg middle-peg right-peg - peg
  )

  (:init
    ; initial stack: all disks on the right peg with E at bottom, then D, C, B, A on top
    (on-peg E right-peg)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
    (on-peg D right-peg)
    (on-peg C right-peg)
    (on-peg B right-peg)
    (on-peg A right-peg)

    ; top facts for the initial configuration
    (top A right-peg)

    ; empty pegs at start
    (empty left-peg)
    (empty middle-peg)

    ; size ordering: A smallest, then B, C, D, E largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ; all disks transferred to the left peg in the same stacking order:
    ; E bottom on left-peg, then D on E, C on D, B on C, A on B
    (on-peg E left-peg)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
    (on-peg D left-peg)
    (on-peg C left-peg)
    (on-peg B left-peg)
    (on-peg A left-peg)

    ; top disk on left peg is A
    (top A left-peg)

    ; middle peg must be empty in the goal (explicit hard constraint)
    (empty middle-peg)
  ))
)