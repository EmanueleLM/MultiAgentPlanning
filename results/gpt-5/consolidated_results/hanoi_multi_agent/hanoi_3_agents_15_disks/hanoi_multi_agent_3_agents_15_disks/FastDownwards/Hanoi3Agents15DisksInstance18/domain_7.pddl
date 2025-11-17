(define (domain hanoi3agents15)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    peg disk - place
    agent step - object
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?x - disk ?y - disk)
    (allowed ?a - agent ?d - disk)
    (at ?t - step)
    (next ?t - step ?t2 - step)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - place ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - place ?to - disk ?t - step ?t2 - step)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?t))
      (at ?t2)
    )
  )
)