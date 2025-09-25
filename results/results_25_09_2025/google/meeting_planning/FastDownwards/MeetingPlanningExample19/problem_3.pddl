(define (problem schedule-meeting-visitor-john)
  (:domain multi-agent-meeting)

  (:objects
    visitor john - agent
    ggp ph - location
    t_morning t_after_travel t_jstart t_20_00 t_20_30 t_20_45 - time
  )

  (:init
    (at visitor ggp)
    (at john ph)
    (time-is t_morning)
    (john-available-at t_jstart)
    (john-available-at t_20_00)
  )

  (:goal (met visitor john))
)