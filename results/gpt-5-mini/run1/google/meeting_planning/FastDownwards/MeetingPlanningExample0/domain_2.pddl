(define (domain meeting_planning)
  (:requirements :typing)
  (:types location time)
  (:predicates
    (at ?l - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_mm ?t1 - time ?t2 - time)
    (travel_mr ?t1 - time ?t2 - time)
    (meet_slot ?t1 - time ?t2 - time)
    (met)
  )

  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?loc ?t1) (next ?t1 ?t2))
    :effect (and (not (at ?loc ?t1)) (at ?loc ?t2))
  )

  (:action travel_marina_to_mission
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at marina ?t1) (travel_mm ?t1 ?t2))
    :effect (and (not (at marina ?t1)) (at mission ?t2))
  )

  (:action travel_mission_to_marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at mission ?t1) (travel_mr ?t1 ?t2))
    :effect (and (not (at mission ?t1)) (at marina ?t2))
  )

  (:action meet_stephanie_120
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at mission ?t1) (meet_slot ?t1 ?t2))
    :effect (and (met))
  )
)