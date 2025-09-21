(define (problem schedule-monday)
  (:domain meeting-scheduler)
  (:objects
    ts-09-00 ts-09-30 ts-10-00 ts-10-30 ts-11-00 ts-11-30 ts-12-00 ts-12-30
    ts-13-00 ts-13-30 ts-14-00 ts-14-30 ts-15-00 ts-15-30 ts-16-00 ts-16-30 - timeslot
    m1 - meeting
    Alan Mason Dennis Theresa Brenda Juan Angela - person
  )
  (:init
    (participant Alan m1)
    (participant Mason m1)
    (participant Dennis m1)
    (participant Theresa m1)
    (participant Brenda m1)
    (participant Juan m1)
    (participant Angela m1)

    (busy Alan ts-09-00)
    (busy Alan ts-10-00)
    (busy Alan ts-10-30)
    (busy Alan ts-11-30)

    (busy Mason ts-13-30)
    (busy Mason ts-16-30)

    (busy Dennis ts-09-00)
    (busy Dennis ts-14-30)

    (busy Brenda ts-10-30)
    (busy Brenda ts-12-00)
    (busy Brenda ts-12-30)
    (busy Brenda ts-13-00)
    (busy Brenda ts-14-30)
    (busy Brenda ts-15-00)
    (busy Brenda ts-16-00)
    (busy Brenda ts-16-30)

    (busy Juan ts-09-30)
    (busy Juan ts-10-30)
    (busy Juan ts-11-30)
    (busy Juan ts-12-00)
    (busy Juan ts-12-30)
    (busy Juan ts-14-30)
    (busy Juan ts-16-00)
    (busy Juan ts-16-30)

    (busy Angela ts-09-00)
    (busy Angela ts-09-30)
    (busy Angela ts-10-30)
    (busy Angela ts-11-30)
    (busy Angela ts-13-00)
    (busy Angela ts-15-00)
    (busy Angela ts-16-30)

    ;; Mason's stated preference: would rather not meet after 14:00.
    ;; Represented as explicit preferred timeslots (before/at 14:00 where he is available).
    (prefers Mason ts-09-00)
    (prefers Mason ts-09-30)
    (prefers Mason ts-10-00)
    (prefers Mason ts-10-30)
    (prefers Mason ts-11-00)
    (prefers Mason ts-11-30)
    (prefers Mason ts-12-00)
    (prefers Mason ts-12-30)
    (prefers Mason ts-13-00)
    (prefers Mason ts-14-00)
  )
  (:goal (exists (?t - timeslot) (scheduled m1 ?t)))
)