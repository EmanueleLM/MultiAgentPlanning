(define (domain meeting_planning)
  (:requirements :typing :negative-preconditions)
  (:types time location)

  (:predicates
    (current_time ?t - time)           ; the planner's current discrete timepoint
    (at ?l - location)                 ; current location (one of the location objects)
    (met_ronald)                       ; goal achieved: met Ronald for required contiguous block
    (can_travel_cr ?t1 - time ?t2 - time)   ; Chinatown -> Russian Hill allowed transition (discrete)
    (can_travel_rc ?t1 - time ?t2 - time)   ; Russian Hill -> Chinatown allowed transition (discrete)
    (can_wait ?t1 - time ?t2 - time)        ; discrete forward time step relation
    (can_meet ?ts - time ?te - time)        ; allowed contiguous meeting block (ts -> te)
  )

  ;; Travel from Chinatown to Russian Hill (takes an allowed discrete transition defined in problem)
  (:action travel_chinatown_to_russian_hill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (at chinatown) (can_travel_cr ?t1 ?t2))
    :effect (and
             (not (current_time ?t1)) (current_time ?t2)
             (not (at chinatown)) (at russian_hill))
  )

  ;; Travel from Russian Hill to Chinatown (takes an allowed discrete transition defined in problem)
  (:action travel_russian_hill_to_chinatown
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (at russian_hill) (can_travel_rc ?t1 ?t2))
    :effect (and
             (not (current_time ?t1)) (current_time ?t2)
             (not (at russian_hill)) (at chinatown))
  )

  ;; Wait one discrete step (advance current time by one allowed step, remain at same location)
  (:action wait_one_step
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (can_wait ?t1 ?t2))
    :effect (and
             (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Start and complete a contiguous meeting block with Ronald (atomic: advances from ts to te and sets met_ronald).
  ;; The problem explicitly enumerates allowed meeting start/end pairs so this enforces Ronald's availability and minimum duration.
  (:action meet_ronald
    :parameters (?ts - time ?te - time)
    :precondition (and (current_time ?ts) (at russian_hill) (can_meet ?ts ?te))
    :effect (and
             (not (current_time ?ts)) (current_time ?te)
             (met_ronald) (at russian_hill))
  )
)