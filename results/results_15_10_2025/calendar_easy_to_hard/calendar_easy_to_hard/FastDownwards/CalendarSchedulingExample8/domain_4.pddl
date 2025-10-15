(define (domain meeting-scheduler)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )

  (:action schedule_ts0900
    :parameters ()
    :precondition (and (not (scheduled ts0900)) (free adam ts0900) (free jerry ts0900) (free matthew ts0900))
    :effect (and (scheduled ts0900) (meeting-scheduled))
  )

  (:action schedule_ts0930
    :parameters ()
    :precondition (and (not (scheduled ts0930)) (free adam ts0930) (free jerry ts0930) (free matthew ts0930))
    :effect (and (scheduled ts0930) (meeting-scheduled))
  )

  (:action schedule_ts1000
    :parameters ()
    :precondition (and (not (scheduled ts1000)) (free adam ts1000) (free jerry ts1000) (free matthew ts1000))
    :effect (and (scheduled ts1000) (meeting-scheduled))
  )

  (:action schedule_ts1030
    :parameters ()
    :precondition (and (not (scheduled ts1030)) (free adam ts1030) (free jerry ts1030) (free matthew ts1030))
    :effect (and (scheduled ts1030) (meeting-scheduled))
  )

  (:action schedule_ts1100
    :parameters ()
    :precondition (and (not (scheduled ts1100)) (free adam ts1100) (free jerry ts1100) (free matthew ts1100))
    :effect (and (scheduled ts1100) (meeting-scheduled))
  )

  (:action schedule_ts1130
    :parameters ()
    :precondition (and (not (scheduled ts1130)) (free adam ts1130) (free jerry ts1130) (free matthew ts1130))
    :effect (and (scheduled ts1130) (meeting-scheduled))
  )

  (:action schedule_ts1200
    :parameters ()
    :precondition (and (not (scheduled ts1200)) (free adam ts1200) (free jerry ts1200) (free matthew ts1200))
    :effect (and (scheduled ts1200) (meeting-scheduled))
  )

  (:action schedule_ts1230
    :parameters ()
    :precondition (and (not (scheduled ts1230)) (free adam ts1230) (free jerry ts1230) (free matthew ts1230))
    :effect (and (scheduled ts1230) (meeting-scheduled))
  )

  (:action schedule_ts1300
    :parameters ()
    :precondition (and (not (scheduled ts1300)) (free adam ts1300) (free jerry ts1300) (free matthew ts1300))
    :effect (and (scheduled ts1300) (meeting-scheduled))
  )

  (:action schedule_ts1330
    :parameters ()
    :precondition (and (not (scheduled ts1330)) (free adam ts1330) (free jerry ts1330) (free matthew ts1330))
    :effect (and (scheduled ts1330) (meeting-scheduled))
  )

  (:action schedule_ts1400
    :parameters ()
    :precondition (and (not (scheduled ts1400)) (free adam ts1400) (free jerry ts1400) (free matthew ts1400))
    :effect (and (scheduled ts1400) (meeting-scheduled))
  )

  (:action schedule_ts1430
    :parameters ()
    :precondition (and (not (scheduled ts1430)) (free adam ts1430) (free jerry ts1430) (free matthew ts1430))
    :effect (and (scheduled ts1430) (meeting-scheduled))
  )

  (:action schedule_ts1500
    :parameters ()
    :precondition (and (not (scheduled ts1500)) (free adam ts1500) (free jerry ts1500) (free matthew ts1500))
    :effect (and (scheduled ts1500) (meeting-scheduled))
  )

  (:action schedule_ts1530
    :parameters ()
    :precondition (and (not (scheduled ts1530)) (free adam ts1530) (free jerry ts1530) (free matthew ts1530))
    :effect (and (scheduled ts1530) (meeting-scheduled))
  )

  (:action schedule_ts1600
    :parameters ()
    :precondition (and (not (scheduled ts1600)) (free adam ts1600) (free jerry ts1600) (free matthew ts1600))
    :effect (and (scheduled ts1600) (meeting-scheduled))
  )

  (:action schedule_ts1630
    :parameters ()
    :precondition (and (not (scheduled ts1630)) (free adam ts1630) (free jerry ts1630) (free matthew ts1630))
    :effect (and (scheduled ts1630) (meeting-scheduled))
  )
)