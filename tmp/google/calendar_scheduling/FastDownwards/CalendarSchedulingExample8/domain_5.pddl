(define (domain calendar-scheduling-integrated)
  (:requirements :typing :negative-preconditions)
  (:types person time)

  (:constants adam jerry matthew - person
              t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time)

  (:predicates
     (free ?p - person ?t - time)
     (scheduled ?t - time)
  )

  (:action schedule-meeting-adam
     :parameters (?t - time)
     :precondition (and (free adam ?t) (free jerry ?t) (free matthew ?t))
     :effect (and (not (free adam ?t)) (not (free jerry ?t)) (not (free matthew ?t)) (scheduled ?t))
  )

  (:action schedule-meeting-jerry
     :parameters (?t - time)
     :precondition (and (free adam ?t) (free jerry ?t) (free matthew ?t))
     :effect (and (not (free adam ?t)) (not (free jerry ?t)) (not (free matthew ?t)) (scheduled ?t))
  )

  (:action schedule-meeting-matthew
     :parameters (?t - time)
     :precondition (and (free adam ?t) (free jerry ?t) (free matthew ?t))
     :effect (and (not (free adam ?t)) (not (free jerry ?t)) (not (free matthew ?t)) (scheduled ?t))
  )
)