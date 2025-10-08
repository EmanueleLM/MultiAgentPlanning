(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    heather nicholas zachary - person

    s09-00 s09-30 s10-00 s10-30 s11-00 s11-30 s12-00 s12-30 s13-00 s13-30 - slot
  )

  (:init
    ;; Heather busy intervals (hard)
    (busy heather s09-00)
    (busy heather s10-30)
    (busy heather s13-00)
    (busy heather s13-30)
    (busy heather s14-30) ; noted though slot not part of schedule actions (after 14:00)

    (busy heather s16-00) ; noted though slot not part of schedule actions (after 14:00)

    ;; Nicholas: fully available (no busy facts)

    ;; Zachary busy intervals (hard)
    (busy zachary s09-00)
    (busy zachary s09-30)
    (busy zachary s10-00)
    (busy zachary s11-00)
    (busy zachary s11-30)
    (busy zachary s12-30)
    (busy zachary s13-30)
    (busy zachary s14-00) ; after-14:00 busy; included for clarity though slot not available
    (busy zachary s14-30)
    (busy zachary s15-00)
    (busy zachary s15-30)
    (busy zachary s16-00)

    ;; initial cost
    (= (total-cost) 0)
  )

  ;; Goal: schedule one meeting (30 minutes) satisfying all hard constraints.
  (:goal (meeting_scheduled))

  ;; Prefer the earliest feasible slot via minimizing total-cost
  (:metric minimize (total-cost))
)