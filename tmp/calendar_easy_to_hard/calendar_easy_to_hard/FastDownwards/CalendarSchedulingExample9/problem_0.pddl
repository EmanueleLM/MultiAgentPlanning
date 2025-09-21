(define (problem schedule-diane-deborah-monday)
  (:domain meeting-scheduling-integrated)

  (:objects
    ;; Persons (mapped/merged names from the three agents so Diane Kelly is a single entity)
    diane_kelly deborah - person

    ;; Timeslots: Monday 09:00-17:00, 30-minute increments
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot

    ;; Agent2 meeting object
    meeting1 - meeting
  )

  (:init
    ;; Work hours (all timeslots are within Monday 09:00-17:00)
    (within-work-hours t0900) (within-work-hours t0930) (within-work-hours t1000)
    (within-work-hours t1030) (within-work-hours t1100) (within-work-hours t1130)
    (within-work-hours t1200) (within-work-hours t1230) (within-work-hours t1300)
    (within-work-hours t1330) (within-work-hours t1400) (within-work-hours t1430)
    (within-work-hours t1500) (within-work-hours t1530) (within-work-hours t1600)
    (within-work-hours t1630)

    ;; ---- Integrated availability (resolved name mismatches and combined information) ----
    ;; Rule used for integration: a timeslot is considered free for a person only where
    ;; the agents' provided availability information (after mapping names) supports it.
    ;; (This preserves busy constraints provided by any agent.)

    ;; Diane Kelly -- availability derived primarily from Agent1's explicit available slots
    ;; (Agent2 and Agent3 had Diane free on all slots; Agent1 declared several busy by omission,
    ;; so we adopt Agent1's more constrained availability for Diane).
    (free diane_kelly t0930)
    (free diane_kelly t1000) (free diane_kelly t1030)
    (free diane_kelly t1100) (free diane_kelly t1130)
    (free diane_kelly t1230) (free diane_kelly t1300)
    (free diane_kelly t1330) (free diane_kelly t1400)
    (free diane_kelly t1530) (free diane_kelly t1600) (free diane_kelly t1630)

    ;; Deborah -- Agent3 provided explicit busy information except two free slots.
    ;; Agent1 and Agent2 listed Deborah as free broadly; taking the conservative intersection,
    ;; Deborah is considered free only at the slots Agent3 explicitly marked free:
    (free deborah t0930)
    (free deborah t1400)

    ;; Agent2 meeting object (used by agent2-schedule action)
    (meeting meeting1)
  )

  ;; Goal: produce a confirmed meeting for Diane Kelly and Deborah (30-minute slot)
  (:goal (meeting-confirmed))
)