(define (domain schedule-meeting)
  (:requirements :typing :adl :universal-preconditions :equality :fluents)
  (:types participant slot meeting)
  (:predicates
    (available ?p - participant ?s - slot)
    (meeting-scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?s - slot)
    (attends ?p - participant ?m - meeting)
  )
  (:functions (total-cost))

  (:action schedule-at-0900
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-0900))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-0900)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 1)
            )
  )

  (:action schedule-at-0930
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-0930))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-0930)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 2)
            )
  )

  (:action schedule-at-1000
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1000))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1000)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 3)
            )
  )

  (:action schedule-at-1030
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1030))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1030)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 4)
            )
  )

  (:action schedule-at-1100
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1100))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1100)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 5)
            )
  )

  (:action schedule-at-1130
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1130))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1130)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 6)
            )
  )

  (:action schedule-at-1200
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1200))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1200)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 7)
            )
  )

  (:action schedule-at-1230
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1230))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1230)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 8)
            )
  )

  (:action schedule-at-1300
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1300))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1300)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 9)
            )
  )

  (:action schedule-at-1330
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1330))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1330)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 10)
            )
  )

  (:action schedule-at-1400
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1400))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1400)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 11)
            )
  )

  (:action schedule-at-1430
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1430))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1430)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 12)
            )
  )

  (:action schedule-at-1500
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1500))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1500)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 13)
            )
  )

  (:action schedule-at-1530
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1530))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1530)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 14)
            )
  )

  (:action schedule-at-1600
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1600))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1600)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 15)
            )
  )

  (:action schedule-at-1630
    :parameters (?m - meeting)
    :precondition (forall (?p - participant) (available ?p slot-1630))
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1630)
              (forall (?p - participant) (attends ?p ?m))
              (increase (total-cost) 16)
            )
  )
)