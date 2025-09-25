(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (meeting-scheduled)
    (scheduled ?s - slot)
  )

  (:action schedule-0900
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s0900) (free arthur s0930)
                    (free michael s0900) (free michael s0930)
                    (free samantha s0900) (free samantha s0930))
    :effect (and (meeting-scheduled) (scheduled s0900))
  )

  (:action schedule-0930
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s0930) (free arthur s1000)
                    (free michael s0930) (free michael s1000)
                    (free samantha s0930) (free samantha s1000))
    :effect (and (meeting-scheduled) (scheduled s0930))
  )

  (:action schedule-1000
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1000) (free arthur s1030)
                    (free michael s1000) (free michael s1030)
                    (free samantha s1000) (free samantha s1030))
    :effect (and (meeting-scheduled) (scheduled s1000))
  )

  (:action schedule-1030
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1030) (free arthur s1100)
                    (free michael s1030) (free michael s1100)
                    (free samantha s1030) (free samantha s1100))
    :effect (and (meeting-scheduled) (scheduled s1030))
  )

  (:action schedule-1100
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1100) (free arthur s1130)
                    (free michael s1100) (free michael s1130)
                    (free samantha s1100) (free samantha s1130))
    :effect (and (meeting-scheduled) (scheduled s1100))
  )

  (:action schedule-1130
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1130) (free arthur s1200)
                    (free michael s1130) (free michael s1200)
                    (free samantha s1130) (free samantha s1200))
    :effect (and (meeting-scheduled) (scheduled s1130))
  )

  (:action schedule-1200
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1200) (free arthur s1230)
                    (free michael s1200) (free michael s1230)
                    (free samantha s1200) (free samantha s1230))
    :effect (and (meeting-scheduled) (scheduled s1200))
  )

  (:action schedule-1230
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1230) (free arthur s1300)
                    (free michael s1230) (free michael s1300)
                    (free samantha s1230) (free samantha s1300))
    :effect (and (meeting-scheduled) (scheduled s1230))
  )

  (:action schedule-1300
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1300) (free arthur s1330)
                    (free michael s1300) (free michael s1330)
                    (free samantha s1300) (free samantha s1330))
    :effect (and (meeting-scheduled) (scheduled s1300))
  )

  (:action schedule-1330
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1330) (free arthur s1400)
                    (free michael s1330) (free michael s1400)
                    (free samantha s1330) (free samantha s1400))
    :effect (and (meeting-scheduled) (scheduled s1330))
  )

  (:action schedule-1400
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1400) (free arthur s1430)
                    (free michael s1400) (free michael s1430)
                    (free samantha s1400) (free samantha s1430))
    :effect (and (meeting-scheduled) (scheduled s1400))
  )

  (:action schedule-1430
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1430) (free arthur s1500)
                    (free michael s1430) (free michael s1500)
                    (free samantha s1430) (free samantha s1500))
    :effect (and (meeting-scheduled) (scheduled s1430))
  )

  (:action schedule-1500
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1500) (free arthur s1530)
                    (free michael s1500) (free michael s1530)
                    (free samantha s1500) (free samantha s1530))
    :effect (and (meeting-scheduled) (scheduled s1500))
  )

  (:action schedule-1530
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1530) (free arthur s1600)
                    (free michael s1530) (free michael s1600)
                    (free samantha s1530) (free samantha s1600))
    :effect (and (meeting-scheduled) (scheduled s1530))
  )

  (:action schedule-1600
    :parameters ()
    :precondition (and
                    (not (meeting-scheduled))
                    (free arthur s1600) (free arthur s1630)
                    (free michael s1600) (free michael s1630)
                    (free samantha s1600) (free samantha s1630))
    :effect (and (meeting-scheduled) (scheduled s1600))
  )
)