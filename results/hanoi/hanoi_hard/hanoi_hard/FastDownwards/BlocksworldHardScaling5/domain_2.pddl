(define (domain hanoi-6-disks)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    disk peg - object
  )
  (:predicates
    (on ?d1 - disk ?d2 - disk)   ; d1 is directly on d2
    (on_peg ?d - disk ?p - peg)  ; d is the lowest disk on peg p
    (clear_disk ?d - disk)       ; nothing is on d
    (clear_peg ?p - peg)         ; peg p is empty
    (holding ?d - disk)          ; hand holds disk d
    (handempty)
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static constraint)
  )

  (:functions
    (total-cost)
  )

  ; -------------------
  ; 1. Pickup disk D from peg P (base disk)
  ; -------------------
  (:action pickup_from_peg
    :parameters (?d - disk ?p - peg)
    :precondition (and
      (on_peg ?d ?p)
      (clear_disk ?d)
      (handempty)
    )
    :effect (and
      (not (on_peg ?d ?p))
      (not (clear_disk ?d))
      (not (handempty))
      (clear_peg ?p)
      (holding ?d)
      (increase (total-cost) 1)
    )
  )

  ; -------------------
  ; 2. Unstack disk D1 from disk D2
  ; -------------------
  (:action unstack
    :parameters (?d1 - disk ?d2 - disk)
    :precondition (and
      (on ?d1 ?d2)
      (clear_disk ?d1)
      (handempty)
    )
    :effect (and
      (not (on ?d1 ?d2))
      (not (clear_disk ?d1))
      (not (handempty))
      (clear_disk ?d2)
      (holding ?d1)
      (increase (total-cost) 1)
    )
  )

  ; -------------------
  ; 3. Put down disk D onto an empty peg P
  ; -------------------
  (:action putdown_to_peg
    :parameters (?d - disk ?p - peg)
    :precondition (and
      (holding ?d)
      (clear_peg ?p)
    )
    :effect (and
      (not (holding ?d))
      (not (clear_peg ?p))
      (clear_disk ?d)
      (on_peg ?d ?p)
      (handempty)
      (increase (total-cost) 1)
    )
  )

  ; -------------------
  ; 4. Stack disk D1 onto disk D2 (Hanoi Constraint: D1 must be smaller than D2)
  ; -------------------
  (:action stack
    :parameters (?d1 - disk ?d2 - disk)
    :precondition (and
      (holding ?d1)
      (clear_disk ?d2)
      (smaller ?d1 ?d2) ; Hanoi constraint: Cannot place larger disk on smaller disk
    )
    :effect (and
      (not (holding ?d1))
      (not (clear_disk ?d2))
      (clear_disk ?d1)
      (on ?d1 ?d2)
      (handempty)
      (increase (total-cost) 1)
    )
  )
)