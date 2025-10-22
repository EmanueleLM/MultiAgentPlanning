(define (domain orchestrator-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)
  (:predicates
    (on ?d - disk ?x - object)      ; disk ?d is directly on object ?x (disk or peg)
    (clear ?x - object)            ; nothing is on top of object ?x
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-to-peg
    :parameters (?d - disk ?s - object ?p - peg)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?p)
      (clear ?s)
      (not (clear ?p))
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?s - object ?t - disk)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (clear ?s)
      (not (clear ?t))
    )
  )
)