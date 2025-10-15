(define (domain meeting-scheduler)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )

  (:action schedule_ts_0900
    :parameters ()
    :precondition (and (not (scheduled ts_0900)) (free adam ts_0900) (free jerry ts_0900) (free matthew ts_0900))
    :effect (and (scheduled ts_0900) (meeting-scheduled))
  )

  (:action schedule_ts_0930
    :parameters ()
    :precondition (and (not (scheduled ts_0930)) (free adam ts_0930) (free jerry ts_0930) (free matthew ts_0930))
    :effect (and (scheduled ts_0930) (meeting-scheduled))
  )

  (:action schedule_ts_1000
    :parameters ()
    :precondition (and (not (scheduled ts_1000)) (free adam ts_1000) (free jerry ts_1000) (free matthew ts_1000))
    :effect (and (scheduled ts_1000) (meeting-scheduled))
  )

  (:action schedule_ts_1030
    :parameters ()
    :precondition (and (not (scheduled ts_1030)) (free adam ts_1030) (free jerry ts_1030) (free matthew ts_1030))
    :effect (and (scheduled ts_1030) (meeting-scheduled))
  )

  (:action schedule_ts_1100
    :parameters ()
    :precondition (and (not (scheduled ts_1100)) (free adam ts_1100) (free jerry ts_1100) (free matthew ts_1100))
    :effect (and (scheduled ts_1100) (meeting-scheduled))
  )

  (:action schedule_ts_1130
    :parameters ()
    :precondition (and (not (scheduled ts_1130)) (free adam ts_1130) (free jerry ts_1130) (free matthew ts_1130))
    :effect (and (scheduled ts_1130) (meeting-scheduled))
  )

  (:action schedule_ts_1200
    :parameters ()
    :precondition (and (not (scheduled ts_1200)) (free adam ts_1200) (free jerry ts_1200) (free matthew ts_1200))
    :effect (and (scheduled ts_1200) (meeting-scheduled))
  )

  (:action schedule_ts_1230
    :parameters ()
    :precondition (and (not (scheduled ts_1230)) (free adam ts_1230) (free jerry ts_1230) (free matthew ts_1230))
    :effect (and (scheduled ts_1230) (meeting-scheduled))
  )

  (:action schedule_ts_1300
    :parameters ()
    :precondition (and (not (scheduled ts_1300)) (free adam ts_1300) (free jerry ts_1300) (free matthew ts_1300))
    :effect (and (scheduled ts_1300) (meeting-scheduled))
  )

  (:action schedule_ts_1330
    :parameters ()
    :precondition (and (not (scheduled ts_1330)) (free adam ts_1330) (free jerry ts_1330) (free matthew ts_1330))
    :effect (and (scheduled ts_1330) (meeting-scheduled))
  )

  (:action schedule_ts_1400
    :parameters ()
    :precondition (and (not (scheduled ts_1400)) (free adam ts_1400) (free jerry ts_1400) (free matthew ts_1400))
    :effect (and (scheduled ts_1400) (meeting-scheduled))
  )

  (:action schedule_ts_1430
    :parameters ()
    :precondition (and (not (scheduled ts_1430)) (free adam ts_1430) (free jerry ts_1430) (free matthew ts_1430))
    :effect (and (scheduled ts_1430) (meeting-scheduled))
  )

  (:action schedule_ts_1500
    :parameters ()
    :precondition (and (not (scheduled ts_1500)) (free adam ts_1500) (free jerry ts_1500) (free matthew ts_1500))
    :effect (and (scheduled ts_1500) (meeting-scheduled))
  )

  (:action schedule_ts_1530
    :parameters ()
    :precondition (and (not (scheduled ts_1530)) (free adam ts_1530) (free jerry ts_1530) (free matthew ts_1530))
    :effect (and (scheduled ts_1530) (meeting-scheduled))
  )

  (:action schedule_ts_1600
    :parameters ()
    :precondition (and (not (scheduled ts_1600)) (free adam ts_1600) (free jerry ts_1600) (free matthew ts_1600))
    :effect (and (scheduled ts_1600) (meeting-scheduled))
  )

  (:action schedule_ts_1630
    :parameters ()
    :precondition (and (not (scheduled ts_1630)) (free adam ts_1630) (free jerry ts_1630) (free matthew ts_1630))
    :effect (and (scheduled ts_1630) (meeting-scheduled))
  )
)