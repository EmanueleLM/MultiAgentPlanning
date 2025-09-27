(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :fluents)
  (:types participant time)

  (:predicates
    (available ?p - participant ?t - time)
    (unscheduled)
    (scheduled)
    (meeting-at ?t - time)
  )

  (:functions (total-cost))

  (:action schedule-t0900
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t0900) (available helen t0900) (available arthur t0900)
      (available ethan t0900) (available beverly t0900) (available deborah t0900)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t0900)
      (increase (total-cost) 0)
    )
  )

  (:action schedule-t0930
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t0930) (available helen t0930) (available arthur t0930)
      (available ethan t0930) (available beverly t0930) (available deborah t0930)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t0930)
      (increase (total-cost) 30)
    )
  )

  (:action schedule-t1000
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1000) (available helen t1000) (available arthur t1000)
      (available ethan t1000) (available beverly t1000) (available deborah t1000)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1000)
      (increase (total-cost) 60)
    )
  )

  (:action schedule-t1030
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1030) (available helen t1030) (available arthur t1030)
      (available ethan t1030) (available beverly t1030) (available deborah t1030)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1030)
      (increase (total-cost) 90)
    )
  )

  (:action schedule-t1100
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1100) (available helen t1100) (available arthur t1100)
      (available ethan t1100) (available beverly t1100) (available deborah t1100)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1100)
      (increase (total-cost) 120)
    )
  )

  (:action schedule-t1130
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1130) (available helen t1130) (available arthur t1130)
      (available ethan t1130) (available beverly t1130) (available deborah t1130)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1130)
      (increase (total-cost) 150)
    )
  )

  (:action schedule-t1200
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1200) (available helen t1200) (available arthur t1200)
      (available ethan t1200) (available beverly t1200) (available deborah t1200)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1200)
      (increase (total-cost) 180)
    )
  )

  (:action schedule-t1230
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1230) (available helen t1230) (available arthur t1230)
      (available ethan t1230) (available beverly t1230) (available deborah t1230)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1230)
      (increase (total-cost) 210)
    )
  )

  (:action schedule-t1300
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1300) (available helen t1300) (available arthur t1300)
      (available ethan t1300) (available beverly t1300) (available deborah t1300)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1300)
      (increase (total-cost) 240)
    )
  )

  (:action schedule-t1330
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1330) (available helen t1330) (available arthur t1330)
      (available ethan t1330) (available beverly t1330) (available deborah t1330)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1330)
      (increase (total-cost) 270)
    )
  )

  (:action schedule-t1400
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1400) (available helen t1400) (available arthur t1400)
      (available ethan t1400) (available beverly t1400) (available deborah t1400)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1400)
      (increase (total-cost) 300)
    )
  )

  (:action schedule-t1430
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1430) (available helen t1430) (available arthur t1430)
      (available ethan t1430) (available beverly t1430) (available deborah t1430)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1430)
      (increase (total-cost) 330)
    )
  )

  (:action schedule-t1500
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1500) (available helen t1500) (available arthur t1500)
      (available ethan t1500) (available beverly t1500) (available deborah t1500)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1500)
      (increase (total-cost) 360)
    )
  )

  (:action schedule-t1530
    :parameters ()
    :precondition (and
      (unscheduled)
      (available diane t1530) (available helen t1530) (available arthur t1530)
      (available ethan t1530) (available beverly t1530) (available deborah t1530)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at t1530)
      (increase (total-cost) 390)
    )
  )
)