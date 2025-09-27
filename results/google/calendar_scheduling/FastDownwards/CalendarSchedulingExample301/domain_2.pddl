(define (domain schedule-meeting)
  (:requirements :typing :adl :universal-preconditions :action-costs)
  (:types participant slot meeting)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (available ?p - participant ?s - slot)
    (meeting-scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?s - slot)
    (attends ?p - participant ?m - meeting)
  )
  (:action schedule-at-0900
    :parameters (?m - meeting)
    :precondition (and (slot slot-0900) (forall (?p - participant) (available ?p slot-0900)))
    :cost 1
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-0900)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-0930
    :parameters (?m - meeting)
    :precondition (and (slot slot-0930) (forall (?p - participant) (available ?p slot-0930)))
    :cost 2
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-0930)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1000
    :parameters (?m - meeting)
    :precondition (and (slot slot-1000) (forall (?p - participant) (available ?p slot-1000)))
    :cost 3
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1000)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1030
    :parameters (?m - meeting)
    :precondition (and (slot slot-1030) (forall (?p - participant) (available ?p slot-1030)))
    :cost 4
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1030)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1100
    :parameters (?m - meeting)
    :precondition (and (slot slot-1100) (forall (?p - participant) (available ?p slot-1100)))
    :cost 5
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1100)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1130
    :parameters (?m - meeting)
    :precondition (and (slot slot-1130) (forall (?p - participant) (available ?p slot-1130)))
    :cost 6
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1130)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1200
    :parameters (?m - meeting)
    :precondition (and (slot slot-1200) (forall (?p - participant) (available ?p slot-1200)))
    :cost 7
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1200)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1230
    :parameters (?m - meeting)
    :precondition (and (slot slot-1230) (forall (?p - participant) (available ?p slot-1230)))
    :cost 8
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1230)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1300
    :parameters (?m - meeting)
    :precondition (and (slot slot-1300) (forall (?p - participant) (available ?p slot-1300)))
    :cost 9
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1300)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1330
    :parameters (?m - meeting)
    :precondition (and (slot slot-1330) (forall (?p - participant) (available ?p slot-1330)))
    :cost 10
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1330)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1400
    :parameters (?m - meeting)
    :precondition (and (slot slot-1400) (forall (?p - participant) (available ?p slot-1400)))
    :cost 11
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1400)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1430
    :parameters (?m - meeting)
    :precondition (and (slot slot-1430) (forall (?p - participant) (available ?p slot-1430)))
    :cost 12
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1430)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1500
    :parameters (?m - meeting)
    :precondition (and (slot slot-1500) (forall (?p - participant) (available ?p slot-1500)))
    :cost 13
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1500)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1530
    :parameters (?m - meeting)
    :precondition (and (slot slot-1530) (forall (?p - participant) (available ?p slot-1530)))
    :cost 14
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1530)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1600
    :parameters (?m - meeting)
    :precondition (and (slot slot-1600) (forall (?p - participant) (available ?p slot-1600)))
    :cost 15
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1600)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
  (:action schedule-at-1630
    :parameters (?m - meeting)
    :precondition (and (slot slot-1630) (forall (?p - participant) (available ?p slot-1630)))
    :cost 16
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m slot-1630)
              (forall (?p - participant) (attends ?p ?m))
            )
  )
)