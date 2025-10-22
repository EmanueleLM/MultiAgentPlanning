(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D - disk
  )

  (:init
    ; initial stack on left (top -> bottom): A B C D
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D left)
    (top A left)
    (empty middle)
    (empty right)
    (clear A)
    ; B, C, D are not clear initially (there are disks on top of them) -- we do not assert their negations using predicates,
    ; but clear for those is simply absent
    ; size ordering (A smallest, D largest)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ; goal: right peg has stack top->bottom A B C D and other pegs empty
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    (top A right)
    (empty left)
    (empty middle)
  ))
)