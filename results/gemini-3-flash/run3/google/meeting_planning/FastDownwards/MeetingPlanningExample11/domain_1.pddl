(define (domain meeting_planning_domain)
  (:requirements :strips :typing)
  (:types location time friend)
  (:predicates
    (at ?l - location)
    (time ?t - time)
    (can_move ?from ?to - location ?t1 ?t2 - time)
    (next ?t1 ?t2 - time)
    (can_meet ?f - friend ?l - location ?t1 ?t2 - time)
    (has_met ?f - friend)
  )

  ;; Move action models travel between locations with a specific duration.
  ;; The travel time is encoded by the relationship between t1 and t2.
  (:action move
    :parameters (?l1 ?l2 - location ?t1 ?t2 - time)
    :precondition (and (at ?l1) (time ?t1) (can_move ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at ?l1)) (at ?l2) (not (time ?t1)) (time ?t2))
  )

  ;; Wait action models the passage of time without changing location.
  ;; It moves the state to the next discrete time point in the sequence.
  (:action wait
    :parameters (?t1 ?t2 - time)
    :precondition (and (time ?t1) (next ?t1 ?t2))
    :effect (and (not (time ?t1)) (time ?t2))
  )

  ;; Meet action models the meeting with a friend.
  ;; A valid meeting requires the user to be at the correct location and 
  ;; for the specified meeting duration (t1 to t2) to be within the friend's availability.
  (:action meet
    :parameters (?f - friend ?l - location ?t1 ?t2 - time)
    :precondition (and (at ?l) (time ?t1) (can_meet ?f ?l ?t1 ?t2))
    :effect (and (not (time ?t1)) (time ?t2) (has_met ?f))
  )
)