(define (domain combined-meet-john)
  (:requirements :typing :negative-preconditions :equality :adl :action-costs)
  (:types location time)

  (:predicates
    (at-you ?l - location)
    (at-john ?l - location)
    (time-now ?t - time)
    (succ1 ?t1 ?t2 - time)
    (succ17 ?t1 ?t2 - time)
    (succ18 ?t1 ?t2 - time)
    (succ75 ?t1 ?t2 - time)
    (john-start-ok ?t - time)
    (met)
  )

  ;; Agent "you" travels Richmond District -> North Beach (17 minutes)
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

  ;; Agent "you" travels North Beach -> Richmond District (18 minutes)
  (:action travel_north_to_richmond_agent1
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at-you north-beach)
      (time-now ?t1)
      (succ18 ?t1 ?t2)
    )
    :effect (and
      (not (at-you north-beach))
      (at-you richmond-district)
      (not (time-now ?t1))
      (time-now ?t2)
    )
    :cost 18
  )

  ;; Agent "you" wait 1 minute
  (:action wait_agent1
    :parameters (?t1 ?t2 - time ?l - location)
    :precondition (and
      (at-you ?l)
      (time-now ?t1)
      (succ1 ?t1 ?t2)
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
    )
    :cost 1
  )

  ;; Agent "john" travels Richmond District -> North Beach (17 minutes)
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

  ;; Agent "john" travels North Beach -> Richmond District (18 minutes)
  (:action travel_nb_to_rd_agent2
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at-john north-beach)
      (time-now ?t1)
      (succ18 ?t1 ?t2)
    )
    :effect (and
      (not (at-john north-beach))
      (at-john richmond-district)
      (not (time-now ?t1))
      (time-now ?t2)
    )
    :cost 18
  )

  ;; Agent "john" wait 1 minute
  (:action wait_agent2
    :parameters (?t1 ?t2 - time ?l - location)
    :precondition (and
      (at-john ?l)
      (time-now ?t1)
      (succ1 ?t1 ?t2)
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
    )
    :cost 1
  )

  ;; Joint meeting action: both agents at north-beach, meeting lasts 75 minutes.
  ;; Meeting must start at a precomputed allowed start time (john-start-ok).
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