(define (domain meeting-sf)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location time mstage tstage route)
  (:predicates
    (at ?l - location)
    (in_transit)
    (current_route ?r - route)
    (travel_stage ?s - tstage)
    (meeting_active)
    (meeting_stage ?m - mstage)
    (met_john)
    (now ?t - time)
    (next ?t1 - time ?t2 - time)
    (mnext ?m1 - mstage ?m2 - mstage)
    (snext ?s1 - tstage ?s2 - tstage)
    (avail_john ?t - time)
  )
  (:functions (total-cost))

  ;; Idle time progression (costs 1 per minute)
  (:action tick-idle
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (not (in_transit)) (not (meeting_active)))
    :effect (and (not (now ?t1)) (now ?t2) (increase (total-cost) 1))
  )

  ;; Start travel Bayview -> Russian Hill
  (:action start-travel-brh
    :parameters ()
    :precondition (and (at bayview) (not (in_transit)) (not (meeting_active)))
    :effect (and
      (not (at bayview))
      (in_transit)
      (current_route brh)
      (travel_stage s0)
    )
  )

  ;; Start travel Russian Hill -> Bayview
  (:action start-travel-rhb
    :parameters ()
    :precondition (and (at russian_hill) (not (in_transit)) (not (meeting_active)))
    :effect (and
      (not (at russian_hill))
      (in_transit)
      (current_route rhb)
      (travel_stage s0)
    )
  )

  ;; Generic travel progression by one minute along tstage chain
  (:action tick-travel-progress
    :parameters (?t1 - time ?t2 - time ?s1 - tstage ?s2 - tstage)
    :precondition (and (now ?t1) (next ?t1 ?t2) (in_transit) (travel_stage ?s1) (snext ?s1 ?s2))
    :effect (and
      (not (now ?t1)) (now ?t2)
      (not (travel_stage ?s1)) (travel_stage ?s2)
      (increase (total-cost) 1)
    )
  )

  ;; Finish travel Bayview -> Russian Hill at minute 23
  (:action finish-travel-brh
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (in_transit) (current_route brh) (travel_stage s22))
    :effect (and
      (not (now ?t1)) (now ?t2)
      (not (in_transit))
      (not (current_route brh))
      (not (travel_stage s22))
      (at russian_hill)
      (increase (total-cost) 1)
    )
  )

  ;; Finish travel Russian Hill -> Bayview at minute 23
  (:action finish-travel-rhb
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (in_transit) (current_route rhb) (travel_stage s22))
    :effect (and
      (not (now ?t1)) (now ?t2)
      (not (in_transit))
      (not (current_route rhb))
      (not (travel_stage s22))
      (at bayview)
      (increase (total-cost) 1)
    )
  )

  ;; Start meeting John (must be at Russian Hill and within availability)
  (:action start-meeting-john
    :parameters (?t - time)
    :precondition (and (at russian_hill) (not (in_transit)) (not (meeting_active)) (now ?t) (avail_john ?t))
    :effect (and (meeting_active) (meeting_stage m0))
  )

  ;; Progress meeting toward the 75-minute minimum (0..73 -> next)
  (:action tick-meeting-progress
    :parameters (?t1 - time ?t2 - time ?m1 - mstage ?m2 - mstage)
    :precondition (and (now ?t1) (next ?t1 ?t2) (meeting_active) (meeting_stage ?m1) (mnext ?m1 ?m2) (avail_john ?t1))
    :effect (and
      (not (now ?t1)) (now ?t2)
      (not (meeting_stage ?m1)) (meeting_stage ?m2)
      (increase (total-cost) 1)
    )
  )

  ;; Complete the minimum 75 minutes (m74 -> met_john)
  (:action tick-meeting-complete-min
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (meeting_active) (meeting_stage m74) (avail_john ?t1))
    :effect (and
      (not (now ?t1)) (now ?t2)
      (not (meeting_stage m74))
      (met_john)
      (increase (total-cost) 1)
    )
  )

  ;; Optionally continue meeting beyond the minimum while within availability
  (:action tick-meeting-beyond-min
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (next ?t1 ?t2) (meeting_active) (met_john) (avail_john ?t1))
    :effect (and (not (now ?t1)) (now ?t2) (increase (total-cost) 1))
  )

  ;; End the meeting any time after minimum met
  (:action end-meeting-john
    :parameters ()
    :precondition (and (meeting_active) (met_john))
    :effect (and (not (meeting_active)))
  )
)