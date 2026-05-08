(define (domain meeting_planning)
  (:requirements :typing :negative-preconditions)
  (:types time location)

  (:predicates
    (current_time ?t - time)
    (at ?l - location)
    (met_ronald)
    (can_travel_cr ?t1 - time ?t2 - time)   ; chinatown -> russian_hill in 7 minutes
    (can_travel_rc ?t1 - time ?t2 - time)   ; russian_hill -> chinatown in 9 minutes
    (can_wait ?t1 - time ?t2 - time)        ; one-minute wait t1 -> t2 where t2 = t1+1
    (can_meet ?ts - time ?te - time)        ; meeting block of exactly 105 minutes ts -> te
  )

  ;; Travel from Chinatown to Russian Hill (takes 7 minutes)
  (:action travel_chinatown_to_russian_hill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (at chinatown) (can_travel_cr ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (not (at chinatown)) (at russian_hill))
  )

  ;; Travel from Russian Hill to Chinatown (takes 9 minutes)
  (:action travel_russian_hill_to_chinatown
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (at russian_hill) (can_travel_rc ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (not (at russian_hill)) (at chinatown))
  )

  ;; Wait one minute (advance current time by one minute, stay at same location)
  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (can_wait ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Start a contiguous meeting of exactly 105 minutes with Ronald.
  ;; This action is atomic: it advances time from ts to te and marks the meeting as done.
  (:action meet_ronald
    :parameters (?ts - time ?te - time)
    :precondition (and (current_time ?ts) (at russian_hill) (can_meet ?ts ?te))
    :effect (and (not (current_time ?ts)) (current_time ?te) (met_ronald) (at russian_hill))
  )
)