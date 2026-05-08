(define (problem calendar_scheduling_example27)
  (:domain calendar_scheduling)

  (:goal (meeting_scheduled))

  (:init
    ;; Jesse busy: 10:00-10:30 (s1000), 15:30-16:00 (s1530)
    (busy jesse s1000)
    (busy jesse s1530)

    ;; Kathryn: no busy facts (calendar wide open) -- nothing to add

    ;; Megan busy:
    ;; 10:30-11:00 -> s1030
    ;; 11:30-12:30 -> s1130, s1200
    ;; 13:30-14:30 -> s1330, s1400
    ;; 15:00-16:30 -> s1500, s1530, s1600
    (busy megan s1030)
    (busy megan s1130)
    (busy megan s1200)
    (busy megan s1330)
    (busy megan s1400)
    (busy megan s1500)
    (busy megan s1530)
    (busy megan s1600)
  )
)