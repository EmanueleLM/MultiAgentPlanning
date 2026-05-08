(define (domain meeting_planning)
  (:requirements :typing)
  (:types location time)
  (:predicates
    (at ?l - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_mm ?t1 - time ?t2 - time)  ; marina -> mission travel edge (duration 20)
    (travel_mr ?t1 - time ?t2 - time)  ; mission -> marina travel edge (duration 19)
    (meet_slot ?t1 - time ?t2 - time)  ; a meeting slot of length 120 minutes starting at t1 ending at t2 inside Stephanie's availability
    (met)                               ; goal flag: traveler met Stephanie for required duration
  )

  ;; Wait at a location for one time step (propagates presence forward by one minute)
  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?loc ?t1) (next ?t1 ?t2))
    :effect (and (at ?loc ?t2))
  )

  ;; Travel from Marina to Mission: instantaneous action that makes the traveler present at the arrival time
  (:action travel_marina_to_mission
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at marina ?t1) (travel_mm ?t1 ?t2))
    :effect (and (at mission ?t2))
  )

  ;; Travel from Mission to Marina
  (:action travel_mission_to_marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at mission ?t1) (travel_mr ?t1 ?t2))
    :effect (and (at marina ?t2))
  )

  ;; Take a meeting slot of 120 minutes starting at ?t1 and ending at ?t2.
  ;; meet_slot predicates are precomputed in the problem to enforce availability window and minimum duration.
  (:action meet_stephanie_120
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at mission ?t1) (meet_slot ?t1 ?t2))
    :effect (and (met))
  )
)