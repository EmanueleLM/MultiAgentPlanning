(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)

  (:objects
    michelle steven jerry - person
    meeting1 - meeting

    s-09-00 s-09-30 s-10-00 s-10-30 s-11-00 s-11-30 s-12-00 s-12-30
    s-13-00 s-13-30 s-14-00 s-14-30 s-15-00 s-15-30 s-16-00 s-16-30 - timeslot
  )

  (:init
    ;; explicit successor (ordering) relations for 30-minute granularity
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

    ;; michelle: busy 11:00-12:00 -> s-11-00 and s-11-30 busy; all other slots within work window are free
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

    ;; steven: busy 09:00-09:30 (s-09-00), 11:30-12:00 (s-11-30), 13:30-14:00 (s-13-30), 15:30-16:00 (s-15-30)
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

    ;; jerry: busy 09:00-09:30 (s-09-00), 10:00-11:00 (s-10-00,s-10-30),
    ;; 11:30-12:30 (s-11-30,s-12-00), 13:00-14:30 (s-13-00,s-13-30,s-14-00),
    ;; 15:30-16:00 (s-15-30), 16:30-17:00 (s-16-30)
    ;; remaining slots are explicitly free
    (free jerry s-09-30)
    (free jerry s-11-00)
    (free jerry s-12-30)
    (free jerry s-14-30)
    (free jerry s-15-00)
    (free jerry s-16-00)
  )

  ;; require that a meeting gets scheduled into two consecutive free slots for all participants
  (:goal (meeting-scheduled meeting1))
)