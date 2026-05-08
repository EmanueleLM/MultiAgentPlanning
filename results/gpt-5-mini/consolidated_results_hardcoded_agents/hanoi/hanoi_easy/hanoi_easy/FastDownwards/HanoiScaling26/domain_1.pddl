(define (domain hanoi_orchestrated)
  (:requirements :strips :typing :negative-preconditions)

  (:types peg disk)

  (:predicates
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (on ?d - disk ?p - peg)
    (on-disk ?u - disk ?v - disk)
    (smaller ?u - disk ?v - disk)
  )

  ; Move top disk from a source peg to an empty destination peg
  (:action move_from_peg_to_empty
    :parameters (?x - disk ?s - peg ?t - peg)
    :precondition (and
      (top ?s ?x)
      (on ?x ?s)
      (empty ?t)
      (not (= ?s ?t))
    )
    :effect (and
      (not (top ?s ?x))
      (not (on ?x ?s))
      (not (empty ?t))
      (on ?x ?t)
      (top ?t ?x)
      (empty ?s)
    )
  )

  ; Move top disk from a source peg to a non-empty destination peg (requires smaller)
  (:action move_from_peg_to_nonempty
    :parameters (?x - disk ?s - peg ?t - peg ?z - disk)
    :precondition (and
      (top ?s ?x)
      (on ?x ?s)
      (top ?t ?z)
      (smaller ?x ?z)
      (not (= ?s ?t))
    )
    :effect (and
      (not (top ?s ?x))
      (not (on ?x ?s))
      (not (top ?t ?z))
      (on-disk ?x ?z)
      (top ?t ?x)
      (empty ?s)
    )
  )

  ; Move top disk from on-disk (i.e., disk on another disk) to an empty peg
  (:action move_from_disk_to_empty
    :parameters (?x - disk ?y - disk ?s - peg ?t - peg)
    :precondition (and
      (top ?s ?x)
      (on-disk ?x ?y)
      (empty ?t)
      (not (= ?s ?t))
    )
    :effect (and
      (not (top ?s ?x))
      (not (on-disk ?x ?y))
      (top ?s ?y)
      (not (empty ?t))
      (on ?x ?t)
      (top ?t ?x)
    )
  )

  ; Move top disk from on-disk to on-disk (placing onto a disk at destination)
  (:action move_from_disk_to_nonempty
    :parameters (?x - disk ?y - disk ?s - peg ?t - peg ?z - disk)
    :precondition (and
      (top ?s ?x)
      (on-disk ?x ?y)
      (top ?t ?z)
      (smaller ?x ?z)
      (not (= ?s ?t))
    )
    :effect (and
      (not (top ?s ?x))
      (not (on-disk ?x ?y))
      (top ?s ?y)
      (not (top ?t ?z))
      (on-disk ?x ?z)
      (top ?t ?x)
    )
  )
)