(define (problem calendar_scheduling_example_9)
  (:domain calendar_scheduling)
  (:objects
    diane kelly deborah - participant
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - time_slot
  )
  (:init
    ; Diane's availability (Busy: 9:00-9:30, 12:00-12:30, 14:30-15:30)
    (is_free diane t_09_30) ; 9:30-10:00
    (is_free diane t_10_00) ; 10:00-10:30
    (is_free diane t_10_30) ; 10:30-11:00
    (is_free diane t_11_00) ; 11:00-11:30
    (is_free diane t_11_30) ; 11:30-12:00
    (is_free diane t_12_30) ; 12:30-13:00
    (is_free diane t_13_00) ; 13:00-13:30
    (is_free diane t_13_30) ; 13:30-14:00
    (is_free diane t_14_00) ; 14:00-14:30
    (is_free diane t_15_30) ; 15:30-16:00
    (is_free diane t_16_00) ; 16:00-16:30
    (is_free diane t_16_30) ; 16:30-17:00

    ; Kelly's availability (Busy: 9:30-10:00, 10:30-11:00)
    (is_free kelly t_09_00) ; 9:00-9:30
    (is_free kelly t_10_00) ; 10:00-10:30
    (is_free kelly t_11_00) ; 11:00-11:30
    (is_free kelly t_11_30) ; 11:30-12:00
    (is_free kelly t_12_00) ; 12:00-12:30
    (is_free kelly t_12_30) ; 12:30-13:00
    (is_free kelly t_13_00) ; 13:00-13:30
    (is_free kelly t_13_30) ; 13:30-14:00
    (is_free kelly t_14_00) ; 14:00-14:30
    (is_free kelly t_14_30) ; 14:30-15:00
    (is_free kelly t_15_00) ; 15:00-15:30
    (is_free kelly t_15_30) ; 15:30-16:00
    (is_free kelly t_16_00) ; 16:00-16:30
    (is_free kelly t_16_30) ; 16:30-17:00

    ; Deborah's availability (Busy: 9:00-9:30, 10:00-14:00, 14:30-17:00)
    (is_free deborah t_09_30) ; 9:30-10:00
    (is_free deborah t_14_00) ; 14:00-14:30
  )
  (:goal (exists (?t - time_slot) (meeting_scheduled ?t)))
)