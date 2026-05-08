(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time level person)

  (:predicates
    (at_me ?l - location)
    (time_at ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (at_person ?p - person ?l - location ?t - time)
    (meeting_progress ?p - person ?m - level)
    (next_level ?m1 - level ?m2 - level)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
  )

  ;; Travel between locations at a specific time, consuming that time interval
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at_me ?from)
                       (time_at ?t1)
                       (next_time ?t1 ?t2)
                       (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at_me ?from))
                 (at_me ?to)
                 (not (time_at ?t1))
                 (time_at ?t2))
  )

  ;; Wait at the current location, consuming a time interval
  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (time_at ?t1)
                       (next_time ?t1 ?t2))
    :effect (and (not (time_at ?t1))
                 (time_at ?t2))
  )

  ;; Meet a person at a location, which consumes a time interval and increases meeting progress
  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time ?m1 - level ?m2 - level)
    :precondition (and (at_me ?l)
                       (at_person ?p ?l ?t1)
                       (time_at ?t1)
                       (next_time ?t1 ?t2)
                       (meeting_progress ?p ?m1)
                       (next_level ?m1 ?m2))
    :effect (and (not (time_at ?t1))
                 (time_at ?t2)
                 (not (meeting_progress ?p ?m1))
                 (meeting_progress ?p ?m2))
  )
)