(define (problem schedule-meeting-problem)
  (:domain meeting-domain)
  (:objects
    sara sarah shirley harold terry - participant
    time0 time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 - time
  )
  (:init
    (before time0 time1) (before time0 time2) (before time0 time3) (before time0 time4) (before time0 time5) (before time0 time6) (before time0 time7) (before time0 time8) (before time0 time9) (before time0 time10) (before time0 time11) (before time0 time12) (before time0 time13) (before time0 time14) (before time0 time15)
    (before time1 time2) (before time1 time3) (before time1 time4) (before time1 time5) (before time1 time6) (before time1 time7) (before time1 time8) (before time1 time9) (before time1 time10) (before time1 time11) (before time1 time12) (before time1 time13) (before time1 time14) (before time1 time15)
    (before time2 time3) (before time2 time4) (before time2 time5) (before time2 time6) (before time2 time7) (before time2 time8) (before time2 time9) (before time2 time10) (before time2 time11) (before time2 time12) (before time2 time13) (before time2 time14) (before time2 time15)
    (before time3 time4) (before time3 time5) (before time3 time6) (before time3 time7) (before time3 time8) (before time3 time9) (before time3 time10) (before time3 time11) (before time3 time12) (before time3 time13) (before time3 time14) (before time3 time15)
    (before time4 time5) (before time4 time6) (before time4 time7) (before time4 time8) (before time4 time9) (before time4 time10) (before time4 time11) (before time4 time12) (before time4 time13) (before time4 time14) (before time4 time15)
    (before time5 time6) (before time5 time7) (before time5 time8) (before time5 time9) (before time5 time10) (before time5 time11) (before time5 time12) (before time5 time13) (before time5 time14) (before time5 time15)
    (before time6 time7) (before time6 time8) (before time6 time9) (before time6 time10) (before time6 time11) (before time6 time12) (before time6 time13) (before time6 time14) (before time6 time15)
    (before time7 time8) (before time7 time9) (before time7 time10) (before time7 time11) (before time7 time12) (before time7 time13) (before time7 time14) (before time7 time15)
    (before time8 time9) (before time8 time10) (before time8 time11) (before time8 time12) (before time8 time13) (before time8 time14) (before time8 time15)
    (before time9 time10) (before time9 time11) (before time9 time12) (before time9 time13) (before time9 time14) (before time9 time15)
    (before time10 time11) (before time10 time12) (before time10 time13) (before time10 time14) (before time10 time15)
    (before time11 time12) (before time11 time13) (before time11 time14) (before time11 time15)
    (before time12 time13) (before time12 time14) (before time12 time15)
    (before time13 time14) (before time13 time15)
    (before time14 time15)

    (busy sarah time6)
    (busy sarah time12)

    (busy shirley time9)
    (busy shirley time11)

    (busy harold time0) (busy harold time1)
    (busy harold time3) (busy harold time4) (busy harold time5) (busy harold time6)
    (busy harold time8) (busy harold time9) (busy harold time10) (busy harold time11)
    (busy harold time12) (busy harold time13) (busy harold time14) (busy harold time15)

    (busy terry time0) (busy terry time1)
    (busy terry time3) (busy terry time4)
    (busy terry time6) (busy terry time7) (busy terry time8) (busy terry time9)
    (busy terry time10) (busy terry time11) (busy terry time12) (busy terry time13)
    (busy terry time14) (busy terry time15)

    (available time2)
  )
  (:goal (and (scheduled)))
)