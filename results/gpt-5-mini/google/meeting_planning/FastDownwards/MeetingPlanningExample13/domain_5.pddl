(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location person time)

  (:predicates
    (at_time ?ag - agent ?loc - location ?t - time)
    (met ?p - person)
    (travel_time ?from - location ?to - location ?tfrom - time ?tto - time)
    (wait_time ?loc - location ?tfrom - time ?tto - time)
    (meeting_window ?loc - location ?tstart - time ?tend - time)
    (meeting_possible ?tstart - time ?tend - time)
  )

  (:action travel
    :parameters (?ag - agent ?from - location ?to - location ?tfrom - time ?tto - time)
    :precondition (and
      (at_time ?ag ?from ?tfrom)
      (travel_time ?from ?to ?tfrom ?tto)
    )
    :effect (and
      (not (at_time ?ag ?from ?tfrom))
      (at_time ?ag ?to ?tto)
    )
  )

  (:action wait
    :parameters (?ag - agent ?loc - location ?tfrom - time ?tto - time)
    :precondition (and
      (at_time ?ag ?loc ?tfrom)
      (wait_time ?loc ?tfrom ?tto)
    )
    :effect (and
      (not (at_time ?ag ?loc ?tfrom))
      (at_time ?ag ?loc ?tto)
    )
  )

  (:action meet_betty
    :parameters (?ag - agent ?p - person ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at_time ?ag ?loc ?tstart)
      (meeting_window ?loc ?tstart ?tend)
      (meeting_possible ?tstart ?tend)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (at_time ?ag ?loc ?tstart))
      (at_time ?ag ?loc ?tend)
    )
  )
)