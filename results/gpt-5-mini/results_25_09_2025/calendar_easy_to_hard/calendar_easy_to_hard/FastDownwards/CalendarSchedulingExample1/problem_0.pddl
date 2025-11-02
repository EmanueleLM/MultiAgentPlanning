(define (problem find-common-meeting)
  (:domain multi-agent-meeting)

  (:objects
    raymond billy donald - agent
    9_10 10_11 11_12 13_14 14_15 15_16 16_17 - slot
  )

  (:init
    ;; Work-hour slots are defined as objects above. Availabilities:
    ;; Raymond is available in the morning and early afternoon
    (available raymond 9_10)
    (available raymond 10_11)
    (available raymond 11_12)
    (available raymond 13_14)

    ;; Billy is available mid-morning through mid-afternoon
    (available billy 10_11)
    (available billy 11_12)
    (available billy 13_14)
    (available billy 14_15)

    ;; Donald is available late morning through mid-afternoon
    (available donald 11_12)
    (available donald 13_14)
    (available donald 14_15)
    (available donald 15_16)

    ;; Preferences (softly preferred slots for each agent)
    ;; Raymond prefers 11-12
    (preferred raymond 11_12)

    ;; Billy prefers 13-14
    (preferred billy 13_14)

    ;; Donald prefers 11-12
    (preferred donald 11_12)

    ;; initial score
    (= (score) 0)
  )

  ;; The goal: find any slot during which the meeting is scheduled.
  ;; Using an OR over all defined work slots; the planner will pick one.
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

  ;; Try to maximize the number of satisfied preferences (score).
  (:metric maximize (score))
)