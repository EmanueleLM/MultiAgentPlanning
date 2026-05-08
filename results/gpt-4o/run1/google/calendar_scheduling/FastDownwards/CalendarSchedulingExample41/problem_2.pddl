(define (problem schedule_meeting_problem)
  (:domain meeting_scheduler)

  (:objects
    monday - day
    time_9_00 time_9_30 time_10_00 time_10_30 time_11_00
    time_11_30 time_12_00 time_12_30 time_13_00 time_13_30
    time_14_00 time_14_30 time_15_00 time_15_30 time_16_00 - time
    alan nancy patricia - participant
  )

  (:init
    (available alan time_9_00 monday)
    (available alan time_9_30 monday)
    (available alan time_10_00 monday)
    (available alan time_10_30 monday)
    (available alan time_11_00 monday)
    (available alan time_11_30 monday)
    (available alan time_12_00 monday)
    (available alan time_12_30 monday)
    (available alan time_13_00 monday)
    (available alan time_13_30 monday)
    (available alan time_14_00 monday)
    (available alan time_14_30 monday)
    (available alan time_15_00 monday)
    (available alan time_15_30 monday)
    (available alan time_16_00 monday)

    (available nancy time_9_00 monday)
    (available nancy time_9_30 monday)
    (available nancy time_10_00 monday)
    (available nancy time_10_30 monday)
    (available nancy time_12_30 monday)
    (available nancy time_13_30 monday)
    (available nancy time_15_00 monday)
    (available nancy time_15_30 monday)
    (available nancy time_16_00 monday)

    (available patricia time_9_00 monday)
    (available patricia time_9_30 monday)
    (available patricia time_12_00 monday)
    (available patricia time_12_30 monday)
    (available patricia time_13_00 monday)
    (available patricia time_13_30 monday)
    (available patricia time_16_00 monday)

    (preferred_start alan time_14_30 monday)

    (next_time time_9_00 time_9_30)
    (next_time time_9_30 time_10_00)
    (next_time time_10_00 time_10_30)
    (next_time time_10_30 time_11_00)
    (next_time time_11_00 time_11_30)
    (next_time time_11_30 time_12_00)
    (next_time time_12_00 time_12_30)
    (next_time time_12_30 time_13_00)
    (next_time time_13_00 time_13_30)
    (next_time time_13_30 time_14_00)
    (next_time time_14_00 time_14_30)
    (next_time time_14_30 time_15_00)
    (next_time time_15_00 time_15_30)
    (next_time time_15_30 time_16_00)
  )

  (:goal
    (forall (?t_start - time)
      (implies (preferred_start alan ?t_start monday)
               (meeting_scheduled alan nancy patricia ?t_start monday)))
  )
)