(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    p_donna p_john p_billy - participant
    ts_10_00 - timeslot
  )

  (:init
    (within-work ts_10_00)
  )

  (:goal (scheduled ts_10_00))
)