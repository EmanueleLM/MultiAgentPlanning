(define (problem schedule-meeting-monday)
  (:domain schedule-meeting)

  (:objects
    diane kelly deborah - participant
    s0930 - slot
  )

  (:init
    (free diane s0930)
    (free kelly s0930)
    (free deborah s0930)
  )

  (:goal (scheduled))
)