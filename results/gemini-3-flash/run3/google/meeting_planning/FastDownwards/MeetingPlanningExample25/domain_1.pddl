(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time friend)
  (:predicates
    (at_location ?l - location)
    (cur_time ?t - time)
    (met ?f - friend)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_wait ?l - location ?t1 ?t2 - time)
    (friend_at ?f - friend ?l - location ?t1 ?t2 - time)
  )

  ;; Action to travel between two locations, progressing the current time.
  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at_location ?from) (cur_time ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and 
        (not (at_location ?from)) 
        (at_location ?to) 
        (not (cur_time ?t1)) 
        (cur_time ?t2)
    )
  )

  ;; Action to wait at a location until a specific time point.
  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_location ?l) (cur_time ?t1) (can_wait ?l ?t1 ?t2))
    :effect (and 
        (not (cur_time ?t1)) 
        (cur_time ?t2)
    )
  )

  ;; Action to meet a friend at a location for a specified time interval.
  ;; The friend must be at the location during the start and through the duration of the meeting.
  (:action meet
    :parameters (?f - friend ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at_location ?l) (cur_time ?t1) (friend_at ?f ?l ?t1 ?t2))
    :effect (and 
        (not (cur_time ?t1)) 
        (cur_time ?t2) 
        (met ?f)
    )
  )
)