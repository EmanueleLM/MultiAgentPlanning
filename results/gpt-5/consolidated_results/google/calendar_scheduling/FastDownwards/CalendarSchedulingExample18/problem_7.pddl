(define (problem monday_meeting_brian_billy_patricia)
  (:domain meeting-scheduling)
  (:objects
    brian billy patricia - person
    t1230_1300 t1300_1330 - timeslot
  )
  (:init
    (candidate t1230_1300)
    (candidate t1300_1330)
    (within-work-hours t1230_1300)
    (within-work-hours t1300_1330)

    (free brian t1230_1300)
    (free brian t1300_1330)
    (free billy t1230_1300)
    (free billy t1300_1330)
    (free patricia t1230_1300)
    (free patricia t1300_1330)

    (all-free t1230_1300)
    (all-free t1300_1330)
  )
  (:goal
    (and (meeting-scheduled))
  )
)