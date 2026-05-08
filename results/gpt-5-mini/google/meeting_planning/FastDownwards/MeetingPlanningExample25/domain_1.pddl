(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?p - agent ?loc - location ?t - time)
    (next ?t1 - time ?t2 - time)               ; immediate successor relation for stepping time
    (travel-edge ?t1 - time ?t2 - time)        ; explicit travel departure->arrival mappings (23 min)
    (meeting-allowed ?start - time ?end - time) ; pre-declared valid meeting intervals (>=105 min & within David's window)
    (meeting-done)
  )

  ;; step forward to the immediate next timepoint
  (:action wait
    :parameters (?who - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?who ?loc ?t1) (next ?t1 ?t2))
    :effect (and (at ?who ?loc ?t2) (not (at ?who ?loc ?t1)))
  )

  ;; travel when a specific travel-edge (departure->arrival) is available
  (:action travel
    :parameters (?who - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?who ?from ?t1) (travel-edge ?t1 ?t2))
    :effect (and (at ?who ?to ?t2) (not (at ?who ?from ?t1)))
  )

  ;; meeting requires the traveler to be at Chinatown at both endpoints and that the pair is allowed
  ;; (David's continuous presence/availability is encoded in meeting-allowed facts, so David need not be modeled as a timed 'at' fact)
  (:action meet-with-david
    :parameters (?start - time ?end - time)
    :precondition (and
                   (at traveler Chinatown ?start)
                   (at traveler Chinatown ?end)
                   (meeting-allowed ?start ?end)
                  )
    :effect (meeting-done)
  )
)