(define (domain combined-meet-john)
  (:requirements :typing :negative-preconditions :equality :action-costs)
  (:types location time)

  (:predicates
    (at-you ?l - location)
    (at-john ?l - location)
    (time-now ?t - time)
    (succ17 ?t1 ?t2 - time)
    (succ18 ?t1 ?t2 - time)
    (succ75 ?t1 ?t2 - time)
    (succ-jump ?t1 ?t2 - time)
    (john-start-ok ?t - time)
    (met)
  )

  (:action travel_richmond_to_north_agent1
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at-you richmond-district)
      (time-now ?t1)
      (succ17 ?t1 ?t2)
    )
    :effect (and
      (not (at-you richmond-district))
      (at-you north-beach)
      (not (time-now ?t1))
      (time-now ?t2)
    )
    :cost 17
  )

  (:action travel_rd_to_nb_agent2
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at-john richmond-district)
      (time-now ?t1)
      (succ17 ?t1 ?t2)
    )
    :effect (and
      (not (at-john richmond-district))
      (at-john north-beach)
      (not (time-now ?t1))
      (time-now ?t2)
    )
    :cost 17
  )

  (:action wait_jump
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (time-now ?t1)
      (succ-jump ?t1 ?t2)
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
    )
    :cost 0
  )

  (:action meet_john_both_agents
    :parameters (?tstart ?tend - time)
    :precondition (and
      (at-you north-beach)
      (at-john north-beach)
      (time-now ?tstart)
      (john-start-ok ?tstart)
      (succ75 ?tstart ?tend)
    )
    :effect (and
      (met)
      (not (time-now ?tstart))
      (time-now ?tend)
    )
    :cost 75
  )
)