(define (problem schedule_meeting_monday)
  (:domain jack_of_all_trades)

  (:objects
    meeting1 - meeting
    t_9_00 t_9_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - slot
  )

  (:init
    ;; teresa busy slots (9:00-10:00, 13:00-13:30, 14:00-14:30, 15:00-15:30, 16:30-17:00)
    (busy teresa t_9_00)
    (busy teresa t_9_30)
    (busy teresa t_13_00)
    (busy teresa t_14_00)
    (busy teresa t_15_00)
    (busy teresa t_16_30)

    ;; kathleen busy slots (9:00-9:30, 12:30-13:00, 13:30-14:00, 15:00-15:30)
    (busy kathleen t_9_00)
    (busy kathleen t_12_30)
    (busy kathleen t_13_30)
    (busy kathleen t_15_00)

    ;; patricia busy slots (9:00-10:30, 11:30-12:00, 13:00-13:30, 14:00-14:30,
    ;;                      15:30-16:00, 16:30-17:00)
    (busy patricia t_9_00)
    (busy patricia t_9_30)
    (busy patricia t_10_00)
    (busy patricia t_11_30)
    (busy patricia t_13_00)
    (busy patricia t_14_00)
    (busy patricia t_15_30)
    (busy patricia t_16_30)

    ;; allowed slots given kathleen's preference (no meetings after 14:30)
    (early_slot t_9_00)
    (early_slot t_9_30)
    (early_slot t_10_00)
    (early_slot t_10_30)
    (early_slot t_11_00)
    (early_slot t_11_30)
    (early_slot t_12_00)
    (early_slot t_12_30)
    (early_slot t_13_00)
    (early_slot t_13_30)
    (early_slot t_14_00)
    (early_slot t_14_30)
  )

  (:goal
    (meeting_confirmed meeting1)
  )
)