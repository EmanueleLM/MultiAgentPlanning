(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types traveler friend loc time)

  (:predicates
    ;; current timepoint marker
    (current_time ?t - time)

    ;; locations of agents
    (at_traveler ?l - loc)
    (at_betty ?l - loc)

    ;; instance-specific discrete time transitions
    (delta_wait ?t1 - time ?t2 - time)        ;; allowed wait/advance from t1 to t2
    (delta_travel ?from - loc ?to - loc ?t1 - time ?t2 - time) ;; travel from->to between times
    (delta_meet75 ?t1 - time ?t2 - time)      ;; contiguous 75-minute meeting interval

    ;; betty's availability interval(s)
    (available_betty ?t1 - time ?t2 - time)

    ;; goal marker
    (met_betty)
  )

  ;; wait/idle action: advance current time using an explicitly provided delta_wait pair
  (:action wait
    :parameters (?tstart - time ?tend - time)
    :precondition (and
      (current_time ?tstart)
      (delta_wait ?tstart ?tend)
    )
    :effect (and
      (not (current_time ?tstart))
      (current_time ?tend)
    )
  )

  ;; travel action: traveler moves from one location to another using a provided delta_travel tuple
  (:action travel
    :parameters (?from - loc ?to - loc ?tstart - time ?tend - time)
    :precondition (and
      (current_time ?tstart)
      (at_traveler ?from)
      (delta_travel ?from ?to ?tstart ?tend)
    )
    :effect (and
      (not (current_time ?tstart))
      (current_time ?tend)
      (not (at_traveler ?from))
      (at_traveler ?to)
    )
  )

  ;; meeting action: traveler meets betty at a location for exactly the 75-minute delta_meet75 interval
  ;; enforces that the meeting interval is within betty's declared availability
  (:action meet_with_betty
    :parameters (?loc - loc ?tstart - time ?tend - time)
    :precondition (and
      (current_time ?tstart)
      (at_traveler ?loc)
      (at_betty ?loc)
      (delta_meet75 ?tstart ?tend)
      (available_betty ?tstart ?tend)
      (not (met_betty))
    )
    :effect (and
      (not (current_time ?tstart))
      (current_time ?tend)
      (met_betty)
    )
  )
)