(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    kathryn charlotte lauren - person
    slot-10-00-10-30 slot-11-00-11-30 slot-12-30-13-00 slot-13-00-13-30 - slot
  )
  (:init
    (available kathryn slot-10-00-10-30)
    (available charlotte slot-10-00-10-30)
    (available lauren slot-10-00-10-30)

    (available kathryn slot-11-00-11-30)
    (available charlotte slot-11-00-11-30)
    (available lauren slot-11-00-11-30)

    (available kathryn slot-12-30-13-00)
    (available charlotte slot-12-30-13-00)
    (available lauren slot-12-30-13-00)

    (available kathryn slot-13-00-13-30)
    (available charlotte slot-13-00-13-30)
    (available lauren slot-13-00-13-30)
  )
  (:goal (scheduled))
)