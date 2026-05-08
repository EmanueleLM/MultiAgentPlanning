(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (allowed-meeting ?t1 - time ?t2 - time)
    (met-kenneth)
  )

  ;; Wait: advance agent at same location from one timepoint to a later timepoint
  (:action wait
    :parameters (?ag - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?loc ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag ?loc ?t1))
      (at ?ag ?loc ?t2)
    )
  )

  ;; Travel actions: exactly 11-minute advance is modeled via specific succ facts in the problem.
  (:action travel-fw-to-nh
    :parameters (?ag - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag fishermans-wharf ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag fishermans-wharf ?t1))
      (at ?ag nob-hill ?t2)
    )
  )

  (:action travel-nh-to-fw
    :parameters (?ag - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag nob-hill ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag nob-hill ?t1))
      (at ?ag fishermans-wharf ?t2)
    )
  )

  ;; Schedule a meeting with Kenneth. Only allowed time intervals (which satisfy
  ;; Kenneth's availability and the minimum meeting length) are provided as allowed-meeting facts.
  ;; The action advances the agent's time to the meeting end and records that Kenneth was met.
  (:action schedule-meeting-kenneth
    :parameters (?ag - agent ?tstart - time ?tend - time)
    :precondition (and
      (at ?ag nob-hill ?tstart)
      (allowed-meeting ?tstart ?tend)
      (not (met-kenneth))
    )
    :effect (and
      (not (at ?ag nob-hill ?tstart))
      (at ?ag nob-hill ?tend)
      (met-kenneth)
    )
  )
)