(define (problem MeetingPlanningExample16-select)
  (:domain schedule-selection)
  (:objects
    schedule_early105 schedule_full375 - schedule
  )

  (:init
    ;; Audited feasible schedules (compactly asserted)
    (feasible schedule_early105)
    (feasible schedule_full375)

    ;; Both schedules satisfy the contiguous-105 requirement (encoded once per schedule)
    (has-contiguous-105 schedule_early105)
    (has-contiguous-105 schedule_full375)

    ;; The audited schedule that maximizes continuous meeting duration is marked best.
    (best schedule_full375)

    ;; Choice is initially open.
    (choice-open)
  )

  ;; Goal: meeting executed AND the selected schedule is the audited best.
  (:goal (and (met-ronald) (selected schedule_full375)))
)