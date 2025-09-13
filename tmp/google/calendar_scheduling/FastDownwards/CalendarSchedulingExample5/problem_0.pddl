```pddl
(define (problem integrated_schedule_meeting_task)
  (:domain integrated_schedule_meeting)

  (:objects 
    charlotte lauren kathryn - person
    ts-09-00 ts-09-30 ts-10-00 ts-10-30 ts-11-00 ts-11-30 
    ts-12-00 ts-12-30 ts-13-00 ts-13-30 ts-14-00 ts-14-30
    ts-15-00 ts-15-30 ts-16-00 - time-slot
  )

  (:init
    ;; Kathryn's availability
    (available kathryn ts-09-30)
    (available kathryn ts-10-00)
    (available kathryn ts-11-00)
    (available kathryn ts-12-00)
    (available kathryn ts-12-30)
    (available kathryn ts-13-00)
    (available kathryn ts-14-30)
    (available kathryn ts-15-00)
    (available kathryn ts-15-30)
    (available kathryn ts-16-00)

    ;; Charlotte's availability
    (available charlotte ts-09-00)
    (available charlotte ts-09-30)
    (available charlotte ts-10-00)
    (available charlotte ts-10-30)
    (available charlotte ts-11-00)
    (available charlotte ts-11-30)
    (available charlotte ts-12-30)
    (available charlotte ts-13-00)

    ;; Lauren's availability
    (available lauren ts-10-00)
    (available lauren ts-10-30)
    (available lauren ts-11-00)
    (available lauren ts-11-30)
    (available lauren ts-12-30)
    (available lauren ts-13-00)
    (available lauren ts-14-30)
    (available lauren ts-15-30)
    (available lauren ts-16-00)
  )

  (:goal
    (exists (?t - time-slot) 
      (meeting_scheduled ?t)
    )
  )
)
```