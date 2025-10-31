(define (problem CalendarSchedulingExample46-problem)
  (:domain CalendarSchedulingExample46)
  (:objects
    alan michael michelle roy judy natalie brian - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    ;; Alan free slots
    (free alan s09_30)
    (free alan s10_30)
    (free alan s12_30)
    (free alan s13_00)
    (free alan s13_30)
    (free alan s14_30)
    (free alan s15_00)
    (free alan s15_30)
    (free alan s16_00)
    (free alan s16_30)

    ;; Michael free entire work day
    (free michael s09_00) (free michael s09_30) (free michael s10_00) (free michael s10_30)
    (free michael s11_00) (free michael s11_30) (free michael s12_00) (free michael s12_30)
    (free michael s13_00) (free michael s13_30) (free michael s14_00) (free michael s14_30)
    (free michael s15_00) (free michael s15_30) (free michael s16_00) (free michael s16_30)

    ;; Michelle free entire work day
    (free michelle s09_00) (free michelle s09_30) (free michelle s10_00) (free michelle s10_30)
    (free michelle s11_00) (free michelle s11_30) (free michelle s12_00) (free michelle s12_30)
    (free michelle s13_00) (free michelle s13_30) (free michelle s14_00) (free michelle s14_30)
    (free michelle s15_00) (free michelle s15_30) (free michelle s16_00) (free michelle s16_30)

    ;; Roy free slots (busy 09:30-10:00, 12:30-13:00, 13:30-14:30)
    (free roy s09_00)
    (free roy s10_00)
    (free roy s10_30)
    (free roy s11_00)
    (free roy s11_30)
    (free roy s12_00)
    (free roy s13_00)
    (free roy s14_30)
    (free roy s15_00)
    (free roy s15_30)
    (free roy s16_00)
    (free roy s16_30)

    ;; Judy free slots (only 10:30-11:00 and 15:30-16:00)
    (free judy s10_30)
    (free judy s15_30)

    ;; Natalie free slots (busy 09:00-09:30, 11:00-12:30, 13:00-17:00)
    (free natalie s09_30)
    (free natalie s10_00)
    (free natalie s10_30)
    (free natalie s12_30)

    ;; Brian free slots (busy 09:30-10:30, 11:00-12:00, 13:30-14:00, 14:30-15:00, 15:30-16:00, 16:30-17:00)
    (free brian s09_00)
    (free brian s10_30)
    (free brian s12_00)
    (free brian s12_30)
    (free brian s13_00)
    (free brian s14_00)
    (free brian s15_00)
    (free brian s16_00)
  )
  (:goal (meeting-scheduled))
)