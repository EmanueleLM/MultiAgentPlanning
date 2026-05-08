(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time)
  (:predicates
    (at ?l - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_mm ?t1 - time ?t2 - time)  ; marina -> mission (20 minutes)
    (travel_mr ?t1 - time ?t2 - time)  ; mission -> marina (19 minutes)
    (meet_slot ?t1 - time ?t2 - time)  ; allowed meeting start -> end
    (met)
  )

  ;; wait advances the current time by one step while staying at the same location
  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?loc ?t1) (next ?t1 ?t2))
    :effect (and (not (at ?loc ?t1)) (at ?loc ?t2))
  )

  ;; travel from marina to mission: instantaneous in symbolic timejump from t1 to t2
  (:action travel_marina_to_mission
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at marina ?t1) (travel_mm ?t1 ?t2))
    :effect (and (not (at marina ?t1)) (at mission ?t2))
  )

  ;; travel from mission to marina
  (:action travel_mission_to_marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at mission ?t1) (travel_mr ?t1 ?t2))
    :effect (and (not (at mission ?t1)) (at marina ?t2))
  )

  ;; meet action: requires being at mission at meeting start and advances time to meeting end,
  ;; guarantees the minimum meeting duration (120 minutes) and marks met.
  (:action meet_stephanie_120
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at mission ?t1) (meet_slot ?t1 ?t2))
    :effect (and (not (at mission ?t1)) (at mission ?t2) (met))
  )
)