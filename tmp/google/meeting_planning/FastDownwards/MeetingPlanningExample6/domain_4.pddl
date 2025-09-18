(define (domain combined-meeting)
  (:requirements :strips :typing :adl :action-costs)
  (:types agent location time)
  (:constants visitor kenneth - agent
              fishermans_wharf nob_hill - location)
  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (road ?from - location ?to - location)
    (succ1 ?t1 - time ?t2 - time)
    (succ11 ?t1 - time ?t2 - time)
    (succ90 ?t1 - time ?t2 - time)
    (start_allowed ?t - time)
    (met)
  )

  (:action travel-visitor
    :parameters (?from ?to - location ?t ?t2 - time)
    :precondition (and
      (at visitor ?from ?t)
      (road ?from ?to)
      (succ11 ?t ?t2)
    )
    :effect (and
      (at visitor ?to ?t2)
    )
    :cost 11
  )

  (:action travel-kenneth
    :parameters (?from ?to - location ?t ?t2 - time)
    :precondition (and
      (at kenneth ?from ?t)
      (road ?from ?to)
      (succ11 ?t ?t2)
    )
    :effect (and
      (at kenneth ?to ?t2)
    )
    :cost 11
  )

  (:action wait-visitor
    :parameters (?loc - location ?t ?t1 - time)
    :precondition (and
      (at visitor ?loc ?t)
      (succ1 ?t ?t1)
    )
    :effect (and
      (at visitor ?loc ?t1)
    )
    :cost 1
  )

  (:action wait-kenneth
    :parameters (?loc - location ?t ?t1 - time)
    :precondition (and
      (at kenneth ?loc ?t)
      (succ1 ?t ?t1)
    )
    :effect (and
      (at kenneth ?loc ?t1)
    )
    :cost 1
  )

  ;; Discretized meeting as an instantaneous start that requires a precomputed 90-minute successor interval.
  (:action start-meeting
    :parameters (?s ?e - time)
    :precondition (and
      (start_allowed ?s)
      (succ90 ?s ?e)
      (at visitor nob_hill ?s)
      (at kenneth nob_hill ?s)
    )
    :effect (and
      (met)
      (at visitor nob_hill ?e)
      (at kenneth nob_hill ?e)
    )
    :cost 0
  )
)