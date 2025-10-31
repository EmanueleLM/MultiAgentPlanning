(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents :existential-preconditions)
  (:types agent time)

  (:predicates
    (workhour ?t - time)
    (proposed ?t - time)
    (none-proposed)
    (available-raymond ?t - time)
    (available-billy ?t - time)
    (available-donald ?t - time)
    (agreed-raymond ?t - time)
    (agreed-billy ?t - time)
    (agreed-donald ?t - time)
  )

  (:functions
    (penalty-raymond ?t - time)
    (penalty-billy ?t - time)
    (penalty-donald ?t - time)
    (total-cost)
  )

  ;; Raymond actions
  (:action propose-raymond-first
    :parameters (?t - time)
    :precondition (and (none-proposed) (available-raymond ?t) (workhour ?t))
    :effect (and
              (not (none-proposed))
              (proposed ?t)
              (agreed-raymond ?t)
              (increase (total-cost) (penalty-raymond ?t))
            )
  )

  (:action propose-raymond-follow
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available-raymond ?t) (workhour ?t) (not (agreed-raymond ?t)))
    :effect (and
              (agreed-raymond ?t)
              (increase (total-cost) (penalty-raymond ?t))
            )
  )

  ;; Billy actions
  (:action propose-billy-first
    :parameters (?t - time)
    :precondition (and (none-proposed) (available-billy ?t) (workhour ?t))
    :effect (and
              (not (none-proposed))
              (proposed ?t)
              (agreed-billy ?t)
              (increase (total-cost) (penalty-billy ?t))
            )
  )

  (:action propose-billy-follow
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available-billy ?t) (workhour ?t) (not (agreed-billy ?t)))
    :effect (and
              (agreed-billy ?t)
              (increase (total-cost) (penalty-billy ?t))
            )
  )

  ;; Donald actions
  (:action propose-donald-first
    :parameters (?t - time)
    :precondition (and (none-proposed) (available-donald ?t) (workhour ?t))
    :effect (and
              (not (none-proposed))
              (proposed ?t)
              (agreed-donald ?t)
              (increase (total-cost) (penalty-donald ?t))
            )
  )

  (:action propose-donald-follow
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available-donald ?t) (workhour ?t) (not (agreed-donald ?t)))
    :effect (and
              (agreed-donald ?t)
              (increase (total-cost) (penalty-donald ?t))
            )
  )
)