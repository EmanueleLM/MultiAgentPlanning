(define (domain meeting-scheduler)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )

  (:action schedule-ts-0900
    :precondition (and (not (scheduled ts-0900)) (free adam ts-0900) (free jerry ts-0900) (free matthew ts-0900))
    :effect (and (scheduled ts-0900) (meeting-scheduled))
  )

  (:action schedule-ts-0930
    :precondition (and (not (scheduled ts-0930)) (free adam ts-0930) (free jerry ts-0930) (free matthew ts-0930))
    :effect (and (scheduled ts-0930) (meeting-scheduled))
  )

  (:action schedule-ts-1000
    :precondition (and (not (scheduled ts-1000)) (free adam ts-1000) (free jerry ts-1000) (free matthew ts-1000))
    :effect (and (scheduled ts-1000) (meeting-scheduled))
  )

  (:action schedule-ts-1030
    :precondition (and (not (scheduled ts-1030)) (free adam ts-1030) (free jerry ts-1030) (free matthew ts-1030))
    :effect (and (scheduled ts-1030) (meeting-scheduled))
  )

  (:action schedule-ts-1100
    :precondition (and (not (scheduled ts-1100)) (free adam ts-1100) (free jerry ts-1100) (free matthew ts-1100))
    :effect (and (scheduled ts-1100) (meeting-scheduled))
  )

  (:action schedule-ts-1130
    :precondition (and (not (scheduled ts-1130)) (free adam ts-1130) (free jerry ts-1130) (free matthew ts-1130))
    :effect (and (scheduled ts-1130) (meeting-scheduled))
  )

  (:action schedule-ts-1200
    :precondition (and (not (scheduled ts-1200)) (free adam ts-1200) (free jerry ts-1200) (free matthew ts-1200))
    :effect (and (scheduled ts-1200) (meeting-scheduled))
  )

  (:action schedule-ts-1230
    :precondition (and (not (scheduled ts-1230)) (free adam ts-1230) (free jerry ts-1230) (free matthew ts-1230))
    :effect (and (scheduled ts-1230) (meeting-scheduled))
  )

  (:action schedule-ts-1300
    :precondition (and (not (scheduled ts-1300)) (free adam ts-1300) (free jerry ts-1300) (free matthew ts-1300))
    :effect (and (scheduled ts-1300) (meeting-scheduled))
  )

  (:action schedule-ts-1330
    :precondition (and (not (scheduled ts-1330)) (free adam ts-1330) (free jerry ts-1330) (free matthew ts-1330))
    :effect (and (scheduled ts-1330) (meeting-scheduled))
  )

  (:action schedule-ts-1400
    :precondition (and (not (scheduled ts-1400)) (free adam ts-1400) (free jerry ts-1400) (free matthew ts-1400))
    :effect (and (scheduled ts-1400) (meeting-scheduled))
  )

  (:action schedule-ts-1430
    :precondition (and (not (scheduled ts-1430)) (free adam ts-1430) (free jerry ts-1430) (free matthew ts-1430))
    :effect (and (scheduled ts-1430) (meeting-scheduled))
  )

  (:action schedule-ts-1500
    :precondition (and (not (scheduled ts-1500)) (free adam ts-1500) (free jerry ts-1500) (free matthew ts-1500))
    :effect (and (scheduled ts-1500) (meeting-scheduled))
  )

  (:action schedule-ts-1530
    :precondition (and (not (scheduled ts-1530)) (free adam ts-1530) (free jerry ts-1530) (free matthew ts-1530))
    :effect (and (scheduled ts-1530) (meeting-scheduled))
  )

  (:action schedule-ts-1600
    :precondition (and (not (scheduled ts-1600)) (free adam ts-1600) (free jerry ts-1600) (free matthew ts-1600))
    :effect (and (scheduled ts-1600) (meeting-scheduled))
  )

  (:action schedule-ts-1630
    :precondition (and (not (scheduled ts-1630)) (free adam ts-1630) (free jerry ts-1630) (free matthew ts-1630))
    :effect (and (scheduled ts-1630) (meeting-scheduled))
  )
)