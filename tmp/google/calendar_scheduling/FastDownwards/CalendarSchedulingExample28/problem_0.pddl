(define (problem schedule-brittany-emily-doris)
  (:domain meeting-orchestration)
  (:objects
    brittany emily doris - person

    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; current time starts at earliest work hour: 09:00
    (current s09_00)

    ;; ordering of timeslots (30-minute steps)
    (next s09_00 s09_30) (next s09_30 s10_00) (next s10_00 s10_30)
    (next s10_30 s11_00) (next s11_00 s11_30) (next s11_30 s12_00)
    (next s12_00 s12_30) (next s12_30 s13_00) (next s13_00 s13_30)
    (next s13_30 s14_00) (next s14_00 s14_30) (next s14_30 s15_00)
    (next s15_00 s15_30) (next s15_30 s16_00) (next s16_00 s16_30)

    ;; --- Merged availability facts from the three agents ---

    ;; Brittany: Agent 1 provided explicit free slots (busy at 13:00 and 16:00).
    ;; We mark Brittany available at all work slots except s13_00 and s16_00.
    (available brittany s09_00) (available brittany s09_30)
    (available brittany s10_00) (available brittany s10_30)
    (available brittany s11_00) (available brittany s11_30)
    (available brittany s12_00) (available brittany s12_30)
    (available brittany s13_30) (available brittany s14_00)
    (available brittany s14_30) (available brittany s15_00)
    (available brittany s15_30) (available brittany s16_30)

    ;; Emily: both Agent 1 and Agent 2 reported Emily free all work slots
    (available emily s09_00) (available emily s09_30)
    (available emily s10_00) (available emily s10_30)
    (available emily s11_00) (available emily s11_30)
    (available emily s12_00) (available emily s12_30)
    (available emily s13_00) (available emily s13_30)
    (available emily s14_00) (available emily s14_30)
    (available emily s15_00) (available emily s15_30)
    (available emily s16_00) (available emily s16_30)

    ;; Doris: Agent 3 provided explicit busy intervals (09:00-11:00, 11:30-14:30, 15:00-17:00).
    ;; From that information the only known available slot is 11:00-11:30.
    (available doris s11_00)
  )

  ;; Goal: schedule the 30-minute meeting for Brittany, Emily, and Doris at the earliest feasible slot
  ;; consistent with the merged information above. Given merged availability, the earliest feasible slot is s11_00.
  (:goal (and
    (meeting-scheduled)
    (scheduled s11_00)
    (attendee brittany s11_00)
    (attendee emily s11_00)
    (attendee doris s11_00)
  ))
)