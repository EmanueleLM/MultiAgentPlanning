(define (problem calendar_scheduling_example34_problem)
    (:domain calendar_scheduling_example34)
    (:objects
        willie richard noah - person
        t900 t930 t1000 t1030 t1100 t1130 t1200 t1230
        t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time_point
    )
    (:init
        ;; Identify the specific people for the meeting
        (is_willie willie)
        (is_richard richard)
        (is_noah noah)

        ;; Temporal sequence of 30-minute slots
        (next t900 t930)
        (next t930 t1000)
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
        (next t1630 t1700) ; Added to represent the end of the 17:00 work day boundary

        ;; Willie's availability (free the entire day 9:00-17:00)
        (available willie t900)
        (available willie t930)
        (available willie t1000)
        (available willie t1030)
        (available willie t1100)
        (available willie t1130)
        (available willie t1200)
        (available willie t1230)
        (available willie t1300)
        (available willie t1330)
        (available willie t1400)
        (available willie t1430)
        (available willie t1500)
        (available willie t1530)
        (available willie t1600)
        (available willie t1630)

        ;; Richard's availability
        ;; Busy: 10:00-10:30 (t1000), 11:00-12:00 (t1100, t1130), 13:00-14:00 (t1300, t1330), 16:00-16:30 (t1600)
        ;; All other slots are available.
        (available richard t900)
        (available richard t930)
        (available richard t1030)
        (available richard t1200)
        (available richard t1230)
        (available richard t1400)
        (available richard t1430)
        (available richard t1500)
        (available richard t1530)
        (available richard t1630)

        ;; Noah's availability
        ;; Busy: 10:00-10:30 (t1000), 11:30-13:00 (t1130, t1200, t1230), 13:30-14:00 (t1330), 14:30-17:00 (t1430, t1500, t1530, t1600, t1630)
        ;; All other slots are available.
        (available noah t900)
        (available noah t930)
        (available noah t1030)
        (available noah t1100)
        (available noah t1300)
        (available noah t1400)
    )
    (:goal (or
        ;; All possible 1-hour slots from 9:00 to 17:00
        (meeting_scheduled t900 t1000)
        (meeting_scheduled t930 t1030)
        (meeting_scheduled t1000 t1100)
        (meeting_scheduled t1030 t1130)
        (meeting_scheduled t1100 t1200)
        (meeting_scheduled t1130 t1230)
        (meeting_scheduled t1200 t1300)
        (meeting_scheduled t1230 t1330)
        (meeting_scheduled t1300 t1400)
        (meeting_scheduled t1330 t1430)
        (meeting_scheduled t1400 t1500)
        (meeting_scheduled t1430 t1530)
        (meeting_scheduled t1500 t1600)
        (meeting_scheduled t1530 t1630)
        (meeting_scheduled t1600 t1700)
        )
    )
)