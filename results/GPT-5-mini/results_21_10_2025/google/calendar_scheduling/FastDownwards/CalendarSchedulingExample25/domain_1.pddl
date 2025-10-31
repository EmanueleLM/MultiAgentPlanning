(define (domain meeting-schedule-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (slot ?s - slot)
    (next ?s - slot ?t - slot)               ; consecutive 30-min slots: ?s is immediately before ?t
    (free ?a - agent ?s - slot)              ; participant ?a is free during slot ?s
    (meeting-scheduled)                      ; there is exactly one meeting scheduled
    (meeting-started-at ?s - slot)           ; meeting started at slot ?s
    (attends ?a - agent)                     ; participant ?a attends the scheduled meeting
  )

  ;; Actions: schedule a 60-minute meeting (two consecutive 30-min slots).
  ;; Each action requires both consecutive slots to be free for each participant.
  ;; The negative precondition (not (meeting-scheduled)) prevents scheduling more than one meeting.

  (:action schedule-at-s0900
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s0900) (free anthony s0930)
      (free pamela s0900)  (free pamela s0930)
      (free zachary s0900) (free zachary s0930)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s0900)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s0930
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s0930) (free anthony s1000)
      (free pamela s0930)  (free pamela s1000)
      (free zachary s0930) (free zachary s1000)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s0930)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1000
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1000) (free anthony s1030)
      (free pamela s1000)  (free pamela s1030)
      (free zachary s1000) (free zachary s1030)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1000)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1030
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1030) (free anthony s1100)
      (free pamela s1030)  (free pamela s1100)
      (free zachary s1030) (free zachary s1100)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1030)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1100
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1100) (free anthony s1130)
      (free pamela s1100)  (free pamela s1130)
      (free zachary s1100) (free zachary s1130)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1100)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1130
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1130) (free anthony s1200)
      (free pamela s1130)  (free pamela s1200)
      (free zachary s1130) (free zachary s1200)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1130)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1200
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1200) (free anthony s1230)
      (free pamela s1200)  (free pamela s1230)
      (free zachary s1200) (free zachary s1230)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1200)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1230
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1230) (free anthony s1300)
      (free pamela s1230)  (free pamela s1300)
      (free zachary s1230) (free zachary s1300)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1230)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1300
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1300) (free anthony s1330)
      (free pamela s1300)  (free pamela s1330)
      (free zachary s1300) (free zachary s1330)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1300)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1330
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1330) (free anthony s1400)
      (free pamela s1330)  (free pamela s1400)
      (free zachary s1330) (free zachary s1400)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1330)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1400
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1400) (free anthony s1430)
      (free pamela s1400)  (free pamela s1430)
      (free zachary s1400) (free zachary s1430)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1400)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1430
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1430) (free anthony s1500)
      (free pamela s1430)  (free pamela s1500)
      (free zachary s1430) (free zachary s1500)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1430)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1500
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1500) (free anthony s1530)
      (free pamela s1500)  (free pamela s1530)
      (free zachary s1500) (free zachary s1530)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1500)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1530
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1530) (free anthony s1600)
      (free pamela s1530)  (free pamela s1600)
      (free zachary s1530) (free zachary s1600)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1530)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )

  (:action schedule-at-s1600
    :parameters ()
    :precondition (and
      (not (meeting-scheduled))
      (free anthony s1600) (free anthony s1630)
      (free pamela s1600)  (free pamela s1630)
      (free zachary s1600) (free zachary s1630)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-started-at s1600)
      (attends anthony) (attends pamela) (attends zachary)
    )
  )
)