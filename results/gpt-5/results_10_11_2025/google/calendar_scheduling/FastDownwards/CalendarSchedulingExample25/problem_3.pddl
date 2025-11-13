(define (problem schedule-recommended-1330-1430-structured)
  (:domain meeting-scheduling-structured)
  (:objects
    anthony pamela zachary - participant
    s_1330_1430 - slot
    h_1330_1400 h_1400_1430 - tick
  )
  (:init
    (is-participant anthony)
    (is-participant pamela)
    (is-participant zachary)

    (is-slot s_1330_1430)

    (is-tick h_1330_1400)
    (is-tick h_1400_1430)

    ; discrete-time successor relation and work-hour compliance
    (next h_1330_1400 h_1400_1430)
    (within-work h_1330_1400)
    (within-work h_1400_1430)

    ; slot covers exactly two contiguous ticks and ends at 14:30
    (covers s_1330_1430 h_1330_1400)
    (covers s_1330_1430 h_1400_1430)
    (ends-at s_1330_1430 h_1400_1430)
    (ends-by-1430 h_1400_1430)

    ; audited recommendation
    (audited-recommended s_1330_1430)

    ; bind required attendees to this slot
    (attendee1 s_1330_1430 anthony)
    (attendee2 s_1330_1430 pamela)
    (attendee3 s_1330_1430 zachary)

    ; availability per 30-minute tick (inclusive start, exclusive end)
    (available-in anthony h_1330_1400)
    (available-in anthony h_1400_1430)

    (available-in pamela h_1330_1400)
    (available-in pamela h_1400_1430)

    (available-in zachary h_1330_1400)
    (available-in zachary h_1400_1430)
  )
  (:goal
    (and
      (scheduled)
    )
  )
)