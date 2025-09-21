(define (problem schedule-diane-kelly-deborah-monday)
  (:domain meeting-scheduling-integrated)

  (:objects
    diane kelly deborah - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ;; work hours precomputed as predicates for each timeslot
    (within-work-hours t0900) (within-work-hours t0930) (within-work-hours t1000)
    (within-work-hours t1030) (within-work-hours t1100) (within-work-hours t1130)
    (within-work-hours t1200) (within-work-hours t1230) (within-work-hours t1300)
    (within-work-hours t1330) (within-work-hours t1400) (within-work-hours t1430)
    (within-work-hours t1500) (within-work-hours t1530) (within-work-hours t1600)
    (within-work-hours t1630)

    ;; Diane's free times (private information encoded in the integrated problem)
    ;; Busy: 9:00-9:30, 12:00-12:30, 14:30-15:30 -> those slots not listed as free
    (free diane t0930) (free diane t1000) (free diane t1030)
    (free diane t1100) (free diane t1130) (free diane t1230)
    (free diane t1300) (free diane t1330) (free diane t1400)
    (free diane t1530) (free diane t1600) (free diane t1630)

    ;; Kelly's free times (busy 9:30-10:00, 10:30-11:00)
    (free kelly t0900) (free kelly t1000) (free kelly t1100)
    (free kelly t1130) (free kelly t1200) (free kelly t1230)
    (free kelly t1300) (free kelly t1330) (free kelly t1400)
    (free kelly t1430) (free kelly t1500) (free kelly t1530)
    (free kelly t1600) (free kelly t1630)

    ;; Deborah's free times (busy 9:00-9:30, 10:00-14:00, 14:30-17:00)
    (free deborah t0930) (free deborah t1400)

    ;; initialize cost
    (= (total-cost) 0)
  )

  (:goal (meeting-confirmed))

  (:metric minimize (total-cost))
)