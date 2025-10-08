(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (free ?p - person ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )

  ;; Actions: one action per possible 30-minute start slot.
  ;; Each action requires that the meeting has not already been scheduled
  ;; and that every participant is free at that slot.
  (:action schedule-s0900
    :precondition (and (not (scheduled))
                       (free diane s0900)
                       (free kelly s0900)
                       (free deborah s0900))
    :effect (and (scheduled) (meeting-at s0900))
  )

  (:action schedule-s0930
    :precondition (and (not (scheduled))
                       (free diane s0930)
                       (free kelly s0930)
                       (free deborah s0930))
    :effect (and (scheduled) (meeting-at s0930))
  )

  (:action schedule-s1000
    :precondition (and (not (scheduled))
                       (free diane s1000)
                       (free kelly s1000)
                       (free deborah s1000))
    :effect (and (scheduled) (meeting-at s1000))
  )

  (:action schedule-s1030
    :precondition (and (not (scheduled))
                       (free diane s1030)
                       (free kelly s1030)
                       (free deborah s1030))
    :effect (and (scheduled) (meeting-at s1030))
  )

  (:action schedule-s1100
    :precondition (and (not (scheduled))
                       (free diane s1100)
                       (free kelly s1100)
                       (free deborah s1100))
    :effect (and (scheduled) (meeting-at s1100))
  )

  (:action schedule-s1130
    :precondition (and (not (scheduled))
                       (free diane s1130)
                       (free kelly s1130)
                       (free deborah s1130))
    :effect (and (scheduled) (meeting-at s1130))
  )

  (:action schedule-s1200
    :precondition (and (not (scheduled))
                       (free diane s1200)
                       (free kelly s1200)
                       (free deborah s1200))
    :effect (and (scheduled) (meeting-at s1200))
  )

  (:action schedule-s1230
    :precondition (and (not (scheduled))
                       (free diane s1230)
                       (free kelly s1230)
                       (free deborah s1230))
    :effect (and (scheduled) (meeting-at s1230))
  )

  (:action schedule-s1300
    :precondition (and (not (scheduled))
                       (free diane s1300)
                       (free kelly s1300)
                       (free deborah s1300))
    :effect (and (scheduled) (meeting-at s1300))
  )

  (:action schedule-s1330
    :precondition (and (not (scheduled))
                       (free diane s1330)
                       (free kelly s1330)
                       (free deborah s1330))
    :effect (and (scheduled) (meeting-at s1330))
  )

  (:action schedule-s1400
    :precondition (and (not (scheduled))
                       (free diane s1400)
                       (free kelly s1400)
                       (free deborah s1400))
    :effect (and (scheduled) (meeting-at s1400))
  )

  (:action schedule-s1430
    :precondition (and (not (scheduled))
                       (free diane s1430)
                       (free kelly s1430)
                       (free deborah s1430))
    :effect (and (scheduled) (meeting-at s1430))
  )

  (:action schedule-s1500
    :precondition (and (not (scheduled))
                       (free diane s1500)
                       (free kelly s1500)
                       (free deborah s1500))
    :effect (and (scheduled) (meeting-at s1500))
  )

  (:action schedule-s1530
    :precondition (and (not (scheduled))
                       (free diane s1530)
                       (free kelly s1530)
                       (free deborah s1530))
    :effect (and (scheduled) (meeting-at s1530))
  )

  (:action schedule-s1600
    :precondition (and (not (scheduled))
                       (free diane s1600)
                       (free kelly s1600)
                       (free deborah s1600))
    :effect (and (scheduled) (meeting-at s1600))
  )

  (:action schedule-s1630
    :precondition (and (not (scheduled))
                       (free diane s1630)
                       (free kelly s1630)
                       (free deborah s1630))
    :effect (and (scheduled) (meeting-at s1630))
  )
)