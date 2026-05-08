(define (problem calendar_scheduling_example_9)
  (:domain calendar_scheduling)
  (:objects
    diane kelly deborah - participant
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - time_slot
  )
  (:init
    ; Diane's availability
    (is_free diane t_09_30)
    (is_free diane t_10_00)
    (is_free diane t_10_30)
    (is_free diane t_11_00)
    (is_free diane t_11_30)
    (is_free diane t_12_30)
    (is_free diane t_13_00)
    (is_free diane t_13_30)
    (is_free diane t_14_00)
    (is_free diane t_15_30)
    (is_free diane t_16_00)
    (is_free diane t_16_30)

    ; Kelly's availability
    (is_free kelly t_09_00)
    (is_free kelly t_10_00)
    (is_free kelly t_11_00)
    (is_free kelly t_11_30)
    (is_free kelly t_12_00)
    (is_free kelly t_12_30)
    (is_free kelly t_13_00)
    (is_free kelly t_13_30)
    (is_free kelly t_14_00)
    (is_free kelly t_14_30)
    (is_free kelly t_15_00)
    (is_free kelly t_15_30)
    (is_free kelly t_16_00)
    (is_free kelly t_16_30)

    ; Deborah's availability
    (is_free deborah t_09_30)
    (is_free deborah t_14_00)
  )
  (:goal (exists (?t - time_slot) (meeting_scheduled ?t)))
)