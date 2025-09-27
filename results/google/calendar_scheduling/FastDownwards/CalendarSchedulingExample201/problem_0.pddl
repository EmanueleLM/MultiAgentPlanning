(define (problem schedule-meeting-problem)
  (:domain meeting-domain)
  (:objects
    sara sarah shirley harold terry - participant
    time0 time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 - time
  )
  (:init
    ;; time indices: time0 = 09:00, time1 = 09:30, ..., time15 = 16:30
    (= (time-index time0) 0)
    (= (time-index time1) 1)
    (= (time-index time2) 2)
    (= (time-index time3) 3)
    (= (time-index time4) 4)
    (= (time-index time5) 5)
    (= (time-index time6) 6)
    (= (time-index time7) 7)
    (= (time-index time8) 8)
    (= (time-index time9) 9)
    (= (time-index time10) 10)
    (= (time-index time11) 11)
    (= (time-index time12) 12)
    (= (time-index time13) 13)
    (= (time-index time14) 14)
    (= (time-index time15) 15)

    ;; initialize chosen-index to a large value
    (= (chosen-index) 100)

    ;; Busy intervals encoded as unavailable meeting start times (half-hour granularity)
    ;; sara: no busy intervals (fully available between 09:00 and 17:00)

    ;; sarah: meetings 12:00-12:30 (time6) and 15:00-15:30 (time12)
    (busy sarah time6)
    (busy sarah time12)

    ;; shirley: meetings 13:30-14:00 (time9) and 14:30-15:00 (time11)
    (busy shirley time9)
    (busy shirley time11)

    ;; harold: meetings 09:00-10:00 (time0,time1), 10:30-12:30 (time3,time4,time5,time6), 13:00-17:00 (time8..time15)
    (busy harold time0) (busy harold time1)
    (busy harold time3) (busy harold time4) (busy harold time5) (busy harold time6)
    (busy harold time8) (busy harold time9) (busy harold time10) (busy harold time11)
    (busy harold time12) (busy harold time13) (busy harold time14) (busy harold time15)

    ;; terry: meetings 09:00-10:00 (time0,time1), 10:30-11:30 (time3,time4), 12:00-17:00 (time6..time15)
    (busy terry time0) (busy terry time1)
    (busy terry time3) (busy terry time4)
    (busy terry time6) (busy terry time7) (busy terry time8) (busy terry time9)
    (busy terry time10) (busy terry time11) (busy terry time12) (busy terry time13)
    (busy terry time14) (busy terry time15)
  )

  (:goal (and (scheduled)))
  (:metric minimize (chosen-index))
)