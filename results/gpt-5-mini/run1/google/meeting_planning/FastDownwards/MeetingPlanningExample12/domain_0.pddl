(define (domain schedule-meetings)
  (:requirements :strips :typing :negative-preconditions)
  (:types timepoint location person)

  (:predicates
    (current-time ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (allowed-travel-interval ?t1 - timepoint ?t2 - timepoint)
    (allowed-meeting-interval ?t1 - timepoint ?t2 - timepoint)
    (at ?p - person ?l - location ?t - timepoint)
    (met ?p - person)
  )

  ;; Travel from one location to another occupying a forward time interval.
  ;; Enforces sequence by requiring current-time to equal the travel start.
  (:action travel
    :parameters (?actor - person ?from - location ?to - location ?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (current-time ?tstart)
      (at ?actor ?from ?tstart)
      (allowed-travel-interval ?tstart ?tend)
      (not (met ?actor)) ;; travel only meaningful before finishing relevant meetings; prevents trivial reenactments
    )
    :effect (and
      (not (current-time ?tstart))
      (current-time ?tend)
      (not (at ?actor ?from ?tstart))
      (at ?actor ?to ?tend)
    )
  )

  ;; Meet a friend: requires actor and friend present at same location at both start and end of a contiguous allowed slot.
  ;; Meeting interval must be one of the allowed meeting intervals (precomputed in the problem).
  ;; Meeting action advances current-time from start to end and records that the friend has been met.
  (:action meet
    :parameters (?actor - person ?friend - person ?loc - location ?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (current-time ?tstart)
      (at ?actor ?loc ?tstart)
      (at ?friend ?loc ?tstart)
      (at ?friend ?loc ?tend)
      (allowed-meeting-interval ?tstart ?tend)
      (not (met ?friend))
    )
    :effect (and
      (not (current-time ?tstart))
      (current-time ?tend)
      (met ?friend)
    )
  )
)