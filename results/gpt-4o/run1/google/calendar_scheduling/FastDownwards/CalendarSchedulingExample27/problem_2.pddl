(define (problem schedule_meeting_on_monday)
  (:domain meeting_scheduling)
  (:objects
    jesse kathryn megan - participant
    9_00 9_30 10_00 10_30 11_00 11_30 12_00 12_30
    13_00 13_30 14_00 14_30 15_00 15_30 16_00 16_30 17_00 - time_slot
  )
  (:init
    (busy jesse 10_00 10_30)
    (busy jesse 15_30 16_00)
    (busy megan 10_30 11_00)
    (busy megan 11_30 12_30)
    (busy megan 13_30 14_30)
    (busy megan 15_00 16_30)

    (available jesse 9_00 9_30)
    (available jesse 9_30 10_00)
    (available jesse 16_30 17_00)

    (available kathryn 9_00 9_30)
    (available kathryn 9_30 10_00)
    (available kathryn 10_00 10_30)
    (available kathryn 10_30 11_00)
    (available kathryn 11_00 11_30)
    (available kathryn 11_30 12_00)
    (available kathryn 12_00 12_30)
    (available kathryn 12_30 13_00)
    (available kathryn 13_00 13_30)
    (available kathryn 13_30 14_00)
    (available kathryn 14_00 14_30)
    (available kathryn 14_30 15_00)
    (available kathryn 15_00 15_30)
    (available kathryn 15_30 16_00)
    (available kathryn 16_00 16_30)
    (available kathryn 16_30 17_00)

    (available megan 9_00 9_30)
    (available megan 9_30 10_00)
    (available megan 16_30 17_00)
  )
  (:goal (meeting_scheduled))
)