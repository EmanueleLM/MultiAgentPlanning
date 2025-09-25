(define (problem schedule-meeting)
  (:domain meeting-domain)
  (:objects
    brittany emily doris - agent
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    ;; meeting not yet scheduled
    (unscheduled)

    ;; work hours (all 30-min slots between 09:00 and 17:00)
    (work s09_00) (work s09_30) (work s10_00) (work s10_30)
    (work s11_00) (work s11_30) (work s12_00) (work s12_30)
    (work s13_00) (work s13_30) (work s14_00) (work s14_30)
    (work s15_00) (work s15_30) (work s16_00) (work s16_30)

    ;; Emily: free all day (all slots)
    (free emily s09_00) (free emily s09_30) (free emily s10_00) (free emily s10_30)
    (free emily s11_00) (free emily s11_30) (free emily s12_00) (free emily s12_30)
    (free emily s13_00) (free emily s13_30) (free emily s14_00) (free emily s14_30)
    (free emily s15_00) (free emily s15_30) (free emily s16_00) (free emily s16_30)

    ;; Brittany: busy 13:00-13:30 and 16:00-16:30 -> not free at s13_00 and s16_00
    ;; therefore free at all other slots
    (free brittany s09_00) (free brittany s09_30) (free brittany s10_00) (free brittany s10_30)
    (free brittany s11_00) (free brittany s11_30) (free brittany s12_00) (free brittany s12_30)
    (free brittany s13_30) (free brittany s14_00) (free brittany s14_30)
    (free brittany s15_00) (free brittany s15_30) (free brittany s16_30)

    ;; Doris: busy 09:00-11:00, 11:30-14:30, 15:00-17:00
    ;; => free only at s11_00 and s14_30 within work hours
    (free doris s11_00)
    (free doris s14_30)
  )

  ;; Goal: schedule the 30-minute meeting at the earliest possible time.
  ;; Given the agents' availabilities above, the earliest slot when all are free is s11_00.
  (:goal (meeting-at s11_00))
)