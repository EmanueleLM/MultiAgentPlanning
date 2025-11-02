(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types place peg disk agent)
  ;; peg and disk are subtypes of place
  (:types peg disk - place)
  (:predicates
    (on ?d - disk ?p - place)        ;; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ;; nothing is on top of place ?p
    (can-place ?d - disk ?p - place) ;; disk ?d may be legally placed directly onto place ?p
    (allowed ?a - agent ?d - disk)  ;; agent ?a is allowed to move disk ?d
  )

  ;; Agent 1: moves disks A-E (a-e)
  (:action move_agent_1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (allowed agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: moves disks F-J (f-j)
  (:action move_agent_2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (allowed agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)