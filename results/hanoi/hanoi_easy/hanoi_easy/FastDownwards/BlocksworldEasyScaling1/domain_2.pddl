(define (domain hanoi-4disk)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg
  )
  (:predicates
    (on ?d1 - disk ?d2 - (either disk peg)) ; d2 is what d1 is sitting on (disk or peg)
    (clear ?x - (either disk peg))         ; nothing is on x (disk or peg)
    (smaller ?d1 - disk ?d2 - disk) ; static constraint: d1 is smaller than d2
  )

  ; Action 1: Moving disk D onto a target peg P
  (:action move-to-peg
    :parameters (?d - disk ?b1 - (either disk peg) ?p - peg)
    ; Move disk ?d from base ?b1 to peg ?p.
    
    :precondition (and
      ; 1. Disk to move must be available (clear)
      (clear ?d)
      
      ; 2. Disk must be resting on B1
      (on ?d ?b1)
      
      ; 3. Target peg P must be available (clear)
      (clear ?p)
    )
    :effect (and
      ; Update stacking
      (not (on ?d ?b1))
      (on ?d ?p)
      
      ; Update clearance status
      (clear ?b1)      ; B1 becomes clear
      (not (clear ?p)) ; Peg P is now covered
    )
  )

  ; Action 2: Moving disk D onto a target disk D_target
  (:action move-to-disk
    :parameters (?d - disk ?b1 - (either disk peg) ?d_target - disk)
    ; Move disk ?d from base ?b1 onto disk ?d_target.
    
    :precondition (and
      ; 1. Disk to move must be available (clear)
      (clear ?d)
      
      ; 2. Disk must be resting on B1
      (on ?d ?b1)
      
      ; 3. Target disk D_target must be available (clear)
      (clear ?d_target)
      
      ; 4. Size constraint: D must be strictly smaller than D_target
      (smaller ?d ?d_target)
    )
    :effect (and
      ; Update stacking
      (not (on ?d ?b1))
      (on ?d ?d_target)
      
      ; Update clearance status
      (clear ?b1)          ; B1 becomes clear
      (not (clear ?d_target)) ; D_target is now covered
    )
  )
)