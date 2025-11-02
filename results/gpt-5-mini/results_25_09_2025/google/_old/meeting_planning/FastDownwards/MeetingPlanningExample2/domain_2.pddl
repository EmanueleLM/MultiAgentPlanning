(define (domain integrated-meetup)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types location person slot)

  (:predicates
    (at ?l - location)
    (available ?p - person ?l - location)
    (available-slot ?p - person ?l - location ?s - slot)
    (next ?s - slot ?s2 - slot)
    (after6 ?s - slot ?s2 - slot)
    (time-at ?s - slot)
    (met ?p - person)
  )

  (:functions
    (total-cost)
  )

  (:action a1-travel
    :parameters (?from ?to - location ?s ?snext - slot)
    :precondition (and (at ?from) (time-at ?s) (next ?s ?snext) (not (= ?from ?to)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (time-at ?s))
      (time-at ?snext)
      (increase (total-cost) 1)
    )
  )

  (:action a1-wait
    :parameters (?s ?snext - slot)
    :precondition (and (time-at ?s) (next ?s ?snext))
    :effect (and
      (not (time-at ?s))
      (time-at ?snext)
      (increase (total-cost) 1)
    )
  )

  (:action a2-start-meeting
    :parameters (?p - person ?loc - location
                 ?s0 ?s1 ?s2 ?s3 ?s4 ?s5 ?send - slot)
    :precondition (and
      (at ?loc)
      (time-at ?s0)
      (available-slot ?p ?loc ?s0) (available-slot ?p ?loc ?s1)
      (available-slot ?p ?loc ?s2) (available-slot ?p ?loc ?s3)
      (available-slot ?p ?loc ?s4) (available-slot ?p ?loc ?s5)
      (next ?s0 ?s1) (next ?s1 ?s2) (next ?s2 ?s3)
      (next ?s3 ?s4) (next ?s4 ?s5)
      (after6 ?s0 ?send)
    )
    :effect (and
      (met ?p)
      (not (time-at ?s0))
      (time-at ?send)
    )
  )
)