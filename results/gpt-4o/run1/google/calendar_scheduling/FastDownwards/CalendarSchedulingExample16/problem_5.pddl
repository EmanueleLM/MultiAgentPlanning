(define (problem schedule_meeting_instance)
  (:domain meeting_scheduler)
  (:objects
    scott gabriel christine - participant
    time_9_00 time_9_30 time_10_00 time_10_30
    time_11_00 time_11_30 time_12_00 time_12_30
    time_13_00 time_13_30 time_14_00 time_14_30
    time_15_00 time_15_30 time_16_00 time_16_30
    time_17_00 - time
  )
  (:init
    (consecutive time_9_00 time_9_30)
    (consecutive time_9_30 time_10_00)
    (consecutive time_10_00 time_10_30)
    (consecutive time_10_30 time_11_00)
    (consecutive time_11_00 time_11_30)
    (consecutive time_11_30 time_12_00)
    (consecutive time_12_00 time_12_30)
    (consecutive time_12_30 time_13_00)
    (consecutive time_13_00 time_13_30)
    (consecutive time_13_30 time_14_00)
    (consecutive time_14_00 time_14_30)
    (consecutive time_14_30 time_15_00)
    (consecutive time_15_00 time_15_30)
    (consecutive time_15_30 time_16_00)
    (consecutive time_16_00 time_16_30)
    (consecutive time_16_30 time_17_00)

    (is_busy scott time_9_30 time_10_00)
    (is_busy christine time_10_30 time_11_00)

    (forall (?p - participant ?t1 - time ?t2 - time)
      (when (and (not (is_busy ?p ?t1 ?t2)) (not (meeting_scheduled ?t1 ?t2)))
          (participant_available ?p ?t1 ?t2))

    (free_slot time_9_00 time_9_30)
    (free_slot time_10_00 time_10_30)
    (free_slot time_12_30 time_13_00)
  )
  (:goal
    (exists (?t1 - time ?t2 - time)
      (meeting_scheduled ?t1 ?t2)
    )
  )
)