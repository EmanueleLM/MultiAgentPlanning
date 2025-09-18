(define (problem schedule-meeting-ray-bil-don)
  (:domain multiagent-meeting)

  (:objects
    raymond billy donald - agent
    s9 s10 s11 s14 - slot
  )

  (:init
    ;; Availability encoded as predicates (precomputed from private information)
    (available raymond s9)
    (available raymond s10)
    (available raymond s11)

    (available billy s10)
    (available billy s11)
    (available billy s14)

    (available donald s10)
    (available donald s11)

    ;; Preferences encoded as predicates (soft preferences via action costs)
    (preferred raymond s10)
    (preferred billy s10)
    (preferred donald s11)
  )

  (:goal (meeting-scheduled))

  (:metric minimize (total-cost))
)