(define (problem meeting_schedule_problem)
  (:domain schedule_meeting)
  (:objects
    ralph peter daniel - participant
    time_9_00 time_9_30 time_10_00 time_10_30
    time_11_00 time_11_30 time_12_00 time_12_30
    time_13_00 time_13_30 time_14_00 time_14_30
    time_15_00 time_15_30 time_16_00 time_16_30 - time_slot
  )
  (:init
    (next time_9_00 time_9_30)
    (next time_9_30 time_10_00)
    (next time_10_00 time_10_30)
    (next time_10_30 time_11_00)
    (next time_11_00 time_11_30)
    (next time_11_30 time_12_00)
    (next time_12_00 time_12_30)
    (next time_12_30 time_13_00)
    (next time_13_00 time_13_30)
    (next time_13_30 time_14_00)
    (next time_14_00 time_14_30)
    (next time_14_30 time_15_00)
    (next time_15_00 time_15_30)
    (next time_15_30 time_16_00)
    (next time_16_00 time_16_30)

    ; Ralph's availability
    (is_available ralph time_9_00)
    (is_available ralph time_9_30)
    (is_available ralph time_10_00)
    (is_available ralph time_10_30)
    (is_available ralph time_11_00)
    (is_available ralph time_11_30)
    (is_available ralph time_12_00)
    (is_available ralph time_12_30)
    (is_available ralph time_13_00)
    (is_available ralph time_15_00)
    (is_available ralph time_15_30)
    (is_available ralph time_16_00)
    (is_available ralph time_16_30)

    ; Peter's availability
    (is_available peter time_9_30)
    (is_available peter time_10_00)
    (is_available peter time_10_30)
    (is_available peter time_13_00)
    (is_available peter time_13_30)
    (is_available peter time_14_00)
    (is_available peter time_14_30)
    (is_available peter time_15_00)
    (is_available peter time_15_30)

    ; Daniel's availability
    (is_available daniel time_10_00)
    (is_available daniel time_15_30)

    ; Daniel's preferences to avoid
    (has_preference daniel time_13_30)
    (has_preference daniel time_14_00)
    (has_preference daniel time_14_30)
    (has_preference daniel time_15_00)
    (has_preference daniel time_15_30)
    (has_preference daniel time_16_00)
    (has_preference daniel time_16_30)
  )
  (:goal (exists (?t1 ?t2 - time_slot) (and 
    (meeting_scheduled ?t1 ?t2)
  )))
)