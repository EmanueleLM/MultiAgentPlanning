(define (problem schedule_meeting_on_monday)
  (:domain meeting_scheduling)
  (:objects
    jesse kathryn megan - participant
    9_00 9_30 10_00 10_30 11_00 11_30 12_00 12_30
    13_00 13_30 14_00 14_30 15_00 15_30 16_00 16_30 17_00 - time_slot
  )
  (:init
    (occupied jesse 10_00 10_30)
    (occupied jesse 15_30 16_00)
    (occupied megan 10_30 11_00)
    (occupied megan 11_30 12_30)
    (occupied megan 13_30 14_30)
    (occupied megan 15_00 16_30)

    (free jesse 9_00 9_30)
    (free jesse 9_30 10_00)
    (free jesse 16_30 17_00)

    (free kathryn 9_00 9_30)
    (free kathryn 9_30 10_00)
    (free kathryn 10_00 10_30)
    (free kathryn 10_30 11_00)
    (free kathryn 11_00 11_30)
    (free kathryn 11_30 12_00)
    (free kathryn 12_00 12_30)
    (free kathryn 12_30 13_00)
    (free kathryn 13_00 13_30)
    (free kathryn 13_30 14_00)
    (free kathryn 14_00 14_30)
    (free kathryn 14_30 15_00)
    (free kathryn 15_00 15_30)
    (free kathryn 15_30 16_00)
    (free kathryn 16_00 16_30)
    (free kathryn 16_30 17_00)

    (free megan 9_00 9_30)
    (free megan 9_30 10_00)
    (free megan 16_30 17_00)
  )
  (:goal (and (meeting_scheduled 16_30 17_00)))
)