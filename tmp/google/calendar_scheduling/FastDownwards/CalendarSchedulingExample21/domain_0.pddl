(define (domain integrated-meeting-scheduler)
  (:requirements :typing)
  (:types slot person)

  (:predicates
    (free-a ?t - slot)
    (available-a ?p - person ?t - slot)
    (consecutive-a ?t1 - slot ?t2 - slot)

    (free-bp ?p - person ?s - slot)
    (adjacent-b ?s1 - slot ?s2 - slot)

    (free-c ?t - slot)
    (adjacent-c ?s1 - slot ?s2 - slot)

    (meeting-scheduled)
  )

  ; Agent A (Bobby) action: two consecutive slots, Bobby must be free and available
  (:action a_schedule_meeting
    :parameters (?t1 - slot ?t2 - slot ?p - person)
    :precondition (and (free-a ?t1) (free-a ?t2)
                       (available-a ?p ?t1) (available-a ?p ?t2)
                       (consecutive-a ?t1 ?t2))
    :effect (and (not (free-a ?t1)) (not (free-a ?t2))
                 (meeting-scheduled))
  )

  ; Agent B (Scott) action: two consecutive slots, Scott must be free for both
  (:action b_schedule_meeting
    :parameters (?p - person ?s1 - slot ?s2 - slot)
    :precondition (and (free-bp ?p ?s1) (free-bp ?p ?s2) (adjacent-b ?s1 ?s2))
    :effect (and (not (free-bp ?p ?s1)) (not (free-bp ?p ?s2))
                 (meeting-scheduled))
  )

  ; Agent C (Kimberly) action: two consecutive slots, Kimberly must be free for both
  (:action c_schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and (free-c ?s1) (free-c ?s2) (adjacent-c ?s1 ?s2))
    :effect (and (not (free-c ?s1)) (not (free-c ?s2))
                 (meeting-scheduled))
  )
)