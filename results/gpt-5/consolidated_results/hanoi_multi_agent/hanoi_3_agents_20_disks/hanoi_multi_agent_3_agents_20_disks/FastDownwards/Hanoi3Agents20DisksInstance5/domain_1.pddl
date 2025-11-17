(define (domain hanoi-3pegs-permissions)
  (:requirements :strips :typing)
  (:types agent disk peg)
  (:predicates
    (smaller ?x - disk ?y - disk)
    (on ?x - disk ?p - peg)        ; disk x is directly on peg p (i.e., bottom disk of that peg)
    (on-disk ?x - disk ?y - disk)  ; disk x is directly on disk y
    (clear ?x - disk)              ; no disk is on top of x
    (top ?p - peg ?x - disk)       ; x is the current top disk on peg p
    (empty ?p - peg)               ; peg p has no disks
    (allowed ?a - agent ?x - disk) ; agent a is permitted to move disk x
  )

  ; Move a single disk that is the only disk on its source peg to an empty destination peg
  (:action move-from-peg-to-empty
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?p1)
      (top ?p1 ?d)
      (clear ?d)
      (empty ?p2)
    )
    :effect (and
      (not (on ?d ?p1))
      (not (top ?p1 ?d))
      (not (empty ?p2))
      (on ?d ?p2)
      (top ?p2 ?d)
      (empty ?p1)
      (clear ?d)
    )
  )

  ; Move a single disk that is the only disk on its source peg onto the top disk of another peg
  (:action move-from-peg-onto
    :parameters (?a - agent ?d - disk ?e - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?p1)
      (top ?p1 ?d)
      (clear ?d)
      (top ?p2 ?e)
      (clear ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?p1))
      (not (top ?p1 ?d))
      (not (top ?p2 ?e))
      (not (clear ?e))
      (on-disk ?d ?e)
      (top ?p2 ?d)
      (empty ?p1)
      (clear ?d)
    )
  )

  ; Move a single disk from atop another disk to an empty destination peg
  (:action move-from-disk-to-empty
    :parameters (?a - agent ?d - disk ?s - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (allowed ?a ?d)
      (on-disk ?d ?s)
      (top ?p1 ?d)
      (clear ?d)
      (empty ?p2)
      (smaller ?d ?s)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (not (top ?p1 ?d))
      (not (empty ?p2))
      (clear ?s)
      (top ?p1 ?s)
      (on ?d ?p2)
      (top ?p2 ?d)
      (clear ?d)
    )
  )

  ; Move a single disk from atop another disk onto the top disk of another peg
  (:action move-from-disk-onto
    :parameters (?a - agent ?d - disk ?s - disk ?e - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (allowed ?a ?d)
      (on-disk ?d ?s)
      (top ?p1 ?d)
      (clear ?d)
      (top ?p2 ?e)
      (clear ?e)
      (smaller ?d ?e)
      (smaller ?d ?s)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (not (top ?p1 ?d))
      (not (top ?p2 ?e))
      (not (clear ?e))
      (clear ?s)
      (top ?p1 ?s)
      (on-disk ?d ?e)
      (top ?p2 ?d)
      (clear ?d)
    )
  )
)