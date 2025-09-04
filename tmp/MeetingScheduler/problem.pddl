(define (problem organized-meeting-monday)
  (:domain meeting-scheduler)
  
  (:objects
    ts_9-10 ts_10-11 ts_11-12 ts_12-13
    ts_13-14 ts_14-15 ts_15-16 ts_16-17 - time_slot
    michelle steven jerry - agent
  )
  
  (:init
    (available michelle ts_9-10)
    (available michelle ts_10-11)
    (available michelle ts_12-13)
    (available michelle ts_13-14)
    (available michelle ts_14-15)
    (available michelle ts_15-16)
    (available michelle ts_16-17)

    (available steven ts_9-10)
    (available steven ts_10-11)
    (available steven ts_12-13)
    (available steven ts_14-15)
    (available steven ts_16-17)

    (available jerry ts_12-13)
    (available jerry ts_14-15)
  )
  
  (:goal
    (exists (?t - time_slot)
      (and
        (meeting-scheduled ?t)
        (available michelle ?t)
        (available steven ?t)
        (available jerry ?t))))
)