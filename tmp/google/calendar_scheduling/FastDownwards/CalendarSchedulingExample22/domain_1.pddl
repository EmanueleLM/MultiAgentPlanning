(define (domain multi-agent-meeting)
  (:requirements :typing)
  (:types person time)

  (:constants p1 p2 p3 p4 - person
              t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time)

  (:predicates
     (free_theresa ?p - person ?t - time)
     (consecutive ?t1 - time ?t2 - time)
     (meeting_scheduled_theresa ?t1 - time ?t2 - time)
     (free_second ?t - time)
     (scheduled_second ?t - time)
     (busy ?p - person ?t - time)
     (meet_at ?t - time)
     (next ?t - time ?t2 - time)
  )

  (:action schedule-meeting-theresa
     :parameters (?t1 - time ?t2 - time)
     :precondition (and (consecutive ?t1 ?t2)
                        (free_theresa p1 ?t1) (free_theresa p1 ?t2)
                        (free_theresa p2 ?t1) (free_theresa p2 ?t2)
                        (free_theresa p3 ?t1) (free_theresa p3 ?t2)
                        (free_theresa p4 ?t1) (free_theresa p4 ?t2))
     :effect (meeting_scheduled_theresa ?t1 ?t2)
  )

  (:action schedule-meeting-second
     :parameters (?t - time)
     :precondition (free_second ?t)
     :effect (scheduled_second ?t)
  )

  (:action schedule-meeting-third
     :parameters (?t - time ?t2 - time)
     :precondition (and (not (meet_at ?t))
                        (next ?t ?t2)
                        (not (busy p1 ?t)) (not (busy p1 ?t2))
                        (not (busy p2 ?t)) (not (busy p2 ?t2))
                        (not (busy p3 ?t)) (not (busy p3 ?t2))
                        (not (busy p4 ?t)) (not (busy p4 ?t2)))
     :effect (meet_at ?t)
  )
)