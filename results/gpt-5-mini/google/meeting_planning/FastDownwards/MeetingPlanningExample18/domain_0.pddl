(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent loc time)

  (:predicates
    (at ?ag - agent ?l - loc)
    (current-time ?t - time)
    (delta1 ?t1 - time ?t2 - time)
    (delta6 ?t1 - time ?t2 - time)    ; travel duration = 6 time-slots (30 minutes; slot = 5 minutes)
    (delta15 ?t1 - time ?t2 - time)   ; meeting duration = 15 time-slots (75 minutes)
    (available-betty ?t1 - time ?t2 - time)
    (met-traveler ?ag - agent)
  )

  ;; Travel action for the traveler from home to Betty's location.
  ;; Distinct action name to keep agent actions separate per instruction.
  (:action travel-traveler-home-to-betty
    :parameters (?tstart - time ?tend - time ?trav - agent ?from - loc ?to - loc)
    :precondition (and
      (current-time ?tstart)
      (at ?trav ?from)
      (delta6 ?tstart ?tend)
    )
    :effect (and
      (not (current-time ?tstart))
      (current-time ?tend)
      (not (at ?trav ?from))
      (at ?trav ?to)
    )
  )

  ;; Generic one-slot wait action to advance time by one slot (5 minutes).
  (:action wait-one-slot
    :parameters (?tstart - time ?tend - time)
    :precondition (and
      (current-time ?tstart)
      (delta1 ?tstart ?tend)
    )
    :effect (and
      (not (current-time ?tstart))
      (current-time ?tend)
    )
  )

  ;; Meeting action: the traveler meets Betty for exactly 15 slots (75 minutes).
  ;; Uses negative precondition to ensure we only record meeting once.
  (:action meet-with-betty
    :parameters (?tstart - time ?tend - time ?trav - agent ?loc - loc)
    :precondition (and
      (current-time ?tstart)
      (at ?trav ?loc)
      (delta15 ?tstart ?tend)
      (available-betty ?tstart ?tend)
      (not (met-traveler ?trav))
    )
    :effect (and
      (not (current-time ?tstart))
      (current-time ?tend)
      (met-traveler ?trav)
      ;; traveler remains at same location during meeting (no change needed)
    )
  )
)