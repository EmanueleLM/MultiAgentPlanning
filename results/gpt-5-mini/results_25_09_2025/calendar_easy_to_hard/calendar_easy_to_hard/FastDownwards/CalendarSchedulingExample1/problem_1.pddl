(define (problem find-common-meeting)
  (:domain multi-agent-meeting)

  (:objects
    raymond billy donald - agent
    9_10 10_11 11_12 13_14 14_15 15_16 16_17 - slot
  )

  (:init
    (in-work-hours 9_10)
    (in-work-hours 10_11)
    (in-work-hours 11_12)
    (in-work-hours 13_14)
    (in-work-hours 14_15)
    (in-work-hours 15_16)
    (in-work-hours 16_17)

    (available raymond 9_10)
    (available raymond 10_11)
    (available raymond 11_12)
    (available raymond 13_14)

    (available billy 10_11)
    (available billy 11_12)
    (available billy 13_14)
    (available billy 14_15)

    (available donald 11_12)
    (available donald 13_14)
    (available donald 14_15)
    (available donald 15_16)

    (preferred raymond 11_12)
    (preferred billy 13_14)
    (preferred donald 11_12)
  )

  (:goal
    (or
      (meeting-scheduled 9_10)
      (meeting-scheduled 10_11)
      (meeting-scheduled 11_12)
      (meeting-scheduled 13_14)
      (meeting-scheduled 14_15)
      (meeting-scheduled 15_16)
      (meeting-scheduled 16_17)
    )
  )

  (:metric minimize (total-cost))
)