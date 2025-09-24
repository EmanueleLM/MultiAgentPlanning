(define (domain orchestrated-meetings-classical)
  (:requirements :typing :negative-preconditions :equality :adl :action-costs)
  (:types agent location time)
  (:constants you agent2 - agent presidio north_beach - location)
  (:predicates
    (at ?a - agent ?l - location)
    (betty-at ?l - location)
    (met ?a - agent)
    (now ?t - time)
    (plus1 ?t1 - time ?t2 - time)
    (plus17 ?t1 - time ?t2 - time)
    (plus18 ?t1 - time ?t2 - time)
    (plus75 ?t1 - time ?t2 - time)
    (start_ok ?t - time)
  )
  (:action travel-you-presidio-to-north_beach
    :parameters (?t - time ?t2 - time)
    :precondition (and (at you presidio) (now ?t) (plus18 ?t ?t2))
    :effect (and
      (not (at you presidio))
      (at you north_beach)
      (not (now ?t))
      (now ?t2))
    :cost 0
  )
  (:action travel-you-north_beach-to-presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (at you north_beach) (now ?t) (plus17 ?t ?t2))
    :effect (and
      (not (at you north_beach))
      (at you presidio)
      (not (now ?t))
      (now ?t2))
    :cost 0
  )
  (:action travel-agent2-presidio-to-north_beach
    :parameters (?t - time ?t2 - time)
    :precondition (and (at agent2 presidio) (now ?t) (plus18 ?t ?t2))
    :effect (and
      (not (at agent2 presidio))
      (at agent2 north_beach)
      (not (now ?t))
      (now ?t2))
    :cost 0
  )
  (:action travel-agent2-north_beach-to-presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (at agent2 north_beach) (now ?t) (plus17 ?t ?t2))
    :effect (and
      (not (at agent2 north_beach))
      (at agent2 presidio)
      (not (now ?t))
      (now ?t2))
    :cost 0
  )
  (:action wait-you-1min
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and (at you ?l) (now ?t) (plus1 ?t ?t2))
    :effect (and
      (not (now ?t))
      (now ?t2))
    :cost 0
  )
  (:action wait-agent2-1min
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and (at agent2 ?l) (now ?t) (plus1 ?t ?t2))
    :effect (and
      (not (now ?t))
      (now ?t2))
    :cost 0
  )
  (:action meet-you
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (at you ?l)
      (betty-at ?l)
      (now ?t)
      (start_ok ?t)
      (plus75 ?t ?t2)
      (not (met you)))
    :effect (and
      (met you)
      (not (now ?t))
      (now ?t2))
    :cost -1
  )
  (:action meet-agent2
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (at agent2 ?l)
      (betty-at ?l)
      (now ?t)
      (start_ok ?t)
      (plus75 ?t ?t2)
      (not (met agent2)))
    :effect (and
      (met agent2)
      (not (now ?t))
      (now ?t2))
    :cost -1
  )
)