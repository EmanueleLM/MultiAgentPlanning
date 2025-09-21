(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    raymond billy donald - agent
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 - slot
  )

  ;; Work hours are slot1..slot8 (e.g., 9:00-17:00 broken into hourly slots)
  (:init
    (work-slot slot1) (work-slot slot2) (work-slot slot3) (work-slot slot4)
    (work-slot slot5) (work-slot slot6) (work-slot slot7) (work-slot slot8)

    ;; Availability
    (available raymond slot2) (available raymond slot3) (available raymond slot4)
    (available billy  slot1) (available billy  slot3) (available billy  slot5)
    (available donald slot3) (available donald slot4) (available donald slot6)

    ;; Preferences (if possible, planner can pick a slot satisfying preferences)
    (preferred raymond slot3)
    (preferred billy  slot3)
    (preferred donald slot3)
  )

  ;; Goal: schedule a meeting in any work slot (scheduled implies attending by finalize-meeting)
  (:goal
    (or
      (scheduled slot1)
      (scheduled slot2)
      (scheduled slot3)
      (scheduled slot4)
      (scheduled slot5)
      (scheduled slot6)
      (scheduled slot7)
      (scheduled slot8)
    )
  )
)