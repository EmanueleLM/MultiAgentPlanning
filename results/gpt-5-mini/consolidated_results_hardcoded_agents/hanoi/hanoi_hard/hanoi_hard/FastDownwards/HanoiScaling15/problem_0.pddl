(define (problem hanoi6-problem)
  (:domain hanoi6)
  (:objects
    disk_A disk_B disk_C disk_D disk_E disk_F - disk
    peg_left peg_mid peg_right - peg
    ; 'support' is the supertype; disks and pegs are valid supports for on/clear predicates
  )

  (:init
    ; Immediate support facts (bottom-up representation, top-to-bottom A..F stacked on peg_right)
    (on disk_A disk_B)
    (on disk_B disk_C)
    (on disk_C disk_D)
    (on disk_D disk_E)
    (on disk_E disk_F)
    (on disk_F peg_right)

    ; clear facts: top disk and empty pegs are clear initially
    (clear disk_A)
    (clear peg_left)
    (clear peg_mid)
    ; peg_right is not clear initially because disk_F is on it

    ; explicit peg-membership (in_stack_on) for every disk (auditor required)
    (in_stack_on disk_A peg_right)
    (in_stack_on disk_B peg_right)
    (in_stack_on disk_C peg_right)
    (in_stack_on disk_D peg_right)
    (in_stack_on disk_E peg_right)
    (in_stack_on disk_F peg_right)

    ; static smaller-than relation (immutable)
    (smaller_than disk_A disk_B)
    (smaller_than disk_A disk_C)
    (smaller_than disk_A disk_D)
    (smaller_than disk_A disk_E)
    (smaller_than disk_A disk_F)

    (smaller_than disk_B disk_C)
    (smaller_than disk_B disk_D)
    (smaller_than disk_B disk_E)
    (smaller_than disk_B disk_F)

    (smaller_than disk_C disk_D)
    (smaller_than disk_C disk_E)
    (smaller_than disk_C disk_F)

    (smaller_than disk_D disk_E)
    (smaller_than disk_D disk_F)

    (smaller_than disk_E disk_F)

    ; available flag to enforce sequential (non-concurrent) moves
    (available)
  )

  (:goal (and
    ; All disks stacked on peg_mid in the required order (top-to-bottom A..F)
    (on disk_A disk_B)
    (on disk_B disk_C)
    (on disk_C disk_D)
    (on disk_D disk_E)
    (on disk_E disk_F)
    (on disk_F peg_mid)

    ; peg-membership must match final stacking (auditor demanded in_stack_on as primitive)
    (in_stack_on disk_A peg_mid)
    (in_stack_on disk_B peg_mid)
    (in_stack_on disk_C peg_mid)
    (in_stack_on disk_D peg_mid)
    (in_stack_on disk_E peg_mid)
    (in_stack_on disk_F peg_mid)

    ; final emptiness of the other pegs: they must be clear (no disks directly on them)
    (clear peg_left)
    (clear peg_right)

    ; ensure the planner leaves the mutex available flag true at goal
    (available)
  ))
)