(define (problem schedule_gerald_roy_barbara)
  (:domain meeting_scheduler)
  (:objects
    gerald roy barbara - attendee
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )
  (:init
    ;; attendees
    (attendee gerald)
    (attendee roy)
    (attendee barbara)

    ;; Availabilities computed from given busy windows (30-minute slots)
    ;; Gerald (busy: 09:00, 13:00-14:00, 15:00-15:30, 16:00-17:00) -> free:
    (available gerald t_09_30)
    (available gerald t_10_00)
    (available gerald t_10_30)
    (available gerald t_11_00)
    (available gerald t_11_30)
    (available gerald t_12_00)
    (available gerald t_12_30)
    (available gerald t_14_00)
    (available gerald t_14_30)
    (available gerald t_15_30)

    ;; Roy (free entire day)
    (available roy t_09_00) (available roy t_09_30)
    (available roy t_10_00) (available roy t_10_30)
    (available roy t_11_00) (available roy t_11_30)
    (available roy t_12_00) (available roy t_12_30)
    (available roy t_13_00) (available roy t_13_30)
    (available roy t_14_00) (available roy t_14_30)
    (available roy t_15_00) (available roy t_15_30)
    (available roy t_16_00) (available roy t_16_30)

    ;; Barbara (busy: 09:30-10:00, 11:30-14:00, 14:30-15:00, 15:30-17:00) -> free:
    (available barbara t_09_00)
    (available barbara t_10_00)
    (available barbara t_10_30)
    (available barbara t_11_00)
    (available barbara t_14_00)
    (available barbara t_15_00)

    ;; Feasible timeslots are the intersection of all availabilities.
    ;; The auditor prefers slots at/after 13:00 to honor Gerald's preference if feasible.
    ;; The intersection yields: t_10_00, t_10_30, t_11_00, t_14_00.
    ;; To enforce the chosen recommended slot and make the single-step plan natural,
    ;; only t_14_00 is marked feasible here (14:00-14:30 meets all calendars and the preference).
    (feasible t_14_00)
  )
  (:goal (scheduled))
)