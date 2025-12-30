(define (domain hanoi-4disk)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg
  )
  (:predicates
    (on ?d1 - disk ?b - object) ; d1 is on base b (disk or peg)
    (clear ?x - object)         ; nothing is on x (disk or peg)
    (smaller ?d1 - disk ?d2 - disk) ; static constraint: d1 is smaller than d2
  )
  
  ; 1. Move Disk D from Peg P1 onto Peg P2 (P1 => P2)
  (:action move-disk-from-peg-to-peg
    :parameters (?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (clear ?d)
      (on ?d ?p1)
      (clear ?p2)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?p2)
      (clear ?p1)
      (not (clear ?p2))
    )
  )

  ; 2. Move Disk D from Peg P1 onto Disk D_target (P1 => D_target)
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?p1 - peg ?d_target - disk)
    :precondition (and
      (clear ?d)
      (on ?d ?p1)
      (clear ?d_target)
      (smaller ?d ?d_target) ; Must obey size constraint
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?d_target)
      (clear ?p1)
      (not (clear ?d_target))
    )
  )

  ; 3. Move Disk D from Disk D_base onto Peg P2 (D_base => P2)
  (:action move-disk-from-disk-to-peg
    :parameters (?d - disk ?d_base - disk ?p2 - peg)
    :precondition (and
      (clear ?d)
      (on ?d ?d_base)
      (clear ?p2)
    )
    :effect (and
      (not (on ?d ?d_base))
      (on ?d ?p2)
      (clear ?d_base)
      (not (clear ?p2))
    )
  )
  
  ; 4. Move Disk D from Disk D_base onto Disk D_target (D_base => D_target)
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?d_base - disk ?d_target - disk)
    :precondition (and
      (clear ?d)
      (on ?d ?d_base)
      (clear ?d_target)
      (smaller ?d ?d_target) ; Must obey size constraint
    )
    :effect (and
      (not (on ?d ?d_base))
      (on ?d ?d_target)
      (clear ?d_base)
      (not (clear ?d_target))
    )
  )
)