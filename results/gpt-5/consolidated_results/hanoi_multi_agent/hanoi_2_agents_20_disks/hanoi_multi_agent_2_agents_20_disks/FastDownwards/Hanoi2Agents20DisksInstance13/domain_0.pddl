(define (domain hanoi-2agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    place
    peg - place
    disk - place
  )
  (:predicates
    (on ?d - disk ?p - peg)
    (on-disk ?d - disk ?u - disk)
    (clear ?x - place)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?p)
      (clear ?d)
      (clear ?q)
    )
    :effect (and
      (not (on ?d ?p))
      (on ?d ?q)
      (clear ?p)
      (not (clear ?q))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p - peg ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?p)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?p))
      (on-disk ?d ?t)
      (clear ?p)
      (not (clear ?t))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?u - disk ?q - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-disk ?d ?u)
      (clear ?d)
      (clear ?q)
    )
    :effect (and
      (not (on-disk ?d ?u))
      (on ?d ?q)
      (clear ?u)
      (not (clear ?q))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?u - disk ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on-disk ?d ?u)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-disk ?d ?u))
      (on-disk ?d ?t)
      (clear ?u)
      (not (clear ?t))
    )
  )
)