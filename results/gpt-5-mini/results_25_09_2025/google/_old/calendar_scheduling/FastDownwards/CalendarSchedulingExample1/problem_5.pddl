(define (problem schedule-meeting-ray-bil-don)
  (:domain multiagent-meeting)

  (:objects
    s9 s10 s11 s14 - slot
  )

  (:init
    (available raymond s9)
    (available raymond s10)
    (available raymond s11)

    (available billy s10)
    (available billy s11)
    (available billy s14)

    (available donald s10)
    (available donald s11)

    (preferred raymond s10)
    (preferred billy s10)
    (preferred donald s11)
  )

  (:goal (meeting-scheduled))

  (:metric minimize (total-cost))
)