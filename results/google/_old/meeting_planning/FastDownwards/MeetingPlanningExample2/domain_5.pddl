(define (domain integrated-meetup)
  (:requirements :strips :typing :negative-preconditions :adl :equality :action-costs)
  (:types location person slot)

  (:predicates
    (at ?person - person ?loc - location)
    (available ?person - person ?loc - location)
    (available-slot ?person - person ?loc - location ?s - slot)
    (next ?s - slot ?s2 - slot)
    (after6 ?s - slot ?s2 - slot)
    (time-at ?s - slot)
    (met ?person - person)
  )

  (:action visitor-travel
    :parameters (?p - person ?from - location ?to - location ?s ?snext - slot)
    :precondition (and (at ?p ?from) (time-at ?s) (next ?s ?snext) (not (= ?from ?to)))
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (time-at ?s))
      (time-at ?snext)
    )
    :cost 1
  )

  (:action visitor-wait
    :parameters (?s ?snext - slot)
    :precondition (and (time-at ?s) (next ?s ?snext))
    :effect (and
      (not (time-at ?s))
      (time-at ?snext)
    )
    :cost 1
  )

  (:action visitor-start-meeting
    :parameters (?p - person ?q - person ?loc - location
                 ?s0 ?s1 ?s2 ?s3 ?s4 ?s5 ?send - slot)
    :precondition (and
      (at ?p ?loc)
      (time-at ?s0)
      (available-slot ?q ?loc ?s0)
      (available-slot ?q ?loc ?s1)
      (available-slot ?q ?loc ?s2)
      (available-slot ?q ?loc ?s3)
      (available-slot ?q ?loc ?s4)
      (available-slot ?q ?loc ?s5)
      (next ?s0 ?s1) (next ?s1 ?s2) (next ?s2 ?s3)
      (next ?s3 ?s4) (next ?s4 ?s5)
      (after6 ?s0 ?send)
    )
    :effect (and
      (met ?q)
      (not (time-at ?s0))
      (time-at ?send)
    )
    :cost 1
  )
)