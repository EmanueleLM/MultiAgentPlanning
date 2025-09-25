(define (domain combined-meet-john)
  (:requirements :typing :negative-preconditions :equality :action-costs)
  (:types location time)

  (:predicates
    (at_you ?l - location)
    (at_john ?l - location)
    (time_now ?t - time)
    (succ17 ?t1 ?t2 - time)
    (succ18 ?t1 ?t2 - time)
    (succ75 ?t1 ?t2 - time)
    (succ_jump ?t1 ?t2 - time)
    (john_start_ok ?t - time)
    (met)
  )

  (:action travel_richmond_to_north_agent1
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at_you richmond_district)
      (time_now ?t1)
      (succ17 ?t1 ?t2)
    )
    :effect (and
      (not (at_you richmond_district))
      (at_you north_beach)
      (not (time_now ?t1))
      (time_now ?t2)
    )
    :cost 17
  )

  (:action travel_rd_to_nb_agent2
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at_john richmond_district)
      (time_now ?t1)
      (succ17 ?t1 ?t2)
    )
    :effect (and
      (not (at_john richmond_district))
      (at_john north_beach)
      (not (time_now ?t1))
      (time_now ?t2)
    )
    :cost 17
  )

  (:action wait_jump
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (time_now ?t1)
      (succ_jump ?t1 ?t2)
    )
    :effect (and
      (not (time_now ?t1))
      (time_now ?t2)
    )
    :cost 0
  )

  (:action meet_john_both_agents
    :parameters (?tstart ?tend - time)
    :precondition (and
      (at_you north_beach)
      (at_john north_beach)
      (time_now ?tstart)
      (john_start_ok ?tstart)
      (succ75 ?tstart ?tend)
    )
    :effect (and
      (met)
      (not (time_now ?tstart))
      (time_now ?tend)
    )
    :cost 75
  )
)