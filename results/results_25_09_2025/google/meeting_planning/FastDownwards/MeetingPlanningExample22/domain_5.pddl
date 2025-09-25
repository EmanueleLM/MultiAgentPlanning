(define (domain meeting-domain)
  (:requirements :typing :negative-preconditions)
  (:types agent location moment)
  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - moment)
    (met-105)
  )

  (:action travel-visitor
    :parameters (?from - location ?to - location ?t1 - moment ?t2 - moment)
    :precondition (and (at visitor ?from) (current-time ?t1))
    :effect (and
      (not (at visitor ?from))
      (at visitor ?to)
      (not (current-time ?t1))
      (current-time ?t2)
    )
  )

  (:action travel-andrew
    :parameters (?from - location ?to - location ?t1 - moment ?t2 - moment)
    :precondition (and (at andrew ?from) (current-time ?t1))
    :effect (and
      (not (at andrew ?from))
      (at andrew ?to)
      (not (current-time ?t1))
      (current-time ?t2)
    )
  )

  (:action wait-visitor
    :parameters (?loc - location ?t1 - moment ?t2 - moment)
    :precondition (and (at visitor ?loc) (current-time ?t1))
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
    )
  )

  (:action wait-andrew
    :parameters (?loc - location ?t1 - moment ?t2 - moment)
    :precondition (and (at andrew ?loc) (current-time ?t1))
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
    )
  )

  (:action andrew-arrive
    :parameters (?t - moment)
    :precondition (current-time ?t)
    :effect (and
      (at andrew unionsq)
    )
  )

  (:action andrew-depart
    :parameters (?t - moment)
    :precondition (and (at andrew unionsq) (current-time ?t))
    :effect (and
      (not (at andrew unionsq))
    )
  )

  (:action meet-visitor-andrew
    :parameters (?loc - location ?t1 - moment ?t2 - moment)
    :precondition (and (at visitor ?loc) (at andrew ?loc) (current-time ?t1))
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (met-105)
    )
  )
)