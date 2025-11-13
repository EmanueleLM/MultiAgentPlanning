(define (domain hanoi-3peg-20disks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk agent)
  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on ?d - disk ?u - disk)
    (clear ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?x - disk ?y - disk)
    (permitted ?a - agent ?d - disk)
  )

  (:action move-peg-to-peg
    :parameters (?a - agent ?d - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (permitted ?a ?d)
      (clear ?d)
      (on-peg ?d ?pfrom)
      (clear-peg ?pto)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (on-peg ?d ?pto)
      (clear-peg ?pfrom)
      (not (clear-peg ?pto))
    )
  )

  (:action move-peg-to-disk
    :parameters (?a - agent ?d - disk ?pfrom - peg ?t - disk)
    :precondition (and
      (permitted ?a ?d)
      (clear ?d)
      (on-peg ?d ?pfrom)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (on ?d ?t)
      (not (clear ?t))
      (clear-peg ?pfrom)
    )
  )

  (:action move-disk-to-peg
    :parameters (?a - agent ?d - disk ?u - disk ?pto - peg)
    :precondition (and
      (permitted ?a ?d)
      (clear ?d)
      (on ?d ?u)
      (clear-peg ?pto)
    )
    :effect (and
      (not (on ?d ?u))
      (on-peg ?d ?pto)
      (clear ?u)
      (not (clear-peg ?pto))
    )
  )

  (:action move-disk-to-disk
    :parameters (?a - agent ?d - disk ?u - disk ?t - disk)
    :precondition (and
      (permitted ?a ?d)
      (clear ?d)
      (on ?d ?u)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?t)
      (clear ?u)
      (not (clear ?t))
    )
  )
)