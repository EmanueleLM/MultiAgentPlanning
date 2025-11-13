(define (problem schedule-recommended-1330-1430)
  (:domain meeting-scheduling)
  (:objects
    anthony pamela zachary - participant
    s_1330_1430 - slot
  )
  (:init
    (is-participant anthony)
    (is-participant pamela)
    (is-participant zachary)

    (is-slot s_1330_1430)

    (within-work-hours s_1330_1430)
    (duration-60 s_1330_1430)
    (ends-by-1430 s_1330_1430)
    (audited-recommended s_1330_1430)

    (available anthony s_1330_1430)
    (available pamela s_1330_1430)
    (available zachary s_1330_1430)

    (all-required-available s_1330_1430)
  )
  (:goal
    (and
      (scheduled)
    )
  )
)