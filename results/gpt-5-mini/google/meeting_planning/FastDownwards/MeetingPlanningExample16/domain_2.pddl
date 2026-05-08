(define (domain meeting_planning)
  (:requirements :typing :negative-preconditions)
  (:types time location)

  ;; Declare known location constants here so domain references are valid
  (:constants chinatown russian_hill - location)

  (:predicates
    (current_time ?t - time)           ; the planner's current discrete timepoint
    (at ?l - location)                 ; current location
    (met_ronald)                       ; goal achieved: met Ronald for required contiguous block
    (can_travel_cr ?t1 - time ?t2 - time)   ; Chinatown -> Russian Hill in fixed minutes
    (can_travel_rc ?t1 - time ?t2 - time)   ; Russian Hill -> Chinatown in fixed minutes
    (can_wait ?t1 - time ?t2 - time)        ; one-minute step relations
    (can_meet ?ts - time ?te - time)        ; allowed contiguous meeting block (ts -> te)
  )

  ;; Travel from Chinatown to Russian Hill (takes 7 minutes)
  (:action travel_chinatown_to_russian_hill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (at chinatown) (can_travel_cr ?t1 ?t2))
    :effect (and
             (not (current_time ?t1)) (current_time ?t2)
             (not (at chinatown)) (at russian_hill))
  )

  ;; Travel from Russian Hill to Chinatown (takes 9 minutes)
  (:action travel_russian_hill_to_chinatown
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (at russian_hill) (can_travel_rc ?t1 ?t2))
    :effect (and
             (not (current_time ?t1)) (current_time ?t2)
             (not (at russian_hill)) (at chinatown))
  )

  ;; Wait one minute (advance current time by one minute, remain at same location)
  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (can_wait ?t1 ?t2))
    :effect (and
             (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Start and complete a contiguous meeting of exactly the defined block length with Ronald.
  ;; This action is atomic with respect to the discrete timepoints: it advances from ts to te and sets met_ronald.
  (:action meet_ronald
    :parameters (?ts - time ?te - time)
    :precondition (and (current_time ?ts) (at russian_hill) (can_meet ?ts ?te))
    :effect (and
             (not (current_time ?ts)) (current_time ?te)
             (met_ronald) (at russian_hill))
  )
)