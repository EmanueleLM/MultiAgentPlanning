(define (domain meet-orchestrator-classical)
  (:requirements :typing :strips :action-costs)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location)
    (at-time ?ag - agent ?t - time)
    (before ?t1 - time ?t2 - time)
    (travel_presidio_nb ?from - time ?to - time)
    (min_duration ?from - time ?to - time)
    (met)
  )

  (:functions (total_cost))

  (:action travel_presidio_to_north_beach
    :parameters (?a - agent ?from - time ?to - time)
    :precondition (and
      (at ?a presidio)
      (at-time ?a ?from)
      (travel_presidio_nb ?from ?to)
    )
    :effect (and
      (not (at-time ?a ?from))
      (at-time ?a ?to)
      (not (at ?a presidio))
      (at ?a north_beach)
      (increase (total_cost) 18)
    )
  )

  (:action advance_time
    :parameters (?a - agent ?from - time ?to - time)
    :precondition (and
      (at-time ?a ?from)
      (before ?from ?to)
    )
    :effect (and
      (not (at-time ?a ?from))
      (at-time ?a ?to)
    )
  )

  (:action meet_min75
    :parameters (?a - agent ?b - agent ?tstart - time ?tend - time)
    :precondition (and
      (at ?a north_beach)
      (at ?b north_beach)
      (at-time ?a ?tstart)
      (at-time ?b ?tstart)
      (at-time ?b ?tend)
      (min_duration ?tstart ?tend)
    )
    :effect (and
      (not (at-time ?a ?tstart))
      (at-time ?a ?tend)
      (met)
      (increase (total_cost) -75)
    )
  )
)