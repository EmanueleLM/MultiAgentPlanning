(define (domain meeting-orchestrator)
  (:requirements :typing)
  (:types person time)
  (:predicates
    (busy ?p - person ?t - time)
    (free ?t - time)
    (meeting_at ?start - time)
  )
  (:action schedule-meeting-0900
    :precondition (and
      (not (busy p1 t_0900)) (not (busy p1 t_0930))
      (not (busy p2 t_0900)) (not (busy p2 t_0930))
      (not (busy p3 t_0900)) (not (busy p3 t_0930))
      (not (busy p4 t_0900)) (not (busy p4 t_0930))
    )
    :effect (meeting_at t_0900)
  )

  (:action schedule-at-1130
    :precondition (and (free t_1130) (free t_1200)
                       (not (meeting_at t_1130)))
    :effect (and (meeting_at t_1130)
                 (not (free t_1130))
                 (not (free t_1200)))
  )

  (:action schedule-13_30
    :precondition (and (free s_13_30) (free s_14_00)
                       (not (meeting_at s_13_30)))
    :effect (and (meeting_at s_13_30)
                 (not (free s_13_30))
                 (not (free s_14_00)))
  )

  (:action schedule-15_00
    :precondition (and (free s_15_00) (free s_15_30)
                       (not (meeting_at s_15_00)))
    :effect (and (meeting_at s_15_00)
                 (not (free s_15_00))
                 (not (free s_15_30)))
  )
)