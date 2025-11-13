(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    brian billy patricia - person
    ts-12_30_13_00 ts-13_00_13_30 - timeslot
  )

  (:init
    (candidate ts-12_30_13_00)
    (candidate ts-13_00_13_30)

    (work-slot ts-12_30_13_00)
    (work-slot ts-13_00_13_30)

    (slot-next ts-12_30_13_00 ts-13_00_13_30)

    (free brian ts-12_30_13_00)
    (free brian ts-13_00_13_30)

    (free billy ts-12_30_13_00)
    (free billy ts-13_00_13_30)

    (free patricia ts-12_30_13_00)
    (free patricia ts-13_00_13_30)
  )

  (:goal (meeting-scheduled))
)