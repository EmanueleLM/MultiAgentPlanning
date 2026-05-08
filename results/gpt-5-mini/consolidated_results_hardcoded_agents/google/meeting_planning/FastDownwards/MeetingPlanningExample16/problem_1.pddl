(define (problem MeetingPlanningExample16-select)
  (:domain schedule-selection)
  (:objects
    schedule_early105 schedule_full375 - schedule
  )
  (:init
    ;; Audited feasible schedules
    (feasible schedule_early105)
    (feasible schedule_full375)

    ;; The audited schedule that maximizes continuous meeting duration is marked best.
    ;; schedule_full375 corresponds to meeting Ronald from 15:15 to 21:30 = 375 minutes.
    (best schedule_full375)

    ;; Choice is initially open.
    (choice-open)
  )
  ;; Goal: meeting executed AND the selected schedule is the audited best.
  (:goal (and (met-ronald) (selected schedule_full375)))
)