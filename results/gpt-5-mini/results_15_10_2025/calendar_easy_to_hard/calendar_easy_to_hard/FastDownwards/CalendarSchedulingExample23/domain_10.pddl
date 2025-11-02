(define (domain meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :equality :fluents)
  (:types participant slot meeting)
  (:constants
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )
  (:predicates
    (free ?p - participant ?s - slot)
    (assigned ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
  )
  (:functions (total-cost))

  (:action schedule-0900
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-0900))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-0900)
      (forall (?p - participant) (not (free ?p slot-0900)))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-0930
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-0930))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-0930)
      (forall (?p - participant) (not (free ?p slot-0930)))
      (increase (total-cost) 2)
    )
  )

  (:action schedule-1000
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1000))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1000)
      (forall (?p - participant) (not (free ?p slot-1000)))
      (increase (total-cost) 3)
    )
  )

  (:action schedule-1030
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1030))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1030)
      (forall (?p - participant) (not (free ?p slot-1030)))
      (increase (total-cost) 4)
    )
  )

  (:action schedule-1100
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1100))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1100)
      (forall (?p - participant) (not (free ?p slot-1100)))
      (increase (total-cost) 5)
    )
  )

  (:action schedule-1130
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1130))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1130)
      (forall (?p - participant) (not (free ?p slot-1130)))
      (increase (total-cost) 6)
    )
  )

  (:action schedule-1200
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1200))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1200)
      (forall (?p - participant) (not (free ?p slot-1200)))
      (increase (total-cost) 7)
    )
  )

  (:action schedule-1230
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1230))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1230)
      (forall (?p - participant) (not (free ?p slot-1230)))
      (increase (total-cost) 8)
    )
  )

  (:action schedule-1300
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1300))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1300)
      (forall (?p - participant) (not (free ?p slot-1300)))
      (increase (total-cost) 9)
    )
  )

  (:action schedule-1330
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1330))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1330)
      (forall (?p - participant) (not (free ?p slot-1330)))
      (increase (total-cost) 10)
    )
  )

  (:action schedule-1400
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1400))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1400)
      (forall (?p - participant) (not (free ?p slot-1400)))
      (increase (total-cost) 11)
    )
  )

  (:action schedule-1430
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1430))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1430)
      (forall (?p - participant) (not (free ?p slot-1430)))
      (increase (total-cost) 12)
    )
  )

  (:action schedule-1500
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1500))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1500)
      (forall (?p - participant) (not (free ?p slot-1500)))
      (increase (total-cost) 13)
    )
  )

  (:action schedule-1530
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1530))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1530)
      (forall (?p - participant) (not (free ?p slot-1530)))
      (increase (total-cost) 14)
    )
  )

  (:action schedule-1600
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1600))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1600)
      (forall (?p - participant) (not (free ?p slot-1600)))
      (increase (total-cost) 15)
    )
  )

  (:action schedule-1630
    :parameters (?m - meeting)
    :precondition (and
      (not (assigned ?m))
      (forall (?p - participant) (free ?p slot-1630))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1630)
      (forall (?p - participant) (not (free ?p slot-1630)))
      (increase (total-cost) 16)
    )
  )
)