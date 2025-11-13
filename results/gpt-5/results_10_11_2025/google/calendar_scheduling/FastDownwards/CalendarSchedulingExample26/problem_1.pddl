(define (problem calendarschedulingexample26-problem)
  (:domain calendarschedulingexample26)

  (:objects
    katherine nicole kevin - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    (next t0900 t0930)
    (next t0930 t1000)
    (next t1000 t1030)
    (next t1030 t1100)
    (next t1100 t1130)
    (next t1130 t1200)
    (next t1200 t1230)
    (next t1230 t1300)
    (next t1300 t1330)
    (next t1330 t1400)
    (next t1400 t1430)
    (next t1430 t1500)
    (next t1500 t1530)
    (next t1530 t1600)
    (next t1600 t1630)

    (has-next t0900)
    (has-next t0930)
    (has-next t1000)
    (has-next t1030)
    (has-next t1100)
    (has-next t1130)
    (has-next t1200)
    (has-next t1230)
    (has-next t1300)
    (has-next t1330)
    (has-next t1400)
    (has-next t1430)
    (has-next t1500)
    (has-next t1530)
    (has-next t1600)

    ; audited intersection: only 15:30-16:30 is valid (start at t1530)
    (allowed-start t1530)

    ; availability
    ; Katherine: free all work-hour slots
    (free katherine t0900)
    (free katherine t0930)
    (free katherine t1000)
    (free katherine t1030)
    (free katherine t1100)
    (free katherine t1130)
    (free katherine t1200)
    (free katherine t1230)
    (free katherine t1300)
    (free katherine t1330)
    (free katherine t1400)
    (free katherine t1430)
    (free katherine t1500)
    (free katherine t1530)
    (free katherine t1600)
    (free katherine t1630)

    ; Nicole: free all work-hour slots
    (free nicole t0900)
    (free nicole t0930)
    (free nicole t1000)
    (free nicole t1030)
    (free nicole t1100)
    (free nicole t1130)
    (free nicole t1200)
    (free nicole t1230)
    (free nicole t1300)
    (free nicole t1330)
    (free nicole t1400)
    (free nicole t1430)
    (free nicole t1500)
    (free nicole t1530)
    (free nicole t1600)
    (free nicole t1630)

    ; Kevin: free only outside busy times
    (free kevin t1000)
    (free kevin t1130)
    (free kevin t1530)
    (free kevin t1600)
  )

  (:goal
    (and
      (chosen-set)
      (attended katherine)
      (attended nicole)
      (attended kevin)
    )
  )
)