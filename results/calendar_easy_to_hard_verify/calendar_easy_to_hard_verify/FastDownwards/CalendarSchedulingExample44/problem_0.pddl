(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    h09_00 h09_30 h10_00 h10_30 h11_00 h11_30 h12_00 h12_30
    h13_00 h13_30 h14_00 h14_30 h15_00 h15_30 h16_00 h16_30 - half
  )

  (:init
    ;; half-slot succession (30-minute steps)
    (next h09_00 h09_30)
    (next h09_30 h10_00)
    (next h10_00 h10_30)
    (next h10_30 h11_00)
    (next h11_00 h11_30)
    (next h11_30 h12_00)
    (next h12_00 h12_30)
    (next h12_30 h13_00)
    (next h13_00 h13_30)
    (next h13_30 h14_00)
    (next h14_00 h14_30)
    (next h14_30 h15_00)
    (next h15_00 h15_30)
    (next h15_30 h16_00)
    (next h16_00 h16_30)

    ;; free facts per participant (every half-slot not blocked by their busy intervals)
    ;; kayla busy: 09:00-10:00 (h09_00,h09_30), 14:30-15:00 (h14_30), 15:30-16:00 (h15_30)
    (free kayla h10_00) (free kayla h10_30) (free kayla h11_00) (free kayla h11_30)
    (free kayla h12_00) (free kayla h12_30) (free kayla h13_00) (free kayla h13_30)
    (free kayla h14_00) (free kayla h15_00) (free kayla h16_00) (free kayla h16_30)

    ;; sandra busy: 12:00-12:30 (h12_00), 14:00-15:00 (h14_00,h14_30), 16:30-17:00 (h16_30)
    (free sandra h09_00) (free sandra h09_30) (free sandra h10_00) (free sandra h10_30)
    (free sandra h11_00) (free sandra h11_30) (free sandra h12_30) (free sandra h13_00)
    (free sandra h13_30) (free sandra h15_00) (free sandra h15_30) (free sandra h16_00)

    ;; ryan busy: 09:30-10:30 (h09_30,h10_00), 11:00-11:30 (h11_00), 12:30-13:00 (h12_30)
    (free ryan h09_00) (free ryan h10_30) (free ryan h11_30) (free ryan h12_00)
    (free ryan h13_00) (free ryan h13_30) (free ryan h14_00) (free ryan h14_30)
    (free ryan h15_00) (free ryan h15_30) (free ryan h16_00) (free ryan h16_30)

    ;; kathleen: full day available 09:00-17:00 (all half-slots)
    (free kathleen h09_00) (free kathleen h09_30) (free kathleen h10_00) (free kathleen h10_30)
    (free kathleen h11_00) (free kathleen h11_30) (free kathleen h12_00) (free kathleen h12_30)
    (free kathleen h13_00) (free kathleen h13_30) (free kathleen h14_00) (free kathleen h14_30)
    (free kathleen h15_00) (free kathleen h15_30) (free kathleen h16_00) (free kathleen h16_30)

    ;; walter busy: 09:30-12:00 (h09_30,h10_00,h10_30,h11_00,h11_30), 14:00-14:30 (h14_00), 15:00-17:00 (h15_00,h15_30,h16_00,h16_30)
    (free walter h09_00) (free walter h12_00) (free walter h12_30)
    (free walter h13_00) (free walter h13_30) (free walter h14_30)

    ;; arthur busy: 09:00-11:00 (h09_00,h09_30,h10_00,h10_30), 11:30-12:00 (h11_30), 12:30-13:00 (h12_30), 14:00-15:00 (h14_00,h14_30)
    (free arthur h11_00) (free arthur h12_00) (free arthur h13_00) (free arthur h13_30)
    (free arthur h15_00) (free arthur h15_30) (free arthur h16_00) (free arthur h16_30)

    ;; heather busy: 10:00-11:30 (h10_00,h10_30,h11_00), 12:00-13:00 (h12_00,h12_30), 14:30-15:30 (h14_30,h15_00), 16:30-17:00 (h16_30)
    (free heather h09_00) (free heather h09_30) (free heather h11_30)
    (free heather h13_00) (free heather h13_30) (free heather h14_00)
    (free heather h15_30) (free heather h16_00)
  )

  ;; Goal: schedule the meeting at 13:00 (requires each participant to have an attended fact at h13_00;
  ;; the planner will apply attend actions per participant (which require free at h13_00 and h13_30),
  ;; then apply the schedule action to satisfy the goal.)
  (:goal (meeting-scheduled h13_00))
)