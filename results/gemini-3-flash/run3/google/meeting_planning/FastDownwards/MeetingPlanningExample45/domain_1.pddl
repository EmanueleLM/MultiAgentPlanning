(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time_point person)
  (:predicates
    (at_me ?l - location)
    (current_time ?t - time_point)
    (next ?t1 ?t2 - time_point)
    (can_travel ?from ?to - location ?t1 ?t2 - time_point)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time_point)
    (met ?p - person)
  )

  ;; Travel from one location to another, consuming the time specified.
  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time_point)
    :precondition (and (at_me ?from) (current_time ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at_me ?from)) (at_me ?to) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Wait at the current location to move to a future time point.
  (:action wait
    :parameters (?t1 ?t2 - time_point)
    :precondition (and (current_time ?t1) (next ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Meet a person at a location during a specific time interval.
  ;; The duration of the meeting is represented by the interval [t1, t2].
  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time_point)
    :precondition (and (at_me ?l) (current_time ?t1) (can_meet ?p ?l ?t1 ?t2))
    :effect (and (met ?p) (not (current_time ?t1)) (current_time ?t2))
  )
)