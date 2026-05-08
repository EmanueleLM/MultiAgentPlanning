(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location slot)
  (:predicates
    (at ?p - person ?l - location ?s - slot)
    (busy ?p - person ?s - slot)
    (slot-next ?s1 - slot ?s2 - slot)
    (available ?p - person ?s - slot)
    (duration1 ?from - location ?to - location)
    (duration2 ?from - location ?to - location)
    (met ?p - person)
  )

  (:action person-wait
    :parameters (?p - person ?loc - location ?s - slot ?s2 - slot)
    :precondition (and
      (at ?p ?loc ?s)
      (slot-next ?s ?s2)
      (available ?p ?s2)
      (not (busy ?p ?s2))
    )
    :effect (and
      (at ?p ?loc ?s2)
    )
  )

  (:action person-travel-1
    :parameters (?p - person ?from - location ?to - location ?s - slot ?s2 - slot)
    :precondition (and
      (duration1 ?from ?to)
      (at ?p ?from ?s)
      (slot-next ?s ?s2)
      (available ?p ?s2)
      (not (busy ?p ?s2))
    )
    :effect (and
      (at ?p ?to ?s2)
      (busy ?p ?s2)
    )
  )

  (:action person-travel-2
    :parameters (?p - person ?from - location ?to - location ?s - slot ?sMid - slot ?s2 - slot)
    :precondition (and
      (duration2 ?from ?to)
      (at ?p ?from ?s)
      (slot-next ?s ?sMid)
      (slot-next ?sMid ?s2)
      (available ?p ?sMid)
      (available ?p ?s2)
      (not (busy ?p ?sMid))
      (not (busy ?p ?s2))
    )
    :effect (and
      (at ?p ?to ?s2)
      (busy ?p ?sMid)
      (busy ?p ?s2)
    )
  )

  (:action meet-2
    :parameters (?a - person ?b - person ?loc - location ?s - slot ?s2 - slot)
    :precondition (and
      (slot-next ?s ?s2)
      (at ?a ?loc ?s)
      (at ?a ?loc ?s2)
      (available ?a ?s)
      (available ?a ?s2)
      (at ?b ?loc ?s)
      (at ?b ?loc ?s2)
      (available ?b ?s)
      (available ?b ?s2)
      (not (busy ?a ?s))
      (not (busy ?a ?s2))
      (not (busy ?b ?s))
      (not (busy ?b ?s2))
    )
    :effect (and
      (busy ?a ?s)
      (busy ?a ?s2)
      (busy ?b ?s)
      (busy ?b ?s2)
      (at ?a ?loc ?s2)
      (at ?b ?loc ?s2)
      (met ?b)
      (met ?a)
    )
  )

  (:action meet-1
    :parameters (?a - person ?b - person ?loc - location ?s - slot)
    :precondition (and
      (at ?a ?loc ?s)
      (available ?a ?s)
      (at ?b ?loc ?s)
      (available ?b ?s)
      (not (busy ?a ?s))
      (not (busy ?b ?s))
    )
    :effect (and
      (busy ?a ?s)
      (busy ?b ?s)
      (met ?b)
      (met ?a)
    )
  )
)