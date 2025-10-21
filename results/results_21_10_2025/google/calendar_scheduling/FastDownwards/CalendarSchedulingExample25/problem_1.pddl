(define (problem meeting-scheduling-problem)
  (:domain meeting-schedule-domain)

  (:objects
    anthony pamela zachary - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; declare slots
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; consecutive slot relations (30-minute granularity)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; Participant availabilities (explicit per participant).
    ;; Availabilities are derived from each participant's private busy slots and Pamela's preference
    ;; (treated as a hard constraint: meeting must finish by 14:30, meaning start <= 13:30).

    ;; Anthony's free 30-min slots (busy: 09:30-10:00, 12:00-13:00, 16:00-16:30)
    (free anthony s0900)
    (free anthony s1000) (free anthony s1030)
    (free anthony s1100) (free anthony s1130)
    (free anthony s1300) (free anthony s1330)
    (free anthony s1400) (free anthony s1430)
    (free anthony s1500) (free anthony s1530)
    (free anthony s1630)

    ;; Pamela's free 30-min slots (busy: 09:30-10:00, 16:30-17:00; Preference: do not meet after 14:30 -> meeting must end by 14:30)
    ;; We encode the preference as a hard availability constraint: only slots that are within the acceptable window are marked free.
    (free pamela s0900)
    (free pamela s1000) (free pamela s1030)
    (free pamela s1100) (free pamela s1130)
    (free pamela s1200) (free pamela s1230)
    (free pamela s1300) (free pamela s1330)
    (free pamela s1400)

    ;; Zachary's free 30-min slots (busy: 09:00-11:30, 12:00-12:30, 13:00-13:30, 14:30-15:00, 16:00-17:00)
    (free zachary s1130)
    (free zachary s1230)
    (free zachary s1330) (free zachary s1400)
    (free zachary s1500) (free zachary s1530)
  )

  ;; Goal: schedule one 60-minute meeting (two consecutive slots) with all participants attending.
  ;; Note: The problem does NOT hardcode the chosen slot in the goal; the planner will select a scheduling action consistent with all availabilities.
  (:goal (and
    (meeting-scheduled)
    (attends anthony)
    (attends pamela)
    (attends zachary)
  ))
)