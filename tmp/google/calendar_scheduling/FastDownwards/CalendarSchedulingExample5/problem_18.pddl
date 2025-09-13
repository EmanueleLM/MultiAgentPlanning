(define (problem integrated_schedule_meeting_task)
  (:domain integrated_schedule_meeting)

  (:objects 
    ts-09-00 ts-09-30 ts-10-00 ts-10-30 ts-11-00 ts-11-30 
    ts-12-00 ts-12-30 ts-13-00 ts-13-30 ts-14-00 ts-14-30
    ts-15-00 ts-15-30 ts-16-00 ts-16-30 - time-slot
  )

  (:init
    ;; Time-slot adjacency
    (adjacent ts-09-00 ts-09-30)
    (adjacent ts-09-30 ts-10-00)
    (adjacent ts-10-00 ts-10-30)
    (adjacent ts-10-30 ts-11-00)
    (adjacent ts-11-00 ts-11-30)
    (adjacent ts-11-30 ts-12-00)
    (adjacent ts-12-00 ts-12-30)
    (adjacent ts-12-30 ts-13-00)
    (adjacent ts-13-00 ts-13-30)
    (adjacent ts-13-30 ts-14-00)
    (adjacent ts-14-00 ts-14-30)
    (adjacent ts-14-30 ts-15-00)
    (adjacent ts-15-00 ts-15-30)
    (adjacent ts-15-30 ts-16-00)
    (adjacent ts-16-00 ts-16-30)

    ;; Kathryn's availability
    (available_kathryn ts-09-30)
    (available_kathryn ts-10-00)
    (available_kathryn ts-11-00)
    (available_kathryn ts-12-00)
    (available_kathryn ts-12-30)
    (available_kathryn ts-13-00)
    (available_kathryn ts-14-30)
    (available_kathryn ts-15-00)
    (available_kathryn ts-15-30)
    (available_kathryn ts-16-00)

    ;; Charlotte's availability
    (available_charlotte ts-09-00)
    (available_charlotte ts-09-30)
    (available_charlotte ts-10-00)
    (available_charlotte ts-10-30)
    (available_charlotte ts-11-00)
    (available_charlotte ts-11-30)
    (available_charlotte ts-12-00)
    (available_charlotte ts-12-30)
    (available_charlotte ts-13-00)

    ;; Lauren's availability
    (available_lauren ts-10-00)
    (available_lauren ts-10-30)
    (available_lauren ts-11-00)
    (available_lauren ts-11-30)
    (available_lauren ts-12-30)
    (available_lauren ts-13-00)
    (available_lauren ts-14-30)
    (available_lauren ts-15-30)
    (available_lauren ts-16-00)

    ;; Constraints on meeting time to respect Charlotte's preferences
    (before_1330 ts-09-00)
    (before_1330 ts-09-30)
    (before_1330 ts-10-00)
    (before_1330 ts-10-30)
    (before_1330 ts-11-00)
    (before_1330 ts-11-30)
    (before_1330 ts-12-00)
    (before_1330 ts-12-30)
    (before_1330 ts-13-00)
  )

  (:goal
    (exists (?t1 ?t2 - time-slot) 
      (and 
        (meeting_scheduled ?t1)
        (meeting_scheduled ?t2)
        (adjacent ?t1 ?t2)
      )
    )
  )
)