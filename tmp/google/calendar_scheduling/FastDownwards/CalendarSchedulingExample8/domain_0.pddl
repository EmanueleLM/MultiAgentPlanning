(define (domain meeting-planner-integrated)
  (:requirements :typing)
  (:types person time)

  (:constants Adam Jerry Matthew - person
              t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time)

  (:predicates
     (free ?p - person ?t - time)
     (scheduled ?t - time)
  )

  (:action schedule-meeting-Adam
     :parameters (?t - time)
     :precondition (and (free Adam ?t) (free Jerry ?t) (free Matthew ?t) (not (scheduled ?t)))
     :effect (and (not (free Adam ?t)) (not (free Jerry ?t)) (not (free Matthew ?t)) (scheduled ?t))
  )

  (:action schedule-meeting-Jerry
     :parameters (?t - time)
     :precondition (and (free Adam ?t) (free Jerry ?t) (free Matthew ?t) (not (scheduled ?t)))
     :effect (and (not (free Adam ?t)) (not (free Jerry ?t)) (not (free Matthew ?t)) (scheduled ?t))
  )

  (:action schedule-meeting-Matthew
     :parameters (?t - time)
     :precondition (and (free Adam ?t) (free Jerry ?t) (free Matthew ?t) (not (scheduled ?t)))
     :effect (and (not (free Adam ?t)) (not (free Jerry ?t)) (not (free Matthew ?t)) (scheduled ?t))
  )
)