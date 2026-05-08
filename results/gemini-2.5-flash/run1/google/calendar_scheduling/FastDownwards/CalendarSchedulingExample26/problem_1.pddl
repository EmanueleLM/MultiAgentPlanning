(define (problem calendar_scheduling_26)
    (:domain calendar_scheduling)
    (:objects
        katherine nicole kevin - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
        t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time_point
    )
    (:init
        ;; Define the linear progression of time points (30-minute intervals)
        (next_time t0900 t0930)
        (next_time t0930 t1000)
        (next_time t1000 t1030)
        (next_time t1030 t1100)
        (next_time t1100 t1130)
        (next_time t1130 t1200)
        (next_time t1200 t1230)
        (next_time t1230 t1300)
        (next_time t1300 t1330)
        (next_time t1330 t1400)
        (next_time t1400 t1430)
        (next_time t1430 t1500)
        (next_time t1500 t1530)
        (next_time t1530 t1600)
        (next_time t1600 t1630)
        (next_time t1630 t1700) ; The last point, marking 17:00 as the end of the last 30-min slot.

        ;; Katherine's schedule: free the entire day (9:00 to 17:00)
        (person_free katherine t0900)
        (person_free katherine t0930)
        (person_free katherine t1000)
        (person_free katherine t1030)
        (person_free katherine t1100)
        (person_free katherine t1130)
        (person_free katherine t1200)
        (person_free katherine t1230)
        (person_free katherine t1300)
        (person_free katherine t1330)
        (person_free katherine t1400)
        (person_free katherine t1430)
        (person_free katherine t1500)
        (person_free katherine t1530)
        (person_free katherine t1600)
        (person_free katherine t1630)

        ;; Nicole's schedule: wide open the entire day (9:00 to 17:00)
        (person_free nicole t0900)
        (person_free nicole t0930)
        (person_free nicole t1000)
        (person_free nicole t1030)
        (person_free nicole t1100)
        (person_free nicole t1130)
        (person_free nicole t1200)
        (person_free nicole t1230)
        (person_free nicole t1300)
        (person_free nicole t1330)
        (person_free nicole t1400)
        (person_free nicole t1430)
        (person_free nicole t1500)
        (person_free nicole t1530)
        (person_free nicole t1600)
        (person_free nicole t1630)

        ;; Kevin's schedule: (9:00 to 10:00, 10:30 to 11:30, 12:00 to 15:30, 16:30 to 17:00) are BLOCKED.
        ;; Kevin is free for 30-minute segments starting at these times:
        (person_free kevin t1000) ; Kevin is free 10:00-10:30
        (person_free kevin t1130) ; Kevin is free 11:30-12:00
        (person_free kevin t1530) ; Kevin is free 15:30-16:00
        (person_free kevin t1600) ; Kevin is free 16:00-16:30
    )
    (:goal (exists (?s1 - time_point ?s3 - time_point) (meeting_scheduled ?s1 ?s3)))
)