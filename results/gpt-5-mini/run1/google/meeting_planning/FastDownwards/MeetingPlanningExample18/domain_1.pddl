(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types traveler friend loc time)

  (:predicates
    ;; time bookkeeping
    (current-time ?t - time)

    ;; simple location predicates for the two named roles (keeps typing explicit)
    (at_traveler ?l - loc)
    (at_betty ?l - loc)

    ;; explicit discrete duration relations used by actions (instance-specific pairs provided in the problem)
    (delta_wait ?t1 - time ?t2 - time)   ;; arbitrary wait/jump (used to reach a chosen departure time)
    (delta_m_to_r ?t1 - time ?t2 - time) ;; Marina -> Richmond travel (11 minutes)
    (delta_meet75 ?t1 - time ?t2 - time) ;; contiguous meeting of 75 minutes

    ;; Betty availability for a (start,end) meeting interval
    (available_betty ?t1 - time ?t2 - time)

    ;; goal marker
    (met_betty)
  )

  ;; Wait action: advance time along an explicitly provided delta_wait pair.
  (:action wait
    :parameters (?tstart - time ?tend - time)
    :precondition (and
      (current-time ?tstart)
      (delta_wait ?tstart ?tend)
    )
    :effect (and
      (not (current-time ?tstart))
      (current-time ?tend)
    )
  )

  ;; Travel action: traveler travels from Marina to Richmond taking exactly the preset delta (11 minutes).
  ;; This action is specific to traveler moving from marina to richmond and cannot be bound to Betty.
  (:action travel_marina_to_richmond
    :parameters (?tstart - time ?tend - time)
    :precondition (and
      (current-time ?tstart)
      (at_traveler marina)
      (delta_m_to_r ?tstart ?tend)
    )
    :effect (and
      (not (current-time ?tstart))
      (current-time ?tend)
      (not (at_traveler marina))
      (at_traveler richmond)
    )
  )

  ;; Meeting action: traveler meets Betty at Richmond for exactly 75 contiguous minutes.
  ;; Enforces that the whole meeting interval is inside Betty's availability.
  (:action meet_with_betty
    :parameters (?tstart - time ?tend - time)
    :precondition (and
      (current-time ?tstart)
      (at_traveler richmond)
      (at_betty richmond)
      (delta_meet75 ?tstart ?tend)
      (available_betty ?tstart ?tend)
      (not (met_betty))
    )
    :effect (and
      (not (current-time ?tstart))
      (current-time ?tend)
      (met_betty)
    )
  )
)