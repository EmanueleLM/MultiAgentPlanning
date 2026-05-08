(define (problem find-common-slot)
  (:domain common-meeting-scheduler)
  (:objects
    t900 t930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - time-point
  )
  (:init
    (= (total-cost) 0)

    ; Stephen's availability for a 1-hour slot (busy: 10:00-10:30, 13:00-13:30, 14:30-15:00, 16:00-16:30)
    (stephen-available t900)  ; 9:00 - 10:00
    (stephen-available t1030) ; 10:30 - 11:30
    (stephen-available t1100) ; 11:00 - 12:00
    (stephen-available t1130) ; 11:30 - 12:30
    (stephen-available t1200) ; 12:00 - 13:00
    (stephen-available t1330) ; 13:30 - 14:30
    (stephen-available t1500) ; 15:00 - 16:00

    ; Edward's availability for a 1-hour slot (busy: 9:00-9:30, 10:00-10:30, 13:30-14:30, 15:00-16:00)
    (edward-available t1030) ; 10:30 - 11:30
    (edward-available t1100) ; 11:00 - 12:00
    (edward-available t1130) ; 11:30 - 12:30
    (edward-available t1200) ; 12:00 - 13:00
    (edward-available t1230) ; 12:30 - 13:30
    (edward-available t1300) ; 13:00 - 14:00
    (edward-available t1430) ; 14:30 - 15:30
    (edward-available t1600) ; 16:00 - 17:00

    ; Angela's availability for a 1-hour slot (busy: 9:00-11:30, 12:30-13:00, 13:30-15:30, 16:00-17:00)
    (angela-available t1130) ; 11:30 - 12:30
    (angela-available t1530) ; 15:30 - 16:30
  )
  (:goal (exists (?t - time-point) (meeting-scheduled ?t)))
  (:metric minimize (total-cost))
)