(define (problem calendar_scheduling_instance)
  (:domain calendar_scheduling)
  (:objects
    slot_0 slot_1 slot_2 slot_3 slot_4 slot_5 slot_6 slot_7 slot_8 slot_9 slot_10 slot_11 slot_12 slot_13 slot_14 slot_15 - time_slot
  )
  (:init
    (= (total-cost) 0)

    ; Theresa's busy schedule: 9:00-9:30, 12:30-13:30, 14:00-15:00, 16:30-17:00
    (busy theresa slot_0)   ; 9:00-9:30
    (busy theresa slot_7)   ; 12:30-13:00
    (busy theresa slot_8)   ; 13:00-13:30
    (busy theresa slot_10)  ; 14:00-14:30
    (busy theresa slot_11)  ; 14:30-15:00
    (busy theresa slot_15)  ; 16:30-17:00

    ; Charles's busy schedule: 10:00-10:30, 11:30-12:30, 14:00-15:30
    (busy charles slot_2)   ; 10:00-10:30
    (busy charles slot_5)   ; 11:30-12:00
    (busy charles slot_6)   ; 12:00-12:30
    (busy charles slot_10)  ; 14:00-14:30
    (busy charles slot_11)  ; 14:30-15:00
    (busy charles slot_12)  ; 15:00-15:30

    ; Betty's busy schedule: 9:00-10:30, 12:00-12:30, 13:00-14:00, 15:00-16:00
    (busy betty slot_0)     ; 9:00-9:30
    (busy betty slot_1)     ; 9:30-10:00
    (busy betty slot_2)     ; 10:00-10:30
    (busy betty slot_6)     ; 12:00-12:30
    (busy betty slot_8)     ; 13:00-13:30
    (busy betty slot_9)     ; 13:30-14:00
    (busy betty slot_12)    ; 15:00-15:30
    (busy betty slot_13)    ; 15:30-16:00
  )
  (:goal (meeting_found))
  (:metric minimize (total-cost))
)