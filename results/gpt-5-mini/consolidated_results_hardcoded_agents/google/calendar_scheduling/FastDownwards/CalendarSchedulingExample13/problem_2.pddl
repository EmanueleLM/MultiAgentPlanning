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

    ;; work-hour designation for all half-hour slots between 09:00 and 17:00
    (work-hour t_09_00) (work-hour t_09_30) (work-hour t_10_00) (work-hour t_10_30)
    (work-hour t_11_00) (work-hour t_11_30) (work-hour t_12_00) (work-hour t_12_30)
    (work-hour t_13_00) (work-hour t_13_30) (work-hour t_14_00) (work-hour t_14_30)
    (work-hour t_15_00) (work-hour t_15_30) (work-hour t_16_00) (work-hour t_16_30)

    ;; successor ordering of timeslots (explicit contiguous half-hour progression)
    (next t_09_00 t_09_30) (next t_09_30 t_10_00) (next t_10_00 t_10_30) (next t_10_30 t_11_00)
    (next t_11_00 t_11_30) (next t_11_30 t_12_00) (next t_12_00 t_12_30) (next t_12_30 t_13_00)
    (next t_13_00 t_13_30) (next t_13_30 t_14_00) (next t_14_00 t_14_30) (next t_14_30 t_15_00)
    (next t_15_00 t_15_30) (next t_15_30 t_16_00) (next t_16_00 t_16_30)

    ;; Availabilities derived from busy windows (half-hour slots are start-inclusive, end-exclusive)
    ;; Gerald busy: 09:00-09:30, 13:00-14:00 (13:00 & 13:30), 15:00-15:30, 16:00-17:00 (16:00 & 16:30)
    ;; Gerald free slots (within work hours) are explicitly listed:
    (available gerald t_09_30)
    (available gerald t_10_00) (available gerald t_10_30)
    (available gerald t_11_00) (available gerald t_11_30)
    (available gerald t_12_00) (available gerald t_12_30)
    (available gerald t_14_00) (available gerald t_14_30)
    (available gerald t_15_30)

    ;; Roy free entire day
    (available roy t_09_00) (available roy t_09_30)
    (available roy t_10_00) (available roy t_10_30)
    (available roy t_11_00) (available roy t_11_30)
    (available roy t_12_00) (available roy t_12_30)
    (available roy t_13_00) (available roy t_13_30)
    (available roy t_14_00) (available roy t_14_30)
    (available roy t_15_00) (available roy t_15_30)
    (available roy t_16_00) (available roy t_16_30)

    ;; Barbara busy: 09:30-10:00, 11:30-14:00 (11:30,12:00,12:30,13:00,13:30), 14:30-15:00, 15:30-17:00
    ;; Barbara free slots:
    (available barbara t_09_00)
    (available barbara t_10_00) (available barbara t_10_30)
    (available barbara t_11_00)
    (available barbara t_14_00) (available barbara t_15_00)

    ;; Feasible timeslots are the intersection of all attendees' availabilities.
    ;; Auditor preference: honor Gerald's "avoid before 13:00" as a hard constraint if a feasible post-13:00 slot exists.
    ;; Although several morning slots are common, a feasible slot after 13:00 exists (14:00-14:30), so only that slot is marked feasible.
    (feasible t_14_00)
  )
  (:goal (scheduled))
)