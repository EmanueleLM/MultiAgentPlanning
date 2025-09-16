(define (domain meeting-orchestrator)
  (:requirements :typing)
  (:types person time)
  (:predicates
    (busy ?p - person ?t - time)
    (free ?t - time)
    (meeting_at ?start - time)
  )
  (:constants
    p1 p2 p3 p4 - person
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230 t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - time
    s_13_30 s_14_00 s_15_00 s_15_30 - time
  )

  ;; Agent 1 (from agent 1's response)
  ;; Schedule a 60-minute meeting starting at 09:00-09:30 and 09:30-10:00
  (:action schedule-meeting-0900
    :precondition (and
      (not (busy p1 t_0900)) (not (busy p1 t_0930))
      (not (busy p2 t_0900)) (not (busy p2 t_0930))
      (not (busy p3 t_0900)) (not (busy p3 t_0930))
      (not (busy p4 t_0900)) (not (busy p4 t_0930))
    )
    :effect (meeting_at t_0900)
  )

  ;; Agent 3 (from agent 3's response)
  ;; Schedule a 60-minute meeting starting at 11:30-12:30
  (:action schedule-at-1130
    :precondition (and (free t_1130) (free t_1200)
                       (not (meeting_at t_1130)))
    :effect (and (meeting_at t_1130)
                 (not (free t_1130))
                 (not (free t_1200)))
  )

  ;; Agent 2 (from agent 2's response)
  ;; Schedule a 60-minute meeting starting at 13:30-14:30
  (:action schedule-13_30
    :precondition (and (free s_13_30) (free s_14_00)
                       (not (meeting_at s_13_30)))
    :effect (and (meeting_at s_13_30)
                 (not (free s_13_30))
                 (not (free s_14_00)))
  )

  ;; Agent 2 (alternate 60-minute slot)
  ;; Schedule a 60-minute meeting starting at 15:00-16:00
  (:action schedule-15_00
    :precondition (and (free s_15_00) (free s_15_30)
                       (not (meeting_at s_15_00)))
    :effect (and (meeting_at s_15_00)
                 (not (free s_15_00))
                 (not (free s_15_30)))
  )

  ;; Goal can be satisfied by any of the valid 60-min slots
  (:goal (or (meeting_at t_0900)
             (meeting_at t_1130)
             (meeting_at s_13_30)
             (meeting_at s_15_00)))
)