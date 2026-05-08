(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (next ?t1 - time ?t2 - time)
    (is_free ?p - person ?t1 - time ?t2 - time)
    (scheduled)
  )

  ;; Action to schedule a 1-hour meeting (spanning two 30-minute slots)
  (:action schedule_1h_meeting
    :parameters (?t1 - time ?t2 - time ?t3 - time)
    :precondition (and
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      ;; Janet must be free in both segments
      (is_free janet ?t1 ?t2)
      (is_free janet ?t2 ?t3)
      ;; Rachel must be free in both segments
      (is_free rachel ?t1 ?t2)
      (is_free rachel ?t2 ?t3)
      ;; Cynthia must be free in both segments
      (is_free cynthia ?t1 ?t2)
      (is_free cynthia ?t2 ?t3)
    )
    :effect (scheduled)
  )
)