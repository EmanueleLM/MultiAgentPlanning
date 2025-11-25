(define (problem hanoi_4_orchestrated)
  (:domain hanoi_orchestrated)

  ; Objects: pegs and disks (canonical names reconciled)
  (:objects
    peg_left peg_middle peg_right - peg
    disk_A disk_B disk_C disk_D - disk
  )

  ; Initial state encoding: the canonical initial state is
  ; peg_left: []
  ; peg_middle: [disk_A, disk_B, disk_C, disk_D]  (top-to-bottom)
  ; peg_right: []
  ; We fully expand the relational stack encoding used by the domain predicates.
  (:init
    ; Peg emptiness
    (empty peg_left)
    (not (empty peg_middle))
    (empty peg_right)

    ; Stack encoding: bottom disk_D directly on peg_middle
    (on disk_D peg_middle)
    ; direct-on-disk relations (upper, lower)
    (on-disk disk_C disk_D)
    (on-disk disk_B disk_C)
    (on-disk disk_A disk_B)
    ; top disk on peg_middle is disk_A
    (top peg_middle disk_A)

    ; Size relations: strictly smaller pairs
    (smaller disk_A disk_B)
    (smaller disk_A disk_C)
    (smaller disk_A disk_D)
    (smaller disk_B disk_C)
    (smaller disk_B disk_D)
    (smaller disk_C disk_D)

    ; Distinct peg pairs (helper to forbid same-peg moves)
    (distinct peg_left peg_middle)
    (distinct peg_left peg_right)
    (distinct peg_middle peg_left)
    (distinct peg_middle peg_right)
    (distinct peg_right peg_left)
    (distinct peg_right peg_middle)
  )

  ; Goal: complete stack moved to peg_left, top-to-bottom disk_A, disk_B, disk_C, disk_D,
  ; and peg_middle and peg_right empty as mandated by the specification.
  (:goal (and
    (top peg_left disk_A)
    (on-disk disk_A disk_B)
    (on-disk disk_B disk_C)
    (on-disk disk_C disk_D)
    (on disk_D peg_left)
    (empty peg_middle)
    (empty peg_right)
  ))

  ; No metric specified: default is to find any plan reaching the goal under the constraints.
)