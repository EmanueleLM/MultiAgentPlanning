(define (domain multi-agent-meeting)
  (:requirements :typing)
  (:types person time)

  ; Participants (as in the three agents)
  (:constants p1 p2 p3 p4 - person
              t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time)

  ; Predicates
  (:predicates
    ; Theresa-like constraints (availability of each person)
    (free_theresa ?p - person ?t - time)
    (consecutive ?t1 - time ?t2 - time)
    (meeting_scheduled_theresa ?t1 - time ?t2 - time)

    ; Second agent constraints (free time slots for the 60-min window)
    (free_second ?t - time)
    (scheduled_second ?t - time)

    ; Third agent constraints (busy times; 60-min window via next)
    (busy ?p - person ?t - time)
    (meet_at ?t - time)
    (next ?t - time ?t2 - time)
  )

  ; Actions: keep per-agent actions distinct

  ; Theresa-like action: schedule a 60-minute window that uses two consecutive 30-minute slots
  (:action schedule-meeting-theresa
     :parameters (?t1 - time ?t2 - time)
     :precondition (and
       (consecutive ?t1 ?t2)
       (free_theresa p1 ?t1) (free_theresa p1 ?t2)
       (free_theresa p2 ?t1) (free_theresa p2 ?t2)
       (free_theresa p3 ?t1) (free_theresa p3 ?t2)
       (free_theresa p4 ?t1) (free_theresa p4 ?t2)
     )
     :effect (meeting_scheduled_theresa ?t1 ?t2)
  )

  ; Second agent-like action: schedule a 60-minute window at a single start time (per its model)
  (:action schedule-meeting-second
     :parameters (?t - time)
     :precondition (free_second ?t)
     :effect (scheduled_second ?t)
  )

  ; Third agent-like action: schedule a 60-minute window starting at some time t, requiring a valid next slot and no busy predicates
  (:action schedule-meeting-third
     :parameters (?t - time)
     :precondition (and (not (meet_at ?t))
                        (next ?t ?t2)
                        (not (busy p1 ?t)) (not (busy p1 ?t2))
                        (not (busy p2 ?t)) (not (busy p2 ?t2))
                        (not (busy p3 ?t)) (not (busy p3 ?t2))
                        (not (busy p4 ?t)) (not (busy p4 ?t2)))
     :effect (meet_at ?t)
  )
)