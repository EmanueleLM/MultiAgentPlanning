(define (problem calendar_scheduling_example16)
  (:domain calendar_scheduling)
  (:objects
    scott gabriel christine - person
    ; Time slots from 9:00 to 17:00, in 30-minute increments.
    ; A slot 'tHHMM' represents the start of a 30-minute interval.
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
  )
  (:init
    ; Scott's availability based on busy times: 9:30-10:30, 13:30-14:00, 14:30-15:00, 15:30-16:00, 16:30-17:00
    (is_available scott t0900)  ; 9:00-9:30
    ;(is_available scott t0930) ; Busy 9:30-10:30
    ;(is_available scott t1000) ; Busy 9:30-10:30
    (is_available scott t1030) ; 10:30-11:00
    (is_available scott t1100) ; 11:00-11:30
    (is_available scott t1130) ; 11:30-12:00
    (is_available scott t1200) ; 12:00-12:30
    (is_available scott t1230) ; 12:30-13:00
    (is_available scott t1300) ; 13:00-13:30
    ;(is_available scott t1330) ; Busy 13:30-14:00
    (is_available scott t1400) ; 14:00-14:30
    ;(is_available scott t1430) ; Busy 14:30-15:00
    (is_available scott t1500) ; 15:00-15:30
    ;(is_available scott t1530) ; Busy 15:30-16:00
    (is_available scott t1600) ; 16:00-16:30
    ;(is_available scott t1630) ; Busy 16:30-17:00

    ; Gabriel's availability (No meetings the whole day)
    (is_available gabriel t0900)
    (is_available gabriel t0930)
    (is_available gabriel t1000)
    (is_available gabriel t1030)
    (is_available gabriel t1100)
    (is_available gabriel t1130)
    (is_available gabriel t1200)
    (is_available gabriel t1230)
    (is_available gabriel t1300)
    (is_available gabriel t1330)
    (is_available gabriel t1400)
    (is_available gabriel t1430)
    (is_available gabriel t1500)
    (is_available gabriel t1530)
    (is_available gabriel t1600)
    (is_available gabriel t1630)

    ; Christine's availability based on busy times: 9:00-10:00, 10:30-12:30, 13:00-17:00
    ;(is_available christine t0900) ; Busy 9:00-10:00
    ;(is_available christine t0930) ; Busy 9:00-10:00
    (is_available christine t1000) ; 10:00-10:30
    ;(is_available christine t1030) ; Busy 10:30-12:30
    ;(is_available christine t1100) ; Busy 10:30-12:30
    ;(is_available christine t1130) ; Busy 10:30-12:30
    ;(is_available christine t1200) ; Busy 10:30-12:30
    (is_available christine t1230) ; 12:30-13:00
    ;(is_available christine t1300) ; Busy 13:00-17:00
    ;(is_available christine t1330) ; Busy 13:00-17:00
    ;(is_available christine t1400) ; Busy 13:00-17:00
    ;(is_available christine t1430) ; Busy 13:00-17:00
    ;(is_available christine t1500) ; Busy 13:00-17:00
    ;(is_available christine t1530) ; Busy 13:00-17:00
    ;(is_available christine t1600) ; Busy 13:00-17:00
    ;(is_available christine t1630) ; Busy 13:00-17:00
  )
  (:goal (exists (?t - time_slot) (meeting_scheduled ?t)))
)