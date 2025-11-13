(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)

  (:objects
    michelle steven jerry - person
    meeting1 - meeting

    s-09-00 s-09-30 s-10-00 s-10-30 s-11-00 s-11-30 s-12-00 s-12-30
    s-13-00 s-13-30 s-14-00 s-14-30 s-15-00 s-15-30 s-16-00 s-16-30 - timeslot
  )

  (:init
    (consecutive s-09-00 s-09-30)
    (consecutive s-09-30 s-10-00)
    (consecutive s-10-00 s-10-30)
    (consecutive s-10-30 s-11-00)
    (consecutive s-11-00 s-11-30)
    (consecutive s-11-30 s-12-00)
    (consecutive s-12-00 s-12-30)
    (consecutive s-12-30 s-13-00)
    (consecutive s-13-00 s-13-30)
    (consecutive s-13-30 s-14-00)
    (consecutive s-14-00 s-14-30)
    (consecutive s-14-30 s-15-00)
    (consecutive s-15-00 s-15-30)
    (consecutive s-15-30 s-16-00)
    (consecutive s-16-00 s-16-30)

    (free michelle s-09-00)
    (free michelle s-09-30)
    (free michelle s-10-00)
    (free michelle s-10-30)
    (free michelle s-12-00)
    (free michelle s-12-30)
    (free michelle s-13-00)
    (free michelle s-13-30)
    (free michelle s-14-00)
    (free michelle s-14-30)
    (free michelle s-15-00)
    (free michelle s-15-30)
    (free michelle s-16-00)
    (free michelle s-16-30)

    (free steven s-09-30)
    (free steven s-10-00)
    (free steven s-10-30)
    (free steven s-11-00)
    (free steven s-12-00)
    (free steven s-12-30)
    (free steven s-13-00)
    (free steven s-14-00)
    (free steven s-14-30)
    (free steven s-15-00)
    (free steven s-16-00)
    (free steven s-16-30)

    (free jerry s-09-30)
    (free jerry s-11-00)
    (free jerry s-12-30)
    (free jerry s-14-30)
    (free jerry s-15-00)
    (free jerry s-16-00)
  )

  (:goal (meeting-scheduled meeting1))
)