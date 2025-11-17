(define (problem monday_meeting_brian_billy_patricia)
  (:domain meeting-scheduling)
  (:objects
    brian billy patricia - person
    t1230_1300 t1300_1330 t1600_1630 - timeslot
  )
  (:init
    ; candidate timeslots audited as valid common availability
    (candidate t1230_1300)
    (candidate t1300_1330)
    (candidate t1600_1630)

    ; individual availability at candidates
    (free brian t1230_1300)
    (free brian t1300_1330)
    (free brian t1600_1630)

    (free billy t1230_1300)
    (free billy t1300_1330)
    (free billy t1600_1630)

    (free patricia t1230_1300)
    (free patricia t1300_1330)
    (free patricia t1600_1630)

    ; compiled convenience facts: all participants free at these candidates
    (all-free t1230_1300)
    (all-free t1300_1330)
    (all-free t1600_1630)
  )
  (:goal
    (and (meeting-scheduled))
  )
)