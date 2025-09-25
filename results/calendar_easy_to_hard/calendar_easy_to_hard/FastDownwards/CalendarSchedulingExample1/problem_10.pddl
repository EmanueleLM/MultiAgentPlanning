(define (problem find-common-meeting)
  (:domain multi-agent-meeting)

  (:objects
    raymond billy donald - agent
    s9_10 s10_11 s11_12 s13_14 s14_15 s15_16 s16_17 - slot
  )

  (:init
    (in-work-hours s9_10)
    (in-work-hours s10_11)
    (in-work-hours s11_12)
    (in-work-hours s13_14)
    (in-work-hours s14_15)
    (in-work-hours s15_16)
    (in-work-hours s16_17)

    (available raymond s9_10)
    (available raymond s10_11)
    (available raymond s11_12)
    (available raymond s13_14)
    (available raymond s15_16)

    (available billy s10_11)
    (available billy s11_12)
    (available billy s13_14)
    (available billy s14_15)

    (available donald s11_12)
    (available donald s13_14)
    (available donald s14_15)
    (available donald s15_16)

    (preferred raymond s11_12)
    (preferred billy s13_14)
    (preferred donald s11_12)

    (free raymond)
    (free billy)
    (free donald)

    (meeting-open)
  )

  (:goal
    (or
      (meeting-scheduled s9_10)
      (meeting-scheduled s10_11)
      (meeting-scheduled s11_12)
      (meeting-scheduled s13_14)
      (meeting-scheduled s14_15)
      (meeting-scheduled s15_16)
      (meeting-scheduled s16_17)
    )
  )
)